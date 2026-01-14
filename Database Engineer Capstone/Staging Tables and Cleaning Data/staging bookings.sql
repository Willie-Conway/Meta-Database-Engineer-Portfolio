-- Step 1: Create Staging Table for Bookings
-- This table is used to temporarily hold booking data before inserting it into the main bookings table.
CREATE TABLE staging_bookings (
    BookingID varchar(50),  -- Unique identifier for each booking
    CustomerID varchar(50),  -- Link to the customer making the booking
    BookingDate date,        -- The date the table was booked
    TableNumber int,        -- The number of the booked table
    NumberOfGuests int,     -- Number of guests for the booking
    SpecialRequests varchar(255),  -- Special requests from the customer
    Status varchar(50)      -- Current status of the booking
);

-- Step 2: Load Data into the Staging Table
-- Load the bookings data from the CSV file into the staging_bookings table.
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bookings_data.csv'
INTO TABLE staging_bookings
FIELDS TERMINATED BY ','  -- Use the correct delimiter
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Ignore the header row if your CSV has one

-- Step 3: Validate Data in the Staging Table
-- Check for any invalid CustomerIDs in the staging_bookings table.
SELECT DISTINCT CustomerID
FROM staging_bookings
WHERE CustomerID NOT IN (SELECT CustomerID FROM customers);

-- Count total entries in the staging_bookings table.
SELECT COUNT(*) AS TotalEntries
FROM staging_bookings;

-- Step 4: Insert Valid Data into the Main Bookings Table
-- Insert validated entries from the staging_bookings table into the main bookings table.
INSERT INTO bookings (BookingID, CustomerID, BookingDate, TableNumber, NumberOfGuests, SpecialRequests, Status)
SELECT BookingID, CustomerID, BookingDate, TableNumber, NumberOfGuests, SpecialRequests, Status
FROM staging_bookings
WHERE CustomerID IN (SELECT CustomerID FROM customers);

-- Step 5: Clean Up Staging Table
-- Drop the staging_bookings table after data has been inserted into the main bookings table.
DROP TABLE staging_bookings;
