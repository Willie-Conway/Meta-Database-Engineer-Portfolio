import mysql.connector

# Establish a connection to the MySQL server
db_connection = mysql.connector.connect(
    host="localhost",           # MySQL server host
    user="root",       # Your MySQL username
    password="Admin@LL123!"    # Your MySQL password
)

# Create a cursor object to interact with the database
cursor = db_connection.cursor()

# Step 1: Create the jewelry store database if it doesn't already exist
cursor.execute("CREATE DATABASE IF NOT EXISTS jewelrystore_db;")
cursor.execute("USE jewelrystore_db;")  # Switch to the jewelry store database

# Step 2: Create the item table if it doesn't already exist
cursor.execute('''
CREATE TABLE IF NOT EXISTS item (
    ItemID INT,
    Name VARCHAR(150),
    Cost INT,
    PRIMARY KEY(ItemID)
);
''')

# Step 3: Insert data into the item table
try:
    cursor.execute('''
    INSERT INTO item (ItemID, Name, Cost) VALUES 
    (1,'Engagement ring',2500),
    (2,'Silver brooch',400),
    (3,'Earrings',350),
    (4,'Luxury watch',1250),
    (5,'Golden bracelet',800),
    (6,'Gemstone',1500);
    ''')
    db_connection.commit()  # Commit the changes
    print("Data inserted into item table.")
except mysql.connector.Error as err:
    print(f"Error: {err}")

# Step 4: Create the mg_orders table if it doesn't already exist
cursor.execute('''
CREATE TABLE IF NOT EXISTS mg_orders (
    OrderID INT,
    ItemID INT,
    Quantity INT,
    Cost INT,
    OrderDate DATE,
    DeliveryDate DATE,
    OrderStatus VARCHAR(50),
    PRIMARY KEY(OrderID)
);
''')

# Step 5: Insert data into the mg_orders table
try:
    cursor.execute('''
    INSERT INTO mg_orders (OrderID, ItemID, Quantity, Cost, OrderDate, DeliveryDate, OrderStatus) VALUES
    (1,1,50,122000,'2022-04-05','2022-05-25', 'Delivered'),
    (2,2,75,28000,'2022-03-08',NULL, 'In progress'),
    (3,3,80,25000,'2022-05-19','2022-06-08', 'Delivered'),
    (4,4,45,100000,'2022-01-10',NULL, 'In progress'),
    (5,5,70,56000,'2022-05-19',NULL, 'In progress'),
    (6,6,60,90000,'2022-06-10','2022-06-18', 'Delivered');
    ''')
    db_connection.commit()  # Commit the changes
    print("Data inserted into mg_orders table.")
except mysql.connector.Error as err:
    print(f"Error: {err}")

# Task 1: List items, quantities and order status in the format: item name–quantity–order status
print("\nTask 1: Items, Quantities and Order Status")
cursor.execute('''
SELECT CONCAT(LCASE(i.Name), '-', m.Quantity, '-', UCASE(m.OrderStatus)) AS OrderDetails
FROM item i, mg_orders m
WHERE i.ItemID = m.ItemID;
''')
for row in cursor.fetchall():
    print(row[0])

# Task 2: Find the name of the weekday on which M&G's orders are to be delivered
print("\nTask 2: Delivery Days")
cursor.execute('''
SELECT DATE_FORMAT(DeliveryDate, '%W') AS DeliveryDay
FROM mg_orders;
''')
for row in cursor.fetchall():
    print(row[0])

# Task 3: Calculate the cost of handling each order (5% of total order cost)
print("\nTask 3: Handling Costs")
cursor.execute('''
SELECT OrderID, ROUND((Cost * 5 / 100), 2) AS HandlingCost
FROM mg_orders;
''')
for row in cursor.fetchall():
    print(f"Order ID: {row[0]}, Handling Cost: {row[1]}")

# Task 4: Filter out records that do not have a NULL value in the delivery date column
print("\nTask 4: Delivery Days with Non-NULL Delivery Dates")
cursor.execute('''
SELECT DATE_FORMAT(DeliveryDate, '%W') AS DeliveryDay
FROM mg_orders
WHERE DeliveryDate IS NOT NULL;
''')
for row in cursor.fetchall():
    print(row[0])

# Close the cursor and the connection
cursor.close()
db_connection.close()
