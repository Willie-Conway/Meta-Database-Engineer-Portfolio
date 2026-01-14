-- Step 1: Check the Current Definition of the Menus Table
SHOW CREATE TABLE menus;

-- Step 2: Modify the Description Column to Accommodate Longer Text
-- Changing Description from VARCHAR(255) to TEXT to prevent truncation errors
ALTER TABLE menus MODIFY COLUMN Description TEXT;  -- Change column type to TEXT

-- Step 3: Load Data into the Menus Table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/menus_data.csv'
INTO TABLE menus
FIELDS TERMINATED BY ','  -- Use the correct delimiter
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Ignore the header row if your CSV has one



-- Step 1: Create a staging table for menus
CREATE TABLE staging_menus (
    MenuItemID varchar(50) NOT NULL COMMENT 'Unique identifier for each menu item',
    MenuItemName varchar(100) NOT NULL COMMENT 'Name of the menu item',
    Category varchar(50) DEFAULT NULL COMMENT 'Category of the menu item',
    SubCategory varchar(50) DEFAULT NULL COMMENT 'Sub-category for further classification',
    Price decimal(10,2) NOT NULL COMMENT 'Price of the menu item',
    Description varchar(255) DEFAULT NULL COMMENT 'Description of the menu item',
    PRIMARY KEY (MenuItemID)  -- Set MenuItemID as the primary key to avoid duplicates
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Step 2: Load data from the CSV file into the staging_menus table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/menus_data.csv'
INTO TABLE staging_menus
FIELDS TERMINATED BY ','  -- Use the correct delimiter
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Ignore the header row if your CSV has one

-- Step 3: Validate the data loaded into the staging table
-- Check for duplicate MenuItemIDs
SELECT MenuItemID, COUNT(*) as Count
FROM staging_menus
GROUP BY MenuItemID
HAVING Count > 1;

-- Check for any entries with null values in important fields
SELECT * 
FROM staging_menus
WHERE MenuItemID IS NULL OR MenuItemName IS NULL OR Price IS NULL;

-- Step 4: Insert data into the main menus table, updating existing records if necessary
INSERT INTO menus (MenuItemID, MenuItemName, Category, SubCategory, Price, Description)
SELECT MenuItemID, MenuItemName, Category, SubCategory, Price, Description
FROM staging_menus
ON DUPLICATE KEY UPDATE
    MenuItemName = VALUES(MenuItemName),
    Category = VALUES(Category),
    SubCategory = VALUES(SubCategory),
    Price = VALUES(Price),
    Description = VALUES(Description);

-- Step 5: Clean up by dropping the staging table after the data transfer
DROP TABLE staging_menus;

