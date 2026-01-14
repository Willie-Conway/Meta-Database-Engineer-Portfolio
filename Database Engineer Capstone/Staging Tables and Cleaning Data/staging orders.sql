-- Step 1: Create a staging table to temporarily hold incoming order data
CREATE TABLE staging_orders (
    OrderID        VARCHAR(50),  -- Unique identifier for each order
    OrderDate      DATE,          -- Date of the order
    CustomerID     VARCHAR(50),   -- Reference to the customer making the order
    CustomerName   VARCHAR(100),   -- Name of the customer
    TableNumber    INT,           -- Table number where the order is placed
    ServerID       VARCHAR(50),    -- ID of the server taking the order
    MenuItemID     VARCHAR(50),    -- ID of the menu item being ordered
    MenuItemName   VARCHAR(100),    -- Name of the menu item
    Category       VARCHAR(50),     -- Category of the menu item (optional)
    SubCategory    VARCHAR(50),     -- Subcategory of the menu item (optional)
    Quantity       INT,            -- Number of items ordered
    Sales          DECIMAL(10,2),  -- Sales amount for the order
    Discount       DECIMAL(10,2),  -- Discount applied to the order (optional)
    Profit         DECIMAL(10,2),  -- Profit made from the order
    TotalCost      DECIMAL(10,2),  -- Total cost of the order
    OrderStatus    VARCHAR(50),     -- Status of the order (e.g., delivered, pending)
    PaymentStatus  VARCHAR(50),     -- Payment status of the order
    DeliveryMethod VARCHAR(50),      -- Method of delivery (optional)
    OrderPriority  VARCHAR(50)       -- Priority of the order (optional)
);



-- Step 2: Load data from the CSV file into the staging table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_data.csv'
INTO TABLE staging_orders
FIELDS TERMINATED BY ','        -- Specify the delimiter used in the CSV
ENCLOSED BY '"'                 -- Specify the character that encloses strings
LINES TERMINATED BY '\n'        -- Specify the line ending
IGNORE 1 ROWS                   -- Ignore the header row of the CSV
(OrderID, OrderDate, CustomerID, CustomerName, TableNumber, ServerID, MenuItemID, 
 MenuItemName, Category, SubCategory, Quantity, Sales, Discount, Profit, TotalCost, 
 OrderStatus, PaymentStatus, DeliveryMethod, OrderPriority);  -- List all relevant columns



-- Step 3: Insert or update the main orders table based on the staging table
INSERT INTO orders (OrderID, OrderDate, CustomerID, CustomerName, TableNumber, ServerID, 
                    MenuItemID, MenuItemName, Category, SubCategory, Quantity, Sales, 
                    Discount, Profit, TotalCost, OrderStatus, PaymentStatus, 
                    DeliveryMethod, OrderPriority)
SELECT OrderID, OrderDate, CustomerID, CustomerName, TableNumber, ServerID, 
       MenuItemID, MenuItemName, Category, SubCategory, Quantity, Sales, 
       Discount, Profit, TotalCost, OrderStatus, PaymentStatus, 
       DeliveryMethod, OrderPriority
FROM staging_orders
ON DUPLICATE KEY UPDATE
    OrderDate = VALUES(OrderDate),       -- Update OrderDate if duplicate OrderID found
    CustomerID = VALUES(CustomerID),     -- Update CustomerID if duplicate OrderID found
    CustomerName = VALUES(CustomerName), -- Update CustomerName if duplicate OrderID found
    TableNumber = VALUES(TableNumber),   -- Update TableNumber if duplicate OrderID found
    ServerID = VALUES(ServerID),         -- Update ServerID if duplicate OrderID found
    MenuItemID = VALUES(MenuItemID),     -- Update MenuItemID if duplicate OrderID found
    MenuItemName = VALUES(MenuItemName), -- Update MenuItemName if duplicate OrderID found
    Category = VALUES(Category),         -- Update Category if duplicate OrderID found
    SubCategory = VALUES(SubCategory),   -- Update SubCategory if duplicate OrderID found
    Quantity = VALUES(Quantity),         -- Update Quantity if duplicate OrderID found
    Sales = VALUES(Sales),               -- Update Sales if duplicate OrderID found
    Discount = VALUES(Discount),         -- Update Discount if duplicate OrderID found
    Profit = VALUES(Profit),             -- Update Profit if duplicate OrderID found
    TotalCost = VALUES(TotalCost),       -- Update TotalCost if duplicate OrderID found
    OrderStatus = VALUES(OrderStatus),   -- Update OrderStatus if duplicate OrderID found
    PaymentStatus = VALUES(PaymentStatus), -- Update PaymentStatus if duplicate OrderID found
    DeliveryMethod = VALUES(DeliveryMethod), -- Update DeliveryMethod if duplicate OrderID found
    OrderPriority = VALUES(OrderPriority); -- Update OrderPriority if duplicate OrderID found


-- Step 4: Clean up by dropping the staging table, as it is no longer needed
DROP TABLE staging_orders;  -- Remove the staging table to free up resources
