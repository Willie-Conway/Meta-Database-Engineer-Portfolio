-- Create the Lucky Shrub database
CREATE DATABASE IF NOT EXISTS Lucky_Shrub;
USE Lucky_Shrub;

-- Drop the Orders table if it exists
DROP TABLE IF EXISTS Orders;

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT NOT NULL PRIMARY KEY,
    ClientID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    Cost DECIMAL(6,2),
    OrderDate DATE
);

-- Insert sample data into the Orders table
INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, OrderDate) VALUES
(1, "Cl1", "P1", 10, 500, "2020-09-01"),
(2, "Cl2", "P2", 5, 100, "2020-09-05"),
(3, "Cl3", "P3", 20, 800, "2020-09-03"),
(4, "Cl4", "P4", 15, 150, "2020-09-07"),
(5, "Cl3", "P3", 10, 450, "2020-09-08"),
(6, "Cl2", "P2", 5, 800, "2020-09-09"),
(7, "Cl1", "P4", 22, 1200, "2020-09-10"),
(8, "Cl3", "P1", 15, 150, "2020-09-10"),
(9, "Cl1", "P1", 10, 500, "2020-09-12");

-- Create the FindCost function
DELIMITER //
CREATE FUNCTION FindCost(order_id INT) RETURNS DECIMAL(5,2) DETERMINISTIC 
BEGIN
    DECLARE cost_value DECIMAL(5,2);
    SELECT Cost INTO cost_value FROM Orders WHERE OrderID = order_id;
    RETURN cost_value;
END //
DELIMITER ;

-- Create the GetDiscount stored procedure
DELIMITER //
CREATE PROCEDURE GetDiscount(OrderIDInput INT) 
BEGIN
    DECLARE cost_after_discount DECIMAL(7,2);
    DECLARE current_cost DECIMAL(7,2);
    DECLARE order_quantity INT;

    SELECT Quantity INTO order_quantity FROM Orders WHERE OrderID = OrderIDInput;
    SELECT Cost INTO current_cost FROM Orders WHERE OrderID = OrderIDInput;

    IF order_quantity >= 20 THEN
        SET cost_after_discount = current_cost - (current_cost * 0.2);
    ELSEIF order_quantity >= 10 THEN
        SET cost_after_discount = current_cost - (current_cost * 0.1);
    ELSE
        SET cost_after_discount = current_cost;
    END IF;

    SELECT cost_after_discount;
END //
DELIMITER ;
