import mysql.connector

# Connect to the MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",  # Replace with your MySQL username
    password="Admin@LL123!",  # Replace with your MySQL password
    database="Lucky_Shrub"  # Replace with your database name
)

cursor = db.cursor()

# Function to create the necessary tables
def create_tables():
    try:
        # Drop existing tables if they exist
        cursor.execute("DROP TABLE IF EXISTS Orders;")
        cursor.execute("DROP TABLE IF EXISTS Products;")

        # Create Products Table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Products (
            ProductID VARCHAR(50) PRIMARY KEY,
            ProductName VARCHAR(100) NOT NULL,
            Price DECIMAL(10, 2) NOT NULL,
            Stock INT NOT NULL
        );
        """)

        # Create Orders Table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Orders (
            OrderID VARCHAR(50) PRIMARY KEY,
            ClientID VARCHAR(50) NOT NULL,
            ProductID VARCHAR(50),
            Quantity INT NOT NULL,
            Total DECIMAL(10, 2) NOT NULL,
            FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
        );
        """)
        
        db.commit()
        print("Tables created successfully.")
    except mysql.connector.Error as err:
        print(f"Error creating tables: {err}")

# Function to insert a new product
def insert_product(product_id, product_name, price, stock):
    try:
        cursor.execute("INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES (%s, %s, %s, %s);",
                       (product_id, product_name, price, stock))
        db.commit()
        print(f"Product {product_name} inserted successfully.")
    except mysql.connector.Error as err:
        print(f"Error inserting product {product_name}: {err}")

# Function to process an order
def process_order(order_id, client_id, product_id, quantity):
    try:
        db.start_transaction()  # Start a transaction

        # Fetch stock and price
        cursor.execute("SELECT Stock, Price FROM Products WHERE ProductID = %s;", (product_id,))
        result = cursor.fetchone()

        if result is None:
            print(f"Product {product_id} not found.")
            db.rollback()
            return

        stock, price = result  # Unpack stock and price

        if stock < quantity:
            print("Not enough stock available.")
            db.rollback()
            return

        # Update stock
        cursor.execute("UPDATE Products SET Stock = Stock - %s WHERE ProductID = %s;", (quantity, product_id))

        # Insert order
        total_amount = price * quantity
        cursor.execute("INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Total) VALUES (%s, %s, %s, %s, %s);",
                       (order_id, client_id, product_id, quantity, total_amount))

        # Commit the transaction
        db.commit()
        print(f"Order {order_id} processed successfully.")
    except mysql.connector.Error as err:
        print(f"Error processing order {order_id}: {err}")
        db.rollback()  # Rollback the transaction in case of error

# Function to calculate total sales per client
def total_sales_per_client():
    try:
        query = """
        WITH ClientSales AS (
            SELECT ClientID, SUM(Total) AS TotalSales
            FROM Orders
            GROUP BY ClientID
        )
        SELECT * FROM ClientSales;
        """
        cursor.execute(query)
        results = cursor.fetchall()

        print("\nTotal Sales per Client:")
        for row in results:
            print(f"ClientID: {row[0]}, TotalSales: {row[1]:.2f}")

    except mysql.connector.Error as err:
        print(f"Error calculating total sales per client: {err}")

# Main function to run the script
def main():
    create_tables()  # Create tables if they don't exist

    # Insert sample products
    insert_product("P1", "Product 1", 10.00, 100)
    insert_product("P2", "Product 2", 20.00, 50)

    # Process sample orders
    process_order("O1", "Cl1", "P1", 2)
    process_order("O2", "Cl1", "P2", 1)

    # Calculate total sales per client
    total_sales_per_client()

# Run the main function
if __name__ == "__main__":
    main()

# Close the cursor and database connection
cursor.close()
db.close()
