UPDATE `staff`
SET 
    `City` = CASE 
        WHEN `StaffID` BETWEEN 'S001' AND 'S020' THEN 'Chicago'
        WHEN `StaffID` BETWEEN 'S021' AND 'S040' THEN 'Aurora'
        WHEN `StaffID` BETWEEN 'S041' AND 'S060' THEN 'Naperville'
        WHEN `StaffID` BETWEEN 'S061' AND 'S080' THEN 'Rockford'
        WHEN `StaffID` BETWEEN 'S081' AND 'S100' THEN 'Peoria'
    END,
    `Zipcode` = CASE 
        WHEN `StaffID` BETWEEN 'S001' AND 'S020' THEN '60601'      -- Chicago
        WHEN `StaffID` BETWEEN 'S021' AND 'S040' THEN '60505'     -- Aurora
        WHEN `StaffID` BETWEEN 'S041' AND 'S060' THEN '60540'     -- Naperville
        WHEN `StaffID` BETWEEN 'S061' AND 'S080' THEN '61101'      -- Rockford
        WHEN `StaffID` BETWEEN 'S081' AND 'S100' THEN '61602'      -- Peoria
    END
WHERE `StaffID` BETWEEN 'S001' AND 'S100';
