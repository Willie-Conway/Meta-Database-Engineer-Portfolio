
-- Bookings

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bookings_data.csv'
INTO TABLE bookings
FIELDS TERMINATED BY ','  -- Use the correct delimiter
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Ignore the header row if your CSV has one


-- Customers

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers_data.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','  -- Use the correct delimiter
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Ignore the header row if your CSV has one
ON DUPLICATE KEY UPDATE Email = Email;  -- This does nothing; just to allow duplicates to be ignored



-- Delivery

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/delivery_data.csv'
INTO TABLE delivery
FIELDS TERMINATED BY ','  -- Use the correct delimiter
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Ignore the header row if your CSV has one


-- Menus

LOAD DATA LOCAL INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_menu.csv'
INTO TABLE menus
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'  -- Adjust based on your file's line endings
IGNORE 1 ROWS;

-- Orders

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_data.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','  -- Use the correct delimiter
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Ignore the header row if your CSV has one


-- Staff

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/staff_data.csv'
INTO TABLE staff
FIELDS TERMINATED BY ','  -- Use the correct delimiter
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  -- Ignore the header row if your CSV has one
