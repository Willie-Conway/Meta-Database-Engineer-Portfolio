-- Create the Lucky Shrub database
CREATE DATABASE luckyshrub_db;

-- Use the Lucky Shrub database
USE luckyshrub_db;

-- Create the employees table
CREATE TABLE employees (
    EmployeeID int NOT NULL,
    EmployeeName varchar(150) DEFAULT NULL,
    Department varchar(150) DEFAULT NULL,
    ContactNo varchar(12) DEFAULT NULL,
    Email varchar(100) DEFAULT NULL,
    AnnualSalary int DEFAULT NULL,
    PRIMARY KEY (EmployeeID)
);

-- Create the orders table
CREATE TABLE orders (
    OrderID int NOT NULL,
    Department varchar(100) DEFAULT NULL,
    OrderDate date DEFAULT NULL,
    OrderQty int DEFAULT NULL,
    OrderTotal int DEFAULT NULL,
    PRIMARY KEY (OrderID)
);

-- Create the employee_orders table
CREATE TABLE employee_orders (
    OrderID int NOT NULL,
    EmployeeID int NOT NULL,
    Status VARCHAR(150),
    HandlingCost int DEFAULT NULL,
    PRIMARY KEY (EmployeeID, OrderID),
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);

-- Insert data into the employees table
INSERT INTO employees VALUES 
(1, 'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com', 50000),
(2, 'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@luckyshrub.com', 75000),
(3, 'Simon Tolo', 'Marketing', '351930582', 'Simon.t@luckyshrub.com', 40000),
(4, 'Francesca Soffia', 'Finance', '351258569', 'Francesca.s@luckyshrub.com', 45000),
(5, 'Emily Sierra', 'Customer Service', '351083098', 'Emily.s@luckyshrub.com', 35000),
(6, 'Maria Carter', 'Human Resources', '351022508', 'Maria.c@luckyshrub.com', 55000),
(7, 'Rick Griffin', 'Marketing', '351478458', 'Rick.G@luckyshrub.com', 50000);

-- Insert data into the orders table (example data)
INSERT INTO orders VALUES 
(1, 'Lawn Care', '2022-05-05', 12, 500),
(2, 'Decking', '2022-05-22', 150, 1450),
(3, 'Compost and Stones', '2022-05-27', 20, 780);

-- Insert data into the employee_orders table (example data)
INSERT INTO employee_orders VALUES 
(1, 1, 'Completed', 100),
(2, 2, 'Pending', 50),
(3, 1, 'Completed', 120);
