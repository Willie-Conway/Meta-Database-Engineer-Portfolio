import sqlite3

# Connect to the SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create example base tables
cursor.execute('''
CREATE TABLE IF NOT EXISTS clients (
    client_id INTEGER PRIMARY KEY,
    name TEXT,
    location TEXT
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY,
    client_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    cost REAL,
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
)
''')

# Insert sample data into the tables
cursor.execute("INSERT INTO clients (name, location) VALUES ('Alice', 'New York')")
cursor.execute("INSERT INTO clients (name, location) VALUES ('Bob', 'Los Angeles')")
cursor.execute("INSERT INTO orders (client_id, product_id, quantity, cost) VALUES (1, 101, 2, 200.0)")
cursor.execute("INSERT INTO orders (client_id, product_id, quantity, cost) VALUES (2, 102, 1, 150.0)")
cursor.execute("INSERT INTO orders (client_id, product_id, quantity, cost) VALUES (1, 103, 3, 300.0)")

# Commit the changes to save the data
conn.commit()

# Create a VIEW (virtual table) to simplify access to client and order data
cursor.execute('''
CREATE VIEW IF NOT EXISTS OrdersView AS
SELECT 
    o.order_id, 
    c.client_id, 
    c.name AS client_name, 
    c.location AS client_location, 
    o.quantity, 
    o.cost
FROM 
    orders o
JOIN 
    clients c ON o.client_id = c.client_id
''')

# Query the view to see the combined data
print("Orders View:")
cursor.execute("SELECT * FROM OrdersView")
results = cursor.fetchall()
for row in results:
    print(row)

# Manipulating data in the base table via the VIEW
# Update the cost for order ID = 2
cursor.execute('''
UPDATE OrdersView 
SET cost = 250 
WHERE order_id = 2
''')

# Verify that the cost has been updated in the base table
print("\nUpdated Orders:")
cursor.execute("SELECT * FROM orders")
results = cursor.fetchall()
for row in results:
    print(row)

# Demonstrating the security aspect of views
# Here we create a restricted view to show only specific columns
cursor.execute('''
CREATE VIEW IF NOT EXISTS RestrictedOrdersView AS
SELECT 
    order_id, 
    quantity, 
    cost 
FROM 
    orders
''')

# Query the restricted view
print("\nRestricted Orders View:")
cursor.execute("SELECT * FROM RestrictedOrdersView")
results = cursor.fetchall()
for row in results:
    print(row)

# Close the connection
conn.close()
