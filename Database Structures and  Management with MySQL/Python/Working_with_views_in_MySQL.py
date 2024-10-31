import mysql.connector

# Establish a connection to the MySQL server
db_connection = mysql.connector.connect(
    host="localhost",           # MySQL server host
    user="root",       # Your MySQL username
    password="Admin@LL123!"    # Your MySQL password
)

# Create a cursor object to interact with the database
cursor = db_connection.cursor()

# Step 1: Create the Lucky_Shrub database if it doesn't already exist
cursor.execute("CREATE DATABASE IF NOT EXISTS Lucky_Shrub;")
cursor.execute("USE Lucky_Shrub;")  # Switch to the Lucky_Shrub database

# Step 2: Create the Orders table if it doesn't already exist
cursor.execute('''
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT NOT NULL PRIMARY KEY,
    ClientID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    Cost DECIMAL(6, 2)
);
''')

# Step 3: Clear existing data in the Orders table (optional)
cursor.execute("DELETE FROM Orders;")  # Uncomment to clear existing entries

# Step 4: Insert data into the Orders table
try:
    cursor.execute('''
    INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES 
    (1, "Cl1", "P1", 10, 500), 
    (2, "Cl2", "P2", 5, 100), 
    (3, "Cl3", "P3", 20, 800), 
    (4, "Cl4", "P4", 15, 150), 
    (5, "Cl3", "P3", 10, 450), 
    (6, "Cl2", "P2", 5, 800), 
    (7, "Cl1", "P4", 22, 1200), 
    (8, "Cl1", "P1", 15, 150);
    ''')
    db_connection.commit()  # Commit the changes to the database
    print("Data inserted into Orders table.")
except mysql.connector.Error as err:
    print(f"Error: {err}")

# Step 5: Create a view called OrdersView to show OrderID and Cost
cursor.execute('''
CREATE VIEW OrdersView AS 
SELECT OrderID, Cost FROM Orders;
''')
print("OrdersView created.")

# Step 6: Retrieve data from the OrdersView
print("Data from OrdersView:")
cursor.execute("SELECT * FROM OrdersView;")
for row in cursor.fetchall():
    print(row)

# Step 7: Update the Cost in the Orders table using the OrdersView
cursor.execute('''
UPDATE OrdersView 
SET Cost = 500 
WHERE OrderID = 1;
''')
db_connection.commit()  # Commit the update
print("Cost updated in OrdersView.")

# Step 8: Retrieve updated data from the OrdersView
print("\nUpdated data from OrdersView:")
cursor.execute("SELECT * FROM OrdersView;")
for row in cursor.fetchall():
    print(row)

# Step 9: Rename the OrdersView to ClientsOrdersView
cursor.execute('''
RENAME TABLE OrdersView TO ClientsOrdersView;
''')
print("OrdersView renamed to ClientsOrdersView.")

# Step 10: Retrieve data from the renamed view
print("\nData from ClientsOrdersView:")
cursor.execute("SELECT * FROM ClientsOrdersView;")
for row in cursor.fetchall():
    print(row)

# Step 11: Drop the ClientsOrdersView virtual table
cursor.execute('''
DROP VIEW ClientsOrdersView;
''')
print("ClientsOrdersView has been dropped.")

# Close the cursor and the connection
cursor.close()
db_connection.close()
