import mysql.connector
from mysql.connector import Error

def create_connection():
    """Create a database connection."""
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='Lucky_Shrub',
            user='root',
            password='Admin@LL123!'
        )
        if connection.is_connected():
            print("Successfully connected to the database")
            return connection
    except Error as e:
        print(f"Error: {e}")
    return None

def create_tables(connection):
    """Create tables in the database."""
    cursor = connection.cursor()
    try:
        # Drop tables if they exist to avoid conflicts
        cursor.execute("DROP TABLE IF EXISTS Orders;")
        cursor.execute("DROP TABLE IF EXISTS Activity;")
        cursor.execute("DROP TABLE IF EXISTS Products;")

        # Create tables
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Orders (
            OrderID INT AUTO_INCREMENT PRIMARY KEY,
            ClientID VARCHAR(50),
            Quantity INT,
            Cost DECIMAL(10, 2),
            OrderDate DATETIME,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        """)

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Activity (
            ActivityID INT AUTO_INCREMENT PRIMARY KEY,
            Properties JSON
        );
        """)

        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Products (
            ProductID INT AUTO_INCREMENT PRIMARY KEY,
            ProductName VARCHAR(100),
            BuyPrice DECIMAL(10, 2),
            SellPrice DECIMAL(10, 2),
            Stock INT
        );
        """)

        print("Tables created or already exist.")
        connection.commit()  # Commit changes to the database
    except Error as e:
        print(f"Error creating tables: {e}")
    finally:
        cursor.close()

def verify_database_structure(connection):
    """Verify the structure of the database tables."""
    cursor = connection.cursor()
    tables = ['Orders', 'Activity', 'Products']
    
    for table in tables:
        cursor.execute(f"DESCRIBE {table};")
        columns = cursor.fetchall()
        print(f"Columns in {table}:")
        for column in columns:
            print(f" - {column[0]}: {column[1]}")
    
    cursor.close()

def count_orders_cte(connection):
    """Count orders placed by specific clients in 2022 using a CTE."""
    cursor = connection.cursor()
    query = """
    WITH 
    CL1_Orders AS (
        SELECT COUNT(OrderID) AS TotalOrders FROM Orders WHERE YEAR(OrderDate) = 2022 AND ClientID = 'Cl1'
    ), 
    CL2_Orders AS (
        SELECT COUNT(OrderID) AS TotalOrders FROM Orders WHERE YEAR(OrderDate) = 2022 AND ClientID = 'Cl2'
    ), 
    CL3_Orders AS (
        SELECT COUNT(OrderID) AS TotalOrders FROM Orders WHERE YEAR(OrderDate) = 2022 AND ClientID = 'Cl3'
    )
    SELECT 
        CONCAT('Cl1: ', (SELECT TotalOrders FROM CL1_Orders), ' orders') AS TotalOrders 
    UNION 
    SELECT 
        CONCAT('Cl2: ', (SELECT TotalOrders FROM CL2_Orders), ' orders') 
    UNION 
    SELECT 
        CONCAT('Cl3: ', (SELECT TotalOrders FROM CL3_Orders), ' orders');
    """
    try:
        cursor.execute(query)
        results = cursor.fetchall()
        for row in results:
            print(row[0])  # Output the total orders
    except Error as e:
        print(f"Error executing query: {e}")
    finally:
        cursor.close()

def create_prepared_statement(connection):
    """Create and execute a prepared statement to get order details."""
    cursor = connection.cursor()
    query = "SELECT OrderID, Quantity, Cost, OrderDate FROM Orders WHERE ClientID = %s AND YEAR(OrderDate) = %s"
    try:
        # Example parameters
        client_id = 'Cl1'
        year = 2020
        cursor.execute(query, (client_id, year))
        results = cursor.fetchall()
        for row in results:
            print(row)  # Output the order details
    except Error as e:
        print(f"Error executing prepared statement: {e}")
    finally:
        cursor.close()

def extract_json_data(connection):
    """Extract product details where order is True from JSON in Activity table."""
    cursor = connection.cursor()
    query = """
    SELECT 
        Activity.Properties ->> '$.ProductID' AS ProductID, 
        Products.ProductName, 
        Products.BuyPrice, 
        Products.SellPrice 
    FROM 
        Products 
    INNER JOIN 
        Activity ON Products.ProductID = CAST(Activity.Properties ->> '$.ProductID' AS UNSIGNED) 
    WHERE 
        Activity.Properties ->> '$.Order' = 'True';
    """
    try:
        cursor.execute(query)
        results = cursor.fetchall()
        for row in results:
            print(row)  # Output product details
    except Error as e:
        print(f"Error executing JSON extraction query: {e}")
    finally:
        cursor.close()

def main():
    """Main function to run all tasks."""
    connection = create_connection()
    if connection:
        create_tables(connection)  # Create tables
        verify_database_structure(connection)  # Verify structure
        count_orders_cte(connection)  # Task 1
        create_prepared_statement(connection)  # Task 2
        extract_json_data(connection)  # Task 3
        connection.close()

if __name__ == "__main__":
    main()
