import mysql.connector

def create_connection():
    """Create a connection to the MySQL database."""
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",  # Replace with your actual password
        database="littlelemon_db"  # Specify the database to connect to
    )
    return connection

def alter_table_example(cursor):
    """Demonstrate the usage of ALTER TABLE statements."""

    # Example 1: Add a new column to an existing table
    cursor.execute("""
        ALTER TABLE Employees 
        ADD Email VARCHAR(255);
    """)
    print("Added Email column to Employees table.")

    # Example 2: Modify the Email column to change its datatype
    cursor.execute("""
        ALTER TABLE Employees 
        MODIFY COLUMN Email VARCHAR(50);
    """)
    print("Modified Email column datatype to VARCHAR(50).")

    # Example 3: Add a foreign key constraint to the Orders table
    cursor.execute("""
        ALTER TABLE Orders 
        ADD FOREIGN KEY (CustomerID) 
        REFERENCES Customer(CustomerID);
    """)
    print("Added foreign key on CustomerID in Orders table.")

    # Example 4: Drop an existing column from a table
    cursor.execute("""
        ALTER TABLE Employees 
        DROP COLUMN Email;
    """)
    print("Dropped Email column from Employees table.")

    # Example 5: Rename a column in the Employees table
    cursor.execute("""
        ALTER TABLE Employees 
        CHANGE Email BusinessEmail VARCHAR(50);
    """)
    print("Renamed Email column to BusinessEmail.")

    # Example 6: Rename the Orders table
    cursor.execute("""
        ALTER TABLE Orders 
        RENAME new_Orders;
    """)
    print("Renamed Orders table to new_Orders.")

def main():
    connection = create_connection()
    cursor = connection.cursor()

    try:
        alter_table_example(cursor)
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.commit()
        connection.close()

if __name__ == "__main__":
    main()
