-- Step 1: Create a staging table to temporarily hold incoming data
CREATE TABLE staging_customers (
    CustomerID VARCHAR(50),  -- Unique identifier for each customer
    FirstName VARCHAR(100),   -- First name of the customer
    LastName VARCHAR(100),    -- Last name of the customer
    Email VARCHAR(100),       -- Email address (should be unique)
    PhoneNumber VARCHAR(15),  -- Phone number of the customer
    Address VARCHAR(255),     -- Residential address
    City VARCHAR(100),        -- City of residence
    State VARCHAR(100),       -- State of residence
    ZipCode VARCHAR(10)       -- Zip code of the area
);

-- Step 2: Load data from the CSV file into the staging table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers_data.csv'
INTO TABLE staging_customers
FIELDS TERMINATED BY ','        -- Specify the delimiter used in the CSV
ENCLOSED BY '"'                 -- Specify the character that encloses strings
LINES TERMINATED BY '\n'        -- Specify the line ending
IGNORE 1 ROWS                   -- Ignore the header row of the CSV
(CustomerID, FirstName, LastName, Email, PhoneNumber, Address, City, State, ZipCode);  -- List all relevant columns

-- Step 3: Insert or update the main customers table based on the staging table
INSERT INTO customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address, City, State, ZipCode)
SELECT CustomerID, FirstName, LastName, Email, PhoneNumber, Address, City, State, ZipCode
FROM staging_customers
ON DUPLICATE KEY UPDATE
    FirstName = VALUES(FirstName),    -- Update FirstName if duplicate CustomerID found
    LastName = VALUES(LastName),      -- Update LastName if duplicate CustomerID found
    PhoneNumber = VALUES(PhoneNumber), -- Update PhoneNumber if duplicate CustomerID found
    Address = VALUES(Address),         -- Update Address if duplicate CustomerID found
    City = VALUES(City),               -- Update City if duplicate CustomerID found
    State = VALUES(State),             -- Update State if duplicate CustomerID found
    ZipCode = VALUES(ZipCode);         -- Update ZipCode if duplicate CustomerID found

-- Step 4: Clean up by dropping the staging table, as it is no longer needed
DROP TABLE staging_customers;  -- Remove the staging table to free up resources



