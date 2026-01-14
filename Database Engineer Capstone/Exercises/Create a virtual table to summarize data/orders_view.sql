-- Task 1: Create a Virtual Table (OrdersView)
-- This view will summarize orders with a quantity greater than 2.
-- It extracts the OrderID, Quantity, and TotalCost (renamed to Cost).
CREATE VIEW OrdersView AS
SELECT 
    OrderID, 
    Quantity, 
    TotalCost AS Cost  -- Renaming TotalCost to Cost for clarity
FROM 
    Orders
WHERE 
    Quantity > 2;

-- To query the view and retrieve the summarized data
SELECT * FROM OrdersView;

-- Task 2: Retrieve Information Using JOINs
-- This query retrieves information about customers with orders costing more than $150.
-- It extracts data from Customers, Orders, Menus, and MenuItems tables.
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName, -- Full name of the customer
    c.CustomerID,                                    -- Unique identifier for the customer
    o.OrderID,                                       -- Unique identifier for the order
    o.TotalCost AS Cost,                             -- Total cost of the order
    m.MenuItemName AS MenuName,                      -- Name of the menu item
    m.Category AS CourseName,                        -- Name of the category/course
    m.SubCategory AS StarterName                     -- Name of the subcategory/starter
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID          -- Join Customers with Orders
JOIN 
    Menus m ON o.MenuItemID = m.MenuItemID           -- Join Orders with Menus
WHERE 
    o.TotalCost > 150                                -- Filter for orders with total cost greater than $150
ORDER BY 
    o.TotalCost ASC;


-- Task 3: Find Menu Items with More Than 2 Orders
-- This query identifies menu items for which more than 2 orders have been placed.
-- It uses a subquery to check the Orders table.
SELECT 
    m.MenuItemName                                     -- Name of the menu item
FROM 
    Menus m
WHERE 
    m.MenuItemID IN (                                 -- Filter menu items based on order quantities
        SELECT 
            o.MenuItemID                              -- Get menu item IDs from the Orders table
        FROM 
            Orders o
        WHERE 
            o.Quantity > 2                            -- Check for order quantities greater than 2
    );
