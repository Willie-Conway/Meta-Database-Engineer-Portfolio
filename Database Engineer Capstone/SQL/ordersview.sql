CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `admin2`@`%` 
    SQL SECURITY DEFINER
VIEW `ordersview` AS
    SELECT 
        `orders`.`OrderID` AS `OrderID`,
        `orders`.`Quantity` AS `Quantity`,
        `orders`.`TotalCost` AS `Cost`
    FROM
        `orders`
    WHERE
        (`orders`.`Quantity` > 2)