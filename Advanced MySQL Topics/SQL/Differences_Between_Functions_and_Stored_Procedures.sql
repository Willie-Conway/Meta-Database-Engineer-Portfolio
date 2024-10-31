-- Create a stored procedure to get all clients
DELIMITER //
CREATE PROCEDURE GetAllClients()
BEGIN
    SELECT * FROM Clients;  -- Select all records from the Clients table
END //
DELIMITER ;

-- Create a stored function to get the average cost of orders
DELIMITER //
CREATE FUNCTION GetCostAverage() RETURNS DECIMAL(5,2) DETERMINISTIC
BEGIN
    RETURN (SELECT AVG(Cost) FROM Orders);  -- Calculate and return the average cost
END //
DELIMITER ;
