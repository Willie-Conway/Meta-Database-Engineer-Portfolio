-- Create the database
CREATE DATABASE Mangata_Gallo;

-- Use the created database
USE Mangata_Gallo;

-- Task 1: Create the Clients table
CREATE TABLE Clients (
    ClientID INT NOT NULL PRIMARY KEY,  -- Unique identifier for each client
    FullName VARCHAR(100) NOT NULL,     -- Full name of the client
    PhoneNumber INT NOT NULL UNIQUE      -- Unique phone number for each client
);

-- Task 2: Create the Items table
CREATE TABLE Items (
    ItemID INT NOT NULL PRIMARY KEY,     -- Unique identifier for each item
    ItemName VARCHAR(100) NOT NULL,      -- Name of the item
    Price DECIMAL(5, 2) NOT NULL         -- Price of the item (up to 999.99)
);

-- Task 3: Create the Orders table
CREATE TABLE Orders (
    OrderID INT NOT NULL PRIMARY KEY,     -- Unique identifier for each order
    ClientID INT NOT NULL,                -- Foreign key referencing Clients
    ItemID INT NOT NULL,                  -- Foreign key referencing Items
    Quantity INT NOT NULL CHECK (Quantity <= 3),  -- Maximum allowed items in each order is 3
    Cost DECIMAL(6, 2) NOT NULL,         -- Total cost of the order (up to 9999.99)
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),  -- Establish foreign key relationship
    FOREIGN KEY (ItemID) REFERENCES Items(ItemID)         -- Establish foreign key relationship
);

-- Insert new orders into Orders table using REPLACE
REPLACE INTO Orders (OrderID, ClientID, ItemID, Quantity, Cost) VALUES 
(9, 'Cl1', 'P1', 10, 5000), 
(10, 'Cl2', 'P2', 5, 100);

-- Correct the cost of order number 9
REPLACE INTO Orders SET OrderID = 9, ClientID = 'Cl1', ItemID = 'P1', Quantity = 10, Cost = 500;
