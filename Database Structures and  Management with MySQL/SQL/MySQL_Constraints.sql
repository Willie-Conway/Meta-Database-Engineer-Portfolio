-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Mangata_Gallo;
USE Mangata_Gallo;

-- Task 1: Create the Staff table
CREATE TABLE IF NOT EXISTS Staff (
    StaffID INT NOT NULL PRIMARY KEY,
    PhoneNumber INT NOT NULL UNIQUE,
    FullName VARCHAR(100) NOT NULL
);

-- Task 2: Create the ContractInfo table
CREATE TABLE IF NOT EXISTS ContractInfo (
    ContractID INT NOT NULL PRIMARY KEY,
    StaffID INT NOT NULL,
    Salary DECIMAL(7,2) NOT NULL,
    Location VARCHAR(50) NOT NULL DEFAULT 'Texas',
    StaffType VARCHAR(20) NOT NULL CHECK (StaffType IN ('Junior', 'Senior'))
);

-- Task 3: Add foreign key constraint
ALTER TABLE ContractInfo
ADD FOREIGN KEY (StaffID) REFERENCES Staff(StaffID);
