import mysql.connector

# Connect to the MySQL database
connection = mysql.connector.connect(
    host='localhost',
    user='root',  # Replace with your MySQL username
    password='Admin@LL123!',  # Replace with your MySQL password
    database='Mangata_Gallo'  # Connect to the created database
)

# Create a cursor object to execute SQL commands
cursor = connection.cursor()

# Function to drop tables if they exist
def drop_tables():
    cursor.execute("DROP TABLE IF EXISTS Orders;")
    cursor.execute("DROP TABLE IF EXISTS Items;")
    cursor.execute("DROP TABLE IF EXISTS Clients;")
    print("Existing tables dropped successfully.")

# Function to create tables
def create_tables():
    # Create Clients table
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS Clients (
        ClientID INT NOT NULL PRIMARY KEY,
        FullName VARCHAR(100) NOT NULL,
        PhoneNumber INT NOT NULL UNIQUE
    );
    """)

    # Create Items table
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS Items (
        ItemID INT NOT NULL PRIMARY KEY,
        ItemName VARCHAR(100) NOT NULL,
        Price DECIMAL(5, 2) NOT NULL
    );
    """)

    # Create Orders table
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS Orders (
        OrderID INT NOT NULL PRIMARY KEY,
        ClientID INT NOT NULL,
        ItemID INT NOT NULL,
        Quantity INT NOT NULL CHECK (Quantity <= 3),
        Cost DECIMAL(6, 2) NOT NULL,
        FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
        FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
    );
    """)

    print("Tables created successfully.")

# Function to insert or update orders using REPLACE
def replace_order(order_id, client_id, item_id, quantity, cost):
    try:
        # Prepare SQL REPLACE statement
        sql = "REPLACE INTO Orders (OrderID, ClientID, ItemID, Quantity, Cost) VALUES (%s, %s, %s, %s, %s)"
        values = (order_id, client_id, item_id, quantity, cost)
        
        # Execute the SQL statement
        cursor.execute(sql, values)
        # Commit the changes
        connection.commit()
        print(f"Order {order_id} replaced successfully.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Drop existing tables
drop_tables()

# Create the tables
create_tables()

# Insert some sample data into Clients and Items
cursor.execute("INSERT IGNORE INTO Clients (ClientID, FullName, PhoneNumber) VALUES (1, 'Alice Smith', 1234567890);")
cursor.execute("INSERT IGNORE INTO Clients (ClientID, FullName, PhoneNumber) VALUES (2, 'Bob Johnson', 9876543210);")
cursor.execute("INSERT IGNORE INTO Items (ItemID, ItemName, Price) VALUES (1, 'Gold Ring', 500.00);")
cursor.execute("INSERT IGNORE INTO Items (ItemID, ItemName, Price) VALUES (2, 'Silver Necklace', 100.00);")

# Commit the sample data
connection.commit()

# Insert two new orders
replace_order(9, 1, 1, 2, 5000)  # Replace an existing order or insert a new one
replace_order(10, 2, 2, 1, 100)   # Replace an existing order or insert a new one

# Correct the cost of order number 9
replace_order(9, 1, 1, 2, 500)     # Correcting the cost

# Close the cursor and connection
cursor.close()
connection.close()
