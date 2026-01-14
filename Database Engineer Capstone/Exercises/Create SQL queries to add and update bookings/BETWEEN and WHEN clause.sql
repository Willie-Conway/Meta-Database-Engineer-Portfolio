UPDATE `orders`
SET 
    `City` = CASE 
        WHEN `CustomerID` BETWEEN 'C021' AND 'C2000' THEN 'Chicago'
        WHEN `CustomerID` BETWEEN 'C2001' AND 'C4000' THEN 'Aurora'
        WHEN `CustomerID` BETWEEN 'C4001' AND 'C6000' THEN 'Naperville'
        WHEN `CustomerID` BETWEEN 'C6001' AND 'C8000' THEN 'Rockford'
        WHEN `CustomerID` BETWEEN 'C8001' AND 'C9989' THEN 'Peoria'
    END,
    `Zipcode` = CASE 
        WHEN `CustomerID` BETWEEN 'C021' AND 'C2000' THEN '60601'      -- Chicago
        WHEN `CustomerID` BETWEEN 'C2001' AND 'C4000' THEN '60505'     -- Aurora
        WHEN `CustomerID` BETWEEN 'C4001' AND 'C6000' THEN '60540'     -- Naperville
        WHEN `CustomerID` BETWEEN 'C6001' AND 'C8000' THEN '61101'      -- Rockford
        WHEN `CustomerID` BETWEEN 'C8001' AND 'C9989' THEN '61602'      -- Peoria
    END
WHERE `CustomerID` BETWEEN 'C021' AND 'C9989';