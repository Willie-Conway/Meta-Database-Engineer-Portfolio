-- Create the Little Lemon database
CREATE DATABASE little_lemon;

-- Use the Little Lemon database
USE little_lemon;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT NOT NULL PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL UNIQUE
);

-- Insert data into the Customers table
INSERT INTO Customers (CustomerID, FullName, PhoneNumber) VALUES 
(1, "Vanessa McCarthy", "0757536378"), 
(2, "Marcos Romero", "0757536379"), 
(3, "Hiroki Yamane", "0757536376"), 
(4, "Anna Iversen", "0757536375"), 
(5, "Diana Pinto", "0757536374");

-- Create the Bookings table
CREATE TABLE Bookings (
    BookingID INT NOT NULL PRIMARY KEY,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    NumberOfGuests INT NOT NULL CHECK (NumberOfGuests <= 8),
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert data into the Bookings table
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES 
(10, '2021-11-11', 7, 5, 1), 
(11, '2021-11-10', 5, 2, 2), 
(12, '2021-11-10', 3, 2, 4);
