-- Select customer details, order information, and menu names
SELECT 
    c.CustomerID,  -- Select CustomerID from the customers table
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,  -- Combine FirstName and LastName into a single FullName
    o.OrderID,  -- Select the OrderID from the orders table
    o.TotalCost,  -- Select the total cost of the order
    m.Name AS MenuName  -- Select the menu item name from the menus table
FROM 
    customers c  -- Alias 'c' refers to the customers table

-- Join the customers table with the bookings table based on the CustomerID
JOIN 
    bookings b ON c.CustomerID = b.CustomerID  -- Ensure each customer is linked to their bookings

-- Join the bookings table with the orders table based on the BookingID
JOIN 
    orders o ON b.BookingID = o.BookingID  -- Ensure the booking matches the corresponding order

-- Join the orders table with the menus table based on the MenuItemID
JOIN 
    menus m ON o.MenuItemID = m.MenuItemID  -- Link the order to the menu item being ordered

-- Filter orders to include only those with a TotalCost greater than 150
WHERE 
    o.TotalCost > 150

-- Order the result set by TotalCost in ascending order (from lowest to highest)
ORDER BY 
    o.TotalCost ASC;
