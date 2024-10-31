-- Create the Employees table
CREATE TABLE Employees (
    ID int NOT NULL,
    EmployeeName varchar(150) DEFAULT NULL,
    Role varchar(100) DEFAULT NULL,
    AnnualSalary int DEFAULT NULL,
    PRIMARY KEY (ID)
);

-- Insert initial employee data
INSERT INTO Employees VALUES 
(1, 'Mario Gollini', 'Manager', 70000), 
(2, 'Adrian Gollini', 'Assistant Manager', 65000), 
(3, 'Giorgos Dioudis', 'Head Chef', 50000), 
(4, 'Fatma Kaya', 'Assistant Chef', 45000), 
(5, 'Elena Salvai', 'Head Waiter', 40000), 
(6, 'John Millar', 'Receptionist', 35000), 
(7, 'Adam Collins', 'Assistant Manager', 65000);
