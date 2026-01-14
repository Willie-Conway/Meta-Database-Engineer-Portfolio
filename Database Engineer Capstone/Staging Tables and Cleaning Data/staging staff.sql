-- Step 1: Create a staging table to temporarily hold incoming staff data
CREATE TABLE staging_staff (
    StaffID VARCHAR(50),        -- Unique identifier for each staff member
    FirstName VARCHAR(100),     -- First name of the staff member
    LastName VARCHAR(100),      -- Last name of the staff member
    Role VARCHAR(50),           -- Job role of the staff member
    Salary DECIMAL(10, 2),      -- Salary of the staff member
    PhoneNumber VARCHAR(15),    -- Phone number of the staff member
    Email VARCHAR(100)          -- Email address (should be unique)
);

-- Step 2: Load data from the CSV file into the staging table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/staff_data.csv'
INTO TABLE staging_staff
FIELDS TERMINATED BY ','         -- Specify the delimiter used in the CSV
ENCLOSED BY '"'                  -- Specify the character that encloses strings
LINES TERMINATED BY '\n'         -- Specify the line ending
IGNORE 1 ROWS                    -- Ignore the header row of the CSV
(StaffID, FirstName, LastName, Role, Salary, PhoneNumber, Email);  -- List all relevant columns

-- Step 3: Insert or update the main staff table based on the staging table
INSERT INTO staff (StaffID, FirstName, LastName, Role, Salary, PhoneNumber, Email)
SELECT StaffID, FirstName, LastName, Role, Salary, PhoneNumber, Email
FROM staging_staff
ON DUPLICATE KEY UPDATE
    FirstName = VALUES(FirstName),     -- Update FirstName if duplicate Email found
    LastName = VALUES(LastName),       -- Update LastName if duplicate Email found
    Role = VALUES(Role),                -- Update Role if duplicate Email found
    Salary = VALUES(Salary),            -- Update Salary if duplicate Email found
    PhoneNumber = VALUES(PhoneNumber);  -- Update PhoneNumber if duplicate Email found

-- Step 4: Clean up by dropping the staging table, as it is no longer needed
DROP TABLE staging_staff;  -- Remove the staging table to free up resources
