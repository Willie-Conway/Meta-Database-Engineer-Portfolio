-- Create the Customers table
CREATE TABLE Customers (
    CustomerID int NOT NULL,
    FullName varchar(150) NOT NULL,
    PhoneNumber varchar(15),
    PRIMARY KEY (CustomerID)
);

-- Create the Bookings table
CREATE TABLE Bookings (
    BookingID int NOT NULL,
    BookingDate date NOT NULL,
    TableNumber int NOT NULL,
    NumberOfGuests int NOT NULL,
    CustomerID int,
    PRIMARY KEY (BookingID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers
INSERT INTO Customers VALUES 
(1, 'John Doe', '1234567890'),
(2, 'Jane Smith', '0987654321'),
(3, 'Alice Johnson', '1122334455');

-- Insert sample data into Bookings
INSERT INTO Bookings VALUES 
(101, '2024-10-01', 5, 2, 1),
(102, '2024-10-02', 10, 4, 2),
(103, '2024-10-03', 15, 3, NULL);  -- This booking has no matching customer
