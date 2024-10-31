CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `admin1`@`%` 
    SQL SECURITY DEFINER
VIEW `overall_sales_view` AS
    SELECT 
        `c`.`FullName` AS `CustomerName`,
        SUM((`s`.`Price` * `s`.`Quantity`)) AS `TotalSalesAmount`,
        SUM(`s`.`Quantity`) AS `TotalQuantitySold`,
        AVG(`s`.`Price`) AS `AveragePrice`,
        `l`.`City` AS `LocationCity`,
        `l`.`Country` AS `LocationCountry`,
        COUNT(`s`.`SalesKey`) AS `TotalTransactions`
    FROM
        ((`sales` `s`
        JOIN `customers` `c` ON ((`s`.`CustomerKey` = `c`.`CustomerKey`)))
        JOIN `location` `l` ON ((`s`.`LocationKey` = `l`.`LocationKey`)))
    GROUP BY `c`.`FullName` , `l`.`City` , `l`.`Country`