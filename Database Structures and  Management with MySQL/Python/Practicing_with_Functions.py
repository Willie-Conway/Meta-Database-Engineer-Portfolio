import mysql.connector

# Establish a connection to the MySQL server
db_connection = mysql.connector.connect(
    host="localhost",           # MySQL server host
    user="root",       # Your MySQL username
    password="Admin@LL123!"    # Your MySQL password
)

# Create a cursor object to interact with the database
cursor = db_connection.cursor()

# Step 1: Create the jewelry store database and tables if they don't exist
cursor.execute("CREATE DATABASE IF NOT EXISTS jewelrystore_db;")
cursor.execute("USE jewelrystore_db;")  # Switch to the jewelry store database

# Create the clients table
cursor.execute('''
CREATE TABLE IF NOT EXISTS clients (
    ClientID INT NOT NULL,
    ClientName VARCHAR(255) DEFAULT NULL,
    Address VARCHAR(255) DEFAULT NULL,
    ContactNo VARCHAR(10) DEFAULT NULL,
    PRIMARY KEY (ClientID)
);
''')

# Create the client_orders table
cursor.execute('''
CREATE TABLE IF NOT EXISTS client_orders (
    OrderID INT NOT NULL,
    ClientID INT DEFAULT NULL,
    ItemID INT DEFAULT NULL,
    Cost INT DEFAULT NULL,
    PRIMARY KEY (OrderID)
);
''')

# Create the item table
cursor.execute('''
CREATE TABLE IF NOT EXISTS item (
    ItemID INT NOT NULL,
    Name VARCHAR(150) DEFAULT NULL,
    Cost INT DEFAULT NULL,
    PRIMARY KEY (ItemID)
);
''')

# Create the mg_orders table
cursor.execute('''
CREATE TABLE IF NOT EXISTS mg_orders (
    OrderID INT NOT NULL,
    ItemID INT DEFAULT NULL,
    Quantity INT DEFAULT NULL,
    Cost INT DEFAULT NULL,
    OrderDate DATE DEFAULT NULL,
    DeliveryDate DATE DEFAULT NULL,
    OrderStatus VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (OrderID)
);
''')

# Step 2: Populate the clients table with data
try:
    cursor.execute('''
    INSERT INTO clients VALUES 
    (1, 'Kishan Hughes', '223 Golden Hills, North Austin, TX', '387986345'),
    (2, 'Indira Moncada', '119 Silver Street, Bouldin Creek, TX', '334567243'),
    (3, 'Mosha Setsile', '785 Bronze Lane, East Austin, TX', '315642597'),
    (4, 'Laura Mills', '908 Diamond Crescent, South Lamar, TX', '300842509'),
    (5, 'Henrik Kreida', '345 Golden Hills, North Austin, TX', '358208983'),
    (6, 'Millicent Blou', '812 Diamond Crescent, North Burnet, TX', '347898755');
    ''')
    db_connection.commit()  # Commit the changes
except mysql.connector.Error as err:
    print(f"Error inserting data into clients: {err}")

# Step 3: Populate the item table with data
try:
    cursor.execute('''
    INSERT INTO item VALUES 
    (1, 'Engagement ring', 2500),
    (2, 'Silver brooch', 400),
    (3, 'Earrings', 350),
    (4, 'Luxury watch', 1250),
    (5, 'Golden bracelet', 800),
    (6, 'Gemstone', 1500);
    ''')
    db_connection.commit()  # Commit the changes
except mysql.connector.Error as err:
    print(f"Error inserting data into item: {err}")

# Step 4: Populate the client_orders table with data
try:
    cursor.execute('''
    INSERT INTO client_orders VALUES 
    (1, 1, 1, 2500),
    (2, 2, 2, 400),
    (3, 3, 3, 350),
    (4, 4, 4, 1250),
    (5, 5, 5, 800),
    (6, 6, 6, 1500),
    (7, 2, 4, 400),
    (8, 3, 4, 1250),
    (9, 4, 2, 400),
    (10, 1, 3, 350);
    ''')
    db_connection.commit()  # Commit the changes
except mysql.connector.Error as err:
    print(f"Error inserting data into client_orders: {err}")

# Step 5: Populate the mg_orders table with data
try:
    cursor.execute('''
    INSERT INTO mg_orders VALUES 
    (1, 1, 50, 122000, '2022-04-05', '2022-05-25', 'Delivered'),
    (2, 2, 75, 28000, '2022-03-08', NULL, 'In progress'),
    (3, 3, 80, 25000, '2022-05-19', '2022-06-08', 'Delivered'),
    (4, 4, 45, 100000, '2022-01-10', NULL, 'In progress'),
    (5, 5, 70, 56000, '2022-05-19', NULL, 'In progress'),
    (6, 6, 60, 90000, '2022-06-10', '2022-06-18', 'Delivered');
    ''')
    db_connection.commit()  # Commit the changes
except mysql.connector.Error as err:
    print(f"Error inserting data into mg_orders: {err}")

# Task 1: Apply the CEIL function to express the cost after a 5% discount
print("\nTask 1: Cost after 5% discount with CEIL function")
cursor.execute('''
SELECT ClientID, OrderID, CEIL((Cost - (Cost * 5 / 100))) AS afterDiscount 
FROM client_orders 
WHERE ItemID = 4;
''')
for row in cursor.fetchall():
    print(f"Client ID: {row[0]}, Order ID: {row[1]}, After Discount: {row[2]}")

# Task 2: Format the afterDiscount column using the FORMAT function
print("\nTask 2: Formatted cost after 5% discount")
cursor.execute('''
SELECT ClientID, OrderID, FORMAT((Cost - (Cost * 5 / 100)), 2) AS afterDiscount 
FROM client_orders 
WHERE ItemID = 4;
''')
for row in cursor.fetchall():
    print(f"Client ID: {row[0]}, Order ID: {row[1]}, Formatted After Discount: {row[2]}")

# Task 3: Find expected delivery dates for orders using ADDDATE function
print("\nTask 3: Expected Delivery Dates")
cursor.execute('''
SELECT OrderID, ADDDATE(OrderDate, INTERVAL 30 DAY) AS ExpectedDelDate 
FROM mg_orders;
''')
for row in cursor.fetchall():
    print(f"Order ID: {row[0]}, Expected Delivery Date: {row[1]}")

# Task 4: Use COALESCE to show 'NOT DELIVERED' for NULL DeliveryDate
print("\nTask 4: Orders Not Yet Delivered")
cursor.execute('''
SELECT OrderID, ItemID, Quantity, Cost, OrderDate, 
COALESCE(DeliveryDate, 'NOT DELIVERED') AS DeliveryStatus, OrderStatus 
FROM mg_orders;
''')
for row in cursor.fetchall():
    print(f"Order ID: {row[0]}, Item ID: {row[1]}, Quantity: {row[2]}, Cost: {row[3]}, Order Date: {row[4]}, Delivery Status: {row[5]}, Order Status: {row[6]}")

# Task 5: Retrieve M&G orders yet to be delivered using NULLIF function
print("\nTask 5: M&G Orders In Progress")
cursor.execute('''
SELECT OrderID, NULLIF(OrderStatus, 'In Progress') AS status 
FROM mg_orders;
''')
for row in cursor.fetchall():
    print(f"Order ID: {row[0]}, Status: {row[1]}")

# Close the cursor and the connection
cursor.close()
db_connection.close()
