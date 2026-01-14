-- Setting the delimiter to // to define the body of stored procedures.
DELIMITER //

-- Task 1: Create a Stored Procedure to Display Maximum Ordered Quantity
-- This procedure retrieves the maximum ordered quantity from the Orders table.
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    -- Selecting the maximum quantity from the Orders table
    SELECT MAX(Quantity) AS MaxOrderedQuantity  -- 'Quantity' is the correct column
    FROM Orders;  -- Make sure the table is specified here
END //

-- Resetting the delimiter back to the default
DELIMITER ;

-- To invoke the procedure and display the maximum ordered quantity
CALL GetMaxQuantity();



-- Task 2: Create a Prepared Statement for Order Details
-- This prepared statement retrieves order details based on a provided CustomerID.
PREPARE GetOrderDetail FROM 
    'SELECT OrderID, Quantity, TotalCost 
     FROM Orders 
     WHERE CustomerID = ?';   -- Using ? as a placeholder for the CustomerID input

-- Setting a variable for CustomerID to execute the prepared statement
SET @id = 'C021';  -- Assuming CustomerID is varchar, use quotes for string values

-- Executing the prepared statement using the variable @id
EXECUTE GetOrderDetail USING @id;   -- This will return order details for the specified CustomerID

-- Optionally, deallocating the prepared statement to clean up resources
DEALLOCATE PREPARE GetOrderDetail;  -- Cleans up the prepared statement after execution



-- Task 3: Create a Stored Procedure to Cancel an Order
-- This procedure deletes an order record based on the order ID provided as input and confirms cancellation.
DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderID VARCHAR(50))  -- Use VARCHAR(50) to match the OrderID column type
BEGIN
    -- Declare a variable for the confirmation message
    DECLARE confirmationMessage VARCHAR(100);

    -- Deleting an order from the Orders table where the OrderID matches the provided orderID
-- 	DELETE FROM Delivery                            -- Specifies the table to delete from
--     WHERE OrderID = orderID;                      -- Condition to match the specific OrderID
                                                
    DELETE FROM Orders                           -- Then, delete the order from the Orders table
    WHERE OrderID = orderID;

    -- Check if any rows were affected (i.e., if the deletion was successful)
    IF ROW_COUNT() > 0 THEN
        SET confirmationMessage = CONCAT('Order ', orderID, ' is cancelled.');  -- Create a confirmation message if the order was cancelled
    ELSE
        SET confirmationMessage = CONCAT('Order ', orderID, ' not found.');     -- Message if the order ID did not match any existing order
    END IF;

    -- Selecting the confirmation message to display the result
    SELECT confirmationMessage AS Confirmation;   -- The result will be labeled as Confirmation
END //

-- Resetting the delimiter back to the default
DELIMITER ;

-- To invoke the procedure to cancel an order with a specific OrderID
CALL CancelOrder('O005');  -- Replace 'O005' with the desired OrderID to cancel the corresponding order
