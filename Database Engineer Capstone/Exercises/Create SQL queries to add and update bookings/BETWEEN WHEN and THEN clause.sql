UPDATE `customers`
SET 
    `Address` = CASE 
        WHEN `CustomerID` BETWEEN 'C001' AND 'C2000' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' W Elm St, Chicago, IL ', '60601')
        WHEN `CustomerID` BETWEEN 'C2001' AND 'C4000' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' S Maple Ave, Aurora, IL ', '60505')
        WHEN `CustomerID` BETWEEN 'C4001' AND 'C6000' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' N Oak St, Naperville, IL ', '60540')
        WHEN `CustomerID` BETWEEN 'C6001' AND 'C8000' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' E Walnut St, Rockford, IL ', '61101')
        WHEN `CustomerID` BETWEEN 'C8001' AND 'C9999' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' N Pine St, Peoria, IL ', '61602')
    END
WHERE `CustomerID` BETWEEN 'C001' AND 'C9999';
