-- Setting the delimiter to // to define the body of stored procedures.
DELIMITER //

-- Task 1: Create a Stored Procedure to Add a New Booking
-- This procedure adds a new booking record to the Bookings table.
CREATE PROCEDURE AddBooking(
    IN bookingID VARCHAR(50),
    IN customerID VARCHAR(50),
    IN bookingDate DATE,
    IN tableNumber INT,
    IN number_of_guests INT,
    IN special_requests VARCHAR(255),
    IN status VARCHAR(50)

)
BEGIN
    -- Inserting a new booking record into the Bookings table
    INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber, NumberOfGuests, SpecialRequests, Status) 
    VALUES (bookingID, customerID, bookingDate, tableNumber, number_of_guests, special_requests, status);  -- Using input parameters for the insert

    -- Returning a confirmation message
    SELECT 'New booking added.' AS Confirmation;  -- Confirmation output after adding a booking
END //

-- Resetting the delimiter back to the default
DELIMITER ;

-- To invoke the AddBooking procedure
CALL AddBooking('B106','C002','2024-10-10', 5, 5, 'College Graduation', 'Confirmed');  -- Example invocation to add a booking


-- Setting the delimiter to // to define the body of stored procedures.
DELIMITER //

-- Task 2: Create a Stored Procedure to Update an Existing Booking
-- This procedure updates an existing booking record in the Bookings table.
CREATE PROCEDURE UpdateBooking(
    IN bookingID VARCHAR(50),
    IN newBookingDate DATE
)
BEGIN
    -- Updating the booking date for a specific booking ID in the Bookings table
    UPDATE Bookings
    SET BookingDate = newBookingDate  -- Set the new booking date
    WHERE BookingID = bookingID;      -- Condition to match the specific BookingID

    -- Returning a confirmation message
    SELECT CONCAT('Booking ', bookingID, ' updated.') AS Confirmation;  -- Confirmation output after updating a booking
END //

-- Resetting the delimiter back to the default
DELIMITER ;

-- To invoke the UpdateBooking procedure
CALL UpdateBooking('B001', '2024-11-10');  -- Example invocation to update the booking date


-- Setting the delimiter to // to define the body of stored procedures.
DELIMITER //

-- Task 3: Create a Stored Procedure to Cancel a Booking
-- This procedure cancels a booking record from the Bookings table.
CREATE PROCEDURE CancelBooking(
    IN bookingID VARCHAR(50)
)
BEGIN
    -- Deleting a booking record from the Bookings table where the BookingID matches the provided bookingID
    DELETE FROM Bookings
    WHERE BookingID = bookingID;        -- Condition to match the specific BookingID

    -- Returning a confirmation message
    SELECT CONCAT('Booking ', bookingID, ' canceled.') AS Confirmation;  -- Confirmation output after canceling a booking
END //

-- Resetting the delimiter back to the default
DELIMITER ;

-- To invoke the CancelBooking procedure
CALL CancelBooking('B106');  -- Example invocation to cancel a booking
