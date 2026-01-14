-- Script for Little Lemon Database Management
-- This script includes procedures for managing bookings in the Little Lemon restaurant.

-- 1. Insert records into the Bookings table
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID, NumberOfGuests, SpecialRequests, `Status`) VALUES
('B107', '2022-10-10', 5, 'C5091', 4, 'Birtday Celebration', 'Confirmed'),
('B108', '2022-11-12', 3, 'C7513', 7, 'College Graduation', 'Confirmed'),
('B109', '2022-10-11', 2, 'C5467', 3, 'Military Graduation', 'Confirmed'),
('B110', '2022-10-13', 2, 'C4367', 10, 'Window seat', 'Confirmed');