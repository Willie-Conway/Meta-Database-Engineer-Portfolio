import mysql.connector
from mysql.connector import Error

def create_relational_model():
    """Create a relational database schema based on the relational model concepts."""
    connection = None  # Initialize connection variable
    try:
        # Establish a connection to the MySQL server (without specifying a database)
        connection = mysql.connector.connect(
            host='localhost',
            user='mario',  # Replace with your MySQL username
            password='cuisine'  # Replace with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()

            # Create the relational_model database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS relational_model;")
            cursor.execute("USE relational_model;")  # Switch to the new database

            # Create the Customers table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Customers (
                customer_id INT PRIMARY KEY,  -- Primary key for the Customers table
                first_name VARCHAR(50),  -- Customer's first name
                last_name VARCHAR(50),  -- Customer's last name
                email VARCHAR(100)  -- Customer's email
            );
            """)

            # Create the Orders table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Orders (
                order_id INT PRIMARY KEY,  -- Primary key for the Orders table
                order_date DATETIME,  -- Date and time of the order
                customer_id INT,  -- Foreign key referencing Customers
                FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)  -- Referential integrity constraint
            );
            """)

            # Create the Products table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Products (
                product_id INT PRIMARY KEY,  -- Primary key for the Products table
                product_name VARCHAR(100),  -- Name of the product
                price DECIMAL(10, 2)  -- Price of the product
            );
            """)

            # Create a junction table for many-to-many relationship between Orders and Products
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Order_Items (
                order_id INT,  -- Foreign key referencing Orders
                product_id INT,  -- Foreign key referencing Products
                quantity INT,  -- Quantity of the product ordered
                PRIMARY KEY (order_id, product_id),  -- Composite primary key
                FOREIGN KEY (order_id) REFERENCES Orders(order_id),  -- Referential integrity constraint
                FOREIGN KEY (product_id) REFERENCES Products(product_id)  -- Referential integrity constraint
            );
            """)

            print("Relational model tables created successfully.")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_relational_model()
