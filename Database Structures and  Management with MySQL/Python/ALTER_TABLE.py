import mysql.connector

def create_connection():
    """Establish a connection to the MySQL database."""
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",  # Update with your MySQL password
        database="little_lemon"
    )
    return connection

def create_tables(cursor):
    """Create the Customers, Bookings, and FoodOrders tables."""
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS Customers (
            CustomerID INT PRIMARY KEY,
            FullName VARCHAR(100),
            PhoneNumber VARCHAR(15)
        );
    """)
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS Bookings (
            BookingID INT PRIMARY KEY,
            BookingDate DATE,
            TableNumber INT,
            NumberOfGuests INT,
            CustomerID INT,
            FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        );
    """)
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS FoodOrders (
            OrderID INT,
            Quantity INT,
            Order_Status VARCHAR(15),
            Cost DECIMAL(4,2)
        );
    """)

def alter_food_orders(cursor):
    """Perform ALTER TABLE operations on the FoodOrders table."""
    
    # Task 1: Make OrderID the primary key
    cursor.execute("ALTER TABLE FoodOrders MODIFY OrderID INT PRIMARY KEY;")
    
    # Task 2: Apply NOT NULL constraint to Quantity and Cost columns
    cursor.execute("ALTER TABLE FoodOrders MODIFY Quantity INT NOT NULL;")
    cursor.execute("ALTER TABLE FoodOrders MODIFY Cost DECIMAL(4,2) NOT NULL;")
    
    # Task 3: Add OrderDate and CustomerID columns, set foreign key
    cursor.execute("""
        ALTER TABLE FoodOrders 
        ADD COLUMN OrderDate DATE NOT NULL, 
        ADD COLUMN CustomerID INT NOT NULL, 
        ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
    """)

    # Task 4: Delete the OrderDate column
    cursor.execute("ALTER TABLE FoodOrders DROP COLUMN OrderDate;")
    
    # Task 5: Rename Order_Status to DeliveryStatus
    cursor.execute("ALTER TABLE FoodOrders CHANGE Order_Status DeliveryStatus VARCHAR(15);")
    
    # Task 6: Rename the FoodOrders table to OrderDeliveryStatus
    cursor.execute("ALTER TABLE FoodOrders RENAME TO OrderDeliveryStatus;")

def main():
    """Main function to execute the database operations."""
    connection = create_connection()
    cursor = connection.cursor()

    try:
        create_tables(cursor)  # Create initial tables
        alter_food_orders(cursor)  # Alter FoodOrders table as specified
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.commit()  # Commit changes
        connection.close()  # Close the connection

if __name__ == "__main__":
    main()
