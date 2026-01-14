UPDATE `staff`
SET 
    `Address` = CASE 
        WHEN `StaffID` BETWEEN 'S001' AND 'S020' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' W Elm St Apt ', FLOOR(RAND() * 50) + 1, ', Chicago, IL ', '60601')
        WHEN `StaffID` BETWEEN 'S021' AND 'S040' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' S Maple Ave Apt ', FLOOR(RAND() * 50) + 1, ', Aurora, IL ', '60505')
        WHEN `StaffID` BETWEEN 'S041' AND 'S060' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' N Oak St Apt ', FLOOR(RAND() * 50) + 1, ', Naperville, IL ', '60540')
        WHEN `StaffID` BETWEEN 'S061' AND 'S080' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' E Walnut St Apt ', FLOOR(RAND() * 50) + 1, ', Rockford, IL ', '61101')
        WHEN `StaffID` BETWEEN 'S081' AND 'S100' THEN CONCAT(FLOOR(RAND() * 1000) + 1, ' N Pine St Apt ', FLOOR(RAND() * 50) + 1, ', Peoria, IL ', '61602')
    END
WHERE `StaffID` BETWEEN 'S001' AND 'S100';
