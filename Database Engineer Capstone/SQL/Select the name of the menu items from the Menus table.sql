-- Select the name of the menu items from the Menus table
SELECT 
    m.Name AS MenuName
FROM 
    Menus m  -- Reference the Menus table using the alias 'm'
    
-- Where the MenuItemID matches any item from a subquery
WHERE 
    m.MenuItemID IN (
        
        -- Subquery: Retrieve MenuItemIDs from the Orders table
        SELECT 
            o.MenuItemID  -- Select the MenuItemID from the Orders table
        FROM 
            Orders o  -- Reference the Orders table using the alias 'o'
            
        -- Condition: Only include orders with more than 2 items ordered
        WHERE 
            o.Quantity > 2
    );
