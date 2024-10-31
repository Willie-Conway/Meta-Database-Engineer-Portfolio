-- Create the automobile database
CREATE DATABASE IF NOT EXISTS automobile;

-- Use the newly created database
USE automobile;

-- Create the owner table
CREATE TABLE IF NOT EXISTS owner (
    ownerID VARCHAR(10) PRIMARY KEY,  -- Primary key for owner
    ownerName VARCHAR(50),  -- Owner's name
    ownerAddress VARCHAR(255)  -- Owner's address
);

-- Create the vehicle table
CREATE TABLE IF NOT EXISTS vehicle (
    vehicleID VARCHAR(10) PRIMARY KEY,  -- Primary key for vehicle
    ownerID VARCHAR(10),  -- Foreign key for owner
    plateNumber VARCHAR(10),  -- Car plate number
    phoneNumber VARCHAR(15),  -- Owner's phone number
    FOREIGN KEY (ownerID) REFERENCES owner(ownerID)  -- Foreign key constraint
);
