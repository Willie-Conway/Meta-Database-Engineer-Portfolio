-- Script for Little Lemon Database Management
-- This script includes procedures for managing bookings in the Little Lemon restaurant.

-- 1. Insert records into the Bookings table
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, NumberOfGuests, SpecialRequests, `Status`) VALUES
('B101', '2022-10-10', 5, 'C5091', 4, 'Birtday Celebration', 'Confirmed'),
('B102', '2022-11-12', 3, 'C7513', 7, 'Allergic to nuts', 'Confirmed'),
('B103', '2022-10-11', 2, 'C5467', 3, 'High chair needed', 'Confirmed'),
('B104', '2022-10-13', 2, 'C4367', 10, 'Window seat', 'Confirmed');

-- Task 1: Populate the Bookings table with initial records.

-- 2. Create CheckBooking Procedure
DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE booking_status VARCHAR(100);
    
    -- Check if the table is booked on the given date
    IF EXISTS (SELECT * FROM Bookings WHERE BookingDate = booking_date AND TableNumber = table_number) THEN
        SET booking_status = CONCAT('Table ', table_number, ' is Booked');
    ELSE
        SET booking_status = CONCAT('Table ', table_number, ' is Available');
    END IF;

    -- Output the booking status message
    SELECT booking_status AS `Booking Status`;
END //

DELIMITER ;

-- Task 2: Create a stored procedure to check booking status for a specific table and date.

-- 3. Create AddValidBooking Procedure
DELIMITER //

-- Procedure to add a valid booking with a manually provided BookingID
CREATE PROCEDURE AddValidBooking(
    IN booking_id VARCHAR(10),        -- Input: Booking ID (manually provided)
    IN booking_date DATE,             -- Input: Date of the booking
    IN table_number INT,              -- Input: Table number for the booking
    IN customer_id VARCHAR(50),       -- Input: ID of the customer making the booking
    IN number_of_guests INT,          -- Input: Number of guests for table
    IN special_requests VARCHAR(255), -- Input: Special request for guests 
    IN status VARCHAR(50)     -- Input: Current status of the booking request
)
BEGIN
    DECLARE booking_status VARCHAR(100);  -- Variable to store the booking status message
    
    -- Start the transaction to ensure data integrity (all or nothing approach)
    START TRANSACTION;

    -- Check if the specified table is already booked on the given date
    IF EXISTS (
        SELECT * FROM Bookings 
        WHERE BookingDate = booking_date AND TableNumber = table_number
    ) THEN
        -- If the table is already booked, set the status message and rollback the transaction
        SET booking_status = CONCAT('Table ', table_number, ' is already booked - booking cancelled.');
        ROLLBACK;  -- Cancel the transaction to avoid inserting any data
    ELSE
        -- If the table is available, insert the new booking with the provided BookingID
        INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, NumberOfGuests, SpecialRequests, Status) 
        VALUES (booking_id, booking_date, table_number, customer_id, number_of_guests, special_requests, status);
        
        -- Set the status message confirming the booking
        SET booking_status = CONCAT('Booking confirmed for Table ', table_number, '!');
        COMMIT;  -- Commit the transaction to save the new booking in the database
    END IF;

    -- Output the booking status message to inform the user about the result
    SELECT booking_status AS `Booking Status`;
END //

DELIMITER ;



-- Task 3: Create a stored procedure to add a booking if the table is available,
--         or decline the booking if it is already booked.

-- Example calls to test the procedures
-- CALL CheckBooking('2022-10-10', 5);
-- CALL CheckBooking('2022-10-10', 3);
-- CALL AddValidBooking('B010','2022-10-10', 5,'C002', 4, 'Birthday Celebration', 'Pending');
-- CALL AddValidBooking('B105','2022-10-11', 3, 'C003', 5, 'Military Graduation', 'Confirmed');