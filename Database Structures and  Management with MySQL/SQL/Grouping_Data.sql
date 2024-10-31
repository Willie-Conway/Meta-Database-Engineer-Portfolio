-- Create the Lucky Shrub database
CREATE DATABASE luckyshrub_db;

-- Use the Lucky Shrub database
USE luckyshrub_db;

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT,
    Department VARCHAR(100),
    OrderDate DATE,
    OrderQty INT,
    OrderTotal INT,
    PRIMARY KEY(OrderID)
);

-- Insert data into the Orders table
INSERT INTO Orders VALUES 
(1, 'Lawn Care', '2022-05-05', 12, 500),
(2, 'Decking', '2022-05-22', 150, 1450),
(3, 'Compost and Stones', '2022-05-27', 20, 780),
(4, 'Trees and Shrubs', '2022-06-01', 15, 400),
(5, 'Garden Decor', '2022-06-10', 2, 1250),
(6, 'Lawn Care', '2022-06-10', 12, 500),
(7, 'Decking', '2022-06-25', 150, 1450),
(8, 'Compost and Stones', '2022-05-29', 20, 780),
(9, 'Trees and Shrubs', '2022-06-10', 15, 400),
(10, 'Garden Decor', '2022-06-10', 2, 1250),
(11, 'Lawn Care', '2022-06-25', 10, 400),
(12, 'Decking', '2022-06-25', 100, 1400),
(13, 'Compost and Stones', '2022-05-30', 15, 700),
(14, 'Trees and Shrubs', '2022-06-15', 10, 300),
(15, 'Garden Decor', '2022-06-11', 2, 1250),
(16, 'Lawn Care', '2022-06-10', 12, 500),
(17, 'Decking', '2022-06-25', 150, 1450),
(18, 'Trees and Shrubs', '2022-06-10', 15, 400),
(19, 'Lawn Care', '2022-06-10', 12, 500),
(20, 'Decking', '2022-06-25', 150, 1450),
(21, 'Decking', '2022-06-25', 150, 1450);
