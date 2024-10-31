import mysql.connector

# Establish a connection to the MySQL database
db_connection = mysql.connector.connect(
    host="localhost",           # Your MySQL server host
    user="root",       # Your MySQL username
    password="Admin@LL123!",   # Your MySQL password
    database="Lucky_Shrub"     # The database we are using
)

cursor = db_connection.cursor()

# Step 1: Create the Orders table if it doesn't exist
cursor.execute('''
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT NOT NULL PRIMARY KEY,
    ClientID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    Cost DECIMAL(6, 2)
);
''')

# Step 2: Insert data into the Orders table
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

# Commit the changes to save the data
db_connection.commit()

# Task 1: Create the OrdersView virtual table
cursor.execute('''
CREATE VIEW OrdersView AS 
SELECT OrderID, Quantity, Cost FROM Orders;
''')

# Select all data from the OrdersView to verify creation
print("OrdersView Data:")
cursor.execute("SELECT * FROM OrdersView;")
for row in cursor.fetchall():
    print(row)

# Task 2: Update the base Orders table using the OrdersView
cursor.execute('''
UPDATE OrdersView 
SET Cost = 200 
WHERE OrderID = 2;
''')

# Select all data from the OrdersView to verify the update
print("\nUpdated OrdersView Data:")
cursor.execute("SELECT * FROM OrdersView;")
for row in cursor.fetchall():
    print(row)

# Task 3: Rename the OrdersView to ClientsOrdersView
cursor.execute('''
RENAME TABLE OrdersView TO ClientsOrdersView;
''')

# Verify the renaming by selecting from the new view
print("\nClientsOrdersView Data:")
cursor.execute("SELECT * FROM ClientsOrdersView;")
for row in cursor.fetchall():
    print(row)

# Task 4: Drop the ClientsOrdersView virtual table
cursor.execute('''
DROP VIEW ClientsOrdersView;
''')

# Verify the view has been dropped
try:
    cursor.execute("SELECT * FROM ClientsOrdersView;")
except mysql.connector.Error as err:
    print("\nError: View has been dropped or does not exist.")
    print(err)

# Close the cursor and connection
cursor.close()
db_connection.close()
