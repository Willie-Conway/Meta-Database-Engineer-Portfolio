-- Task 1: Create the BookingAudit table to log booking actions
CREATE TABLE IF NOT EXISTS BookingAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for audit logs
    ActionType VARCHAR(10),                  -- Type of action (INSERT or DELETE)
    BookingID VARCHAR(50),                   -- Booking ID as VARCHAR(50)
    BookingDate DATE,                        -- Date of booking
    TableNumber INT,                         -- Table number
    CustomerID VARCHAR(50),                  -- Customer ID as VARCHAR(50)
    ActionTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Timestamp of action
);

-- Task 2: Create a trigger for logging after a new booking is inserted
DELIMITER //
CREATE TRIGGER AfterBookingInsert
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    -- Insert an audit record after a new booking is inserted
    INSERT INTO BookingAudit (ActionType, BookingID, BookingDate, TableNumber, CustomerID)
    VALUES ('INSERT', NEW.BookingID, NEW.BookingDate, NEW.TableNumber, NEW.CustomerID);
END //
DELIMITER ;

-- Task 3: Create a trigger for logging after a booking is deleted
DELIMITER //
CREATE TRIGGER AfterBookingDelete
AFTER DELETE ON Bookings
FOR EACH ROW
BEGIN
    -- Insert an audit record after a booking is deleted
    INSERT INTO BookingAudit (ActionType, BookingID, BookingDate, TableNumber, CustomerID)
    VALUES ('DELETE', OLD.BookingID, OLD.BookingDate, OLD.TableNumber, OLD.CustomerID);
END //
DELIMITER ;

