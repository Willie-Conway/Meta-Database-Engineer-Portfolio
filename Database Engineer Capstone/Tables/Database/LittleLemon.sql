-- Create the database
CREATE DATABASE LittleLemonDB;

-- Use the LittleLemonDB Database
USE LittleLemonDB;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID VARCHAR(50) NOT NULL PRIMARY KEY COMMENT 'Unique identifier for each customer',
    FirstName VARCHAR(100) NOT NULL COMMENT 'Customer\'s first name',
    LastName VARCHAR(100) NOT NULL COMMENT 'Customer\'s last name',
    Email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Customer\'s email address',
    PhoneNumber VARCHAR(15) COMMENT 'Customer\'s phone number',
    Address VARCHAR(255) COMMENT 'Customer\'s address',
    City VARCHAR(100) COMMENT 'Customer\'s city',
    State VARCHAR(100) COMMENT 'Customer\'s state',
    ZipCode VARCHAR(10) COMMENT 'Customer\'s zip code'
);

-- Create Staff Table
CREATE TABLE Staff (
    StaffID VARCHAR(50) NOT NULL PRIMARY KEY COMMENT 'Unique identifier for each staff member',
    FirstName VARCHAR(100) NOT NULL COMMENT 'Staff member\'s first name',
    LastName VARCHAR(100) NOT NULL COMMENT 'Staff member\'s last name',
    Role VARCHAR(50) NOT NULL COMMENT 'Job role of the staff member',
    Salary DECIMAL(10, 2) NOT NULL COMMENT 'Salary of the staff member',
    PhoneNumber VARCHAR(15) COMMENT 'Staff member\'s phone number',
    Address VARCHAR(255) COMMENT 'Staff member\'s address',
    City VARCHAR(100) COMMENT 'City where the staff member lives',
    State VARCHAR(50) COMMENT 'State where the staff member lives',
    ZipCode VARCHAR(20) COMMENT 'Zip code for the staff member\'s address',
    Email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Staff member\'s email address'
);


-- Create Menus Table
CREATE TABLE Menus (
    MenuItemID VARCHAR(50) NOT NULL PRIMARY KEY COMMENT 'Unique identifier for each menu item',
    MenuItemName VARCHAR(100) NOT NULL COMMENT 'Name of the menu item',
    Category VARCHAR(50) COMMENT 'Category of the menu item',
    SubCategory VARCHAR(50) COMMENT 'Sub-category for further classification',
    Price DECIMAL(10, 2) NOT NULL COMMENT 'Price of the menu item',
    Description VARCHAR(255) COMMENT 'Description of the menu item'
);

-- Create Bookings Table
CREATE TABLE Bookings (
    BookingID VARCHAR(50) NOT NULL PRIMARY KEY COMMENT 'Unique identifier for each booking',
    CustomerID VARCHAR(50) NOT NULL COMMENT 'Link to the customer making the booking',
    BookingDate DATE NOT NULL COMMENT 'The date the table was booked',
    TableNumber INT NOT NULL COMMENT 'The number of the booked table',
    NumberOfGuests INT NOT NULL COMMENT 'Number of guests for the booking',
    SpecialRequests VARCHAR(255) COMMENT 'Special requests from the customer',
    Status VARCHAR(50) NOT NULL COMMENT 'Current status of the booking',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID VARCHAR(50) NOT NULL PRIMARY KEY COMMENT 'Unique identifier for each order',
    OrderDate DATE NOT NULL COMMENT 'The date the order was placed',
    CustomerID VARCHAR(50) NOT NULL COMMENT 'Link to the customer who placed the order',
    CustomerName VARCHAR(100) NOT NULL COMMENT 'Name of the customer',
    City VARCHAR(100) COMMENT 'Customer\'s city',
    State VARCHAR(100) COMMENT 'Customer\'s state',
    ZipCode VARCHAR(10) COMMENT 'Customer\'s zip code'
    TableNumber INT NOT NULL COMMENT 'Table number associated with the order',
    ServerID VARCHAR(50) NOT NULL COMMENT 'Link to the staff member handling the order',
    MenuItemID VARCHAR(50) NOT NULL COMMENT 'Link to the menu item ordered',
    MenuItemName VARCHAR(100) NOT NULL COMMENT 'Name of the menu item ordered',
    Category VARCHAR(50) COMMENT 'Category of the menu item',
    SubCategory VARCHAR(50) COMMENT 'Sub-category of the menu item',
    Quantity INT NOT NULL COMMENT 'The number of items ordered',
    Sales DECIMAL(10, 2) NOT NULL COMMENT 'Total sales amount for the order',
    Discount DECIMAL(10, 2) COMMENT 'Any discount applied to the order',
    Profit DECIMAL(10, 2) NOT NULL COMMENT 'Profit generated from the order',
    TotalCost DECIMAL(10, 2) NOT NULL COMMENT 'Total cost of the order, including sales, shipping, and discounts',
    OrderStatus VARCHAR(50) NOT NULL COMMENT 'Current status of the order',
    PaymentStatus VARCHAR(50) NOT NULL COMMENT 'Payment status of the order',
    DeliveryMethod VARCHAR(50) COMMENT 'Method of delivery for the order',
    OrderPriority VARCHAR(50) COMMENT 'Priority level of the order',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (MenuItemID) REFERENCES Menus(MenuItemID),
    FOREIGN KEY (ServerID) REFERENCES Staff(StaffID)
);

-- Create Delivery Table
CREATE TABLE Delivery (
    DeliveryID VARCHAR(50) NOT NULL PRIMARY KEY COMMENT 'Unique identifier for each delivery',
    OrderID VARCHAR(50) NOT NULL COMMENT 'Link to the order being delivered',
    DeliveryDate DATE NOT NULL COMMENT 'Date of delivery',
    DeliveryStatus VARCHAR(50) NOT NULL COMMENT 'Current status of the delivery',
    ShippingCost DECIMAL(10, 2) COMMENT 'Cost of the delivery',
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create BookingAudit Table
CREATE TABLE BookingAudit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unique identifier for each audit entry',
    ActionType VARCHAR(10) NOT NULL COMMENT 'Type of action performed (e.g., Insert, Update, Delete)',
    BookingID VARCHAR(50) NOT NULL COMMENT 'Link to the booking that was changed',
    BookingDate DATE NOT NULL COMMENT 'Date of the booking',
    TableNumber INT NOT NULL COMMENT 'Table number associated with the booking',
    CustomerID VARCHAR(50) NOT NULL COMMENT 'Identifier for the customer associated with the booking',
    ActionTimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time when the action was performed',
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID) ON DELETE CASCADE
);
