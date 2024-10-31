-- Create the database
CREATE DATABASE luckyshrub_db;
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

-- Insert initial employee data
INSERT INTO employees VALUES 
(1, 'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com', 50000), 
(2, 'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@luckyshrub.com', 75000), 
(3, 'Simon Tolo', 'Marketing', '351930582', 'Simon.t@luckyshrub.com', 40000), 
(4, 'Francesca Soffia', 'Finance', '351258569', 'Francesca.s@luckyshrub.com', 45000), 
(5, 'Emily Sierra', 'Customer Service', '351083098', 'Emily.s@luckyshrub.com', 35000), 
(6, 'Maria Carter', 'Human Resources', '351022508', 'Maria.c@luckyshrub.com', 55000), 
(7, 'Rick Griffin', 'Marketing', '351478458', 'Rick.G@luckyshrub.com', 50000);
