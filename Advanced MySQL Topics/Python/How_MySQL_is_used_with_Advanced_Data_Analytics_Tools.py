import mysql.connector
from mysql.connector import Error

def create_connection():
    """Create a database connection to MySQL."""
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='Admin@LL123!'
        )
        if connection.is_connected():
            print("Successfully connected to the MySQL server")
            return connection
    except Error as e:
        print(f"Error: {e}")
    return None

def create_database(connection):
    """Create the Data_Analytics database if it does not exist."""
    cursor = connection.cursor()
    try:
        cursor.execute("CREATE DATABASE IF NOT EXISTS Data_Analytics;")
        print("Database created or already exists.")
    except Error as e:
        print(f"Error creating database: {e}")
    finally:
        cursor.close()

def create_tables(connection):
    """Create tables for data analytics."""
    cursor = connection.cursor()
    try:
        cursor.execute("USE Data_Analytics;")  # Use the created database
        cursor.execute("DROP TABLE IF EXISTS SalesData;")
        cursor.execute("DROP TABLE IF EXISTS CustomerData;")

        # Create SalesData table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS SalesData (
            SaleID INT AUTO_INCREMENT PRIMARY KEY,
            ProductID INT,
            Quantity INT,
            SaleDate DATETIME,
            Revenue DECIMAL(10, 2),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        """)

        # Create CustomerData table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS CustomerData (
            CustomerID INT AUTO_INCREMENT PRIMARY KEY,
            CustomerName VARCHAR(100),
            CustomerEmail VARCHAR(100),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        """)

        print("Tables created or already exist.")
        connection.commit()  # Commit changes to the database
    except Error as e:
        print(f"Error creating tables: {e}")
    finally:
        cursor.close()

def insert_sample_data(connection):
    """Insert sample data into the tables for analytics."""
    cursor = connection.cursor()
    try:
        cursor.execute("USE Data_Analytics;")  # Use the created database
        
        # Insert sample customers
        customers = [
            ('Alice Johnson', 'alice@example.com'),
            ('Bob Smith', 'bob@example.com'),
            ('Charlie Brown', 'charlie@example.com'),
            ('Diana Prince', 'diana@example.com'),
            ('Ethan Hunt', 'ethan@example.com')
        ]
        cursor.executemany("INSERT INTO CustomerData (CustomerName, CustomerEmail) VALUES (%s, %s);", customers)

        # Insert sample sales
        sales = [
            (1, 10, '2023-10-01 10:00:00', 200.00),
            (2, 5, '2023-10-02 11:30:00', 150.00),
            (1, 2, '2023-10-03 12:00:00', 40.00),
            (3, 8, '2023-10-04 13:45:00', 320.00),
            (2, 1, '2023-10-05 14:15:00', 30.00)
        ]
        cursor.executemany("INSERT INTO SalesData (ProductID, Quantity, SaleDate, Revenue) VALUES (%s, %s, %s, %s);", sales)

        print("Sample data inserted.")
        connection.commit()  # Commit changes to the database
    except Error as e:
        print(f"Error inserting sample data: {e}")
    finally:
        cursor.close()

def query_data(connection):
    """Query and display data from the tables."""
    cursor = connection.cursor()
    try:
        cursor.execute("USE Data_Analytics;")  # Use the created database
        query = """
        SELECT c.CustomerName, s.Quantity, s.Revenue, s.SaleDate
        FROM CustomerData c
        JOIN SalesData s ON c.CustomerID = s.ProductID;  # Adjust this according to your actual relationship
        """
        cursor.execute(query)
        results = cursor.fetchall()
        print("Sales Data:")
        for row in results:
            print(row)  # Display each row of data
    except Error as e:
        print(f"Error querying data: {e}")
    finally:
        cursor.close()

def main():
    """Main function to run all tasks."""
    connection = create_connection()
    if connection:
        create_database(connection)  # Create the database
        create_tables(connection)  # Create necessary tables
        insert_sample_data(connection)  # Insert sample data
        query_data(connection)  # Query and display data
        connection.close()

if __name__ == "__main__":
    main()
