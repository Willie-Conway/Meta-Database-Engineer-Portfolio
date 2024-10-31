-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS little_lemon;

-- Step 2: Use the created database
USE little_lemon;

-- Step 3: Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- Step 4: Create the Bookings table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    TableNumber INT,
    NumberOfGuests INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Step 5: Create the FoodOrders table
CREATE TABLE IF NOT EXISTS FoodOrders (
    OrderID INT,
    Quantity INT,
    Order_Status VARCHAR(15),
    Cost DECIMAL(4,2)
);

-- Step 6: ALTER TABLE operations on the FoodOrders table

-- Task 1: Make OrderID the primary key
ALTER TABLE FoodOrders MODIFY OrderID INT PRIMARY KEY;

-- Task 2: Apply NOT NULL constraint to Quantity and Cost columns
ALTER TABLE FoodOrders MODIFY Quantity INT NOT NULL;
ALTER TABLE FoodOrders MODIFY Cost DECIMAL(4,2) NOT NULL;

-- Task 3: Add new columns OrderDate and CustomerID, set foreign key
ALTER TABLE FoodOrders 
ADD COLUMN OrderDate DATE NOT NULL, 
ADD COLUMN CustomerID INT NOT NULL, 
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

-- Task 4: Delete the OrderDate column
ALTER TABLE FoodOrders DROP COLUMN OrderDate;

-- Task 5: Rename Order_Status to DeliveryStatus
ALTER TABLE FoodOrders CHANGE Order_Status DeliveryStatus VARCHAR(15);

-- Task 6: Rename the FoodOrders table to OrderDeliveryStatus
ALTER TABLE FoodOrders RENAME TO OrderDeliveryStatus;

-- You can check the final structure of the tables using:
SHOW COLUMNS FROM Customers;
SHOW COLUMNS FROM Bookings;
SHOW COLUMNS FROM OrderDeliveryStatus;
