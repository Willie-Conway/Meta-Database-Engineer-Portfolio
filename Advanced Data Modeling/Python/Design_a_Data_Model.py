import mysql.connector
from mysql.connector import Error

# Define database configuration
dbconfig = {
    "database": "mangata_gallo_db",
    "user": "your_username",  # Replace with your MySQL username
    "password": "your_password"  # Replace with your MySQL password
}

# Function to create database and tables
def create_database_and_tables():
    """Creates the database and the required tables for M&G's ordering system."""
    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host='localhost',  # Adjust if your MySQL server is on a different host
            user=dbconfig["user"],
            password=dbconfig["password"]
        )
        
        cursor = connection.cursor()
        
        # Create the database
        cursor.execute("CREATE DATABASE IF NOT EXISTS mangata_gallo_db;")
        cursor.execute("USE mangata_gallo_db;")
        
        # Create Clients table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Clients (
            ClientID INT AUTO_INCREMENT PRIMARY KEY,
            Name VARCHAR(100) NOT NULL,
            Address VARCHAR(255) NOT NULL,
            ContactNumber VARCHAR(15) NOT NULL,
            Email VARCHAR(100) NOT NULL
        );
        """)
        
        # Create Orders table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Orders (
            OrderID INT AUTO_INCREMENT PRIMARY KEY,
            ClientID INT,
            OrderDate DATETIME NOT NULL,
            DeliveryStatus VARCHAR(50) NOT NULL,
            DeliveryDate DATETIME NULL,
            TotalCost DECIMAL(10, 2) NOT NULL,
            FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
        );
        """)
        
        # Create Items table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Items (
            ItemID INT AUTO_INCREMENT PRIMARY KEY,
            Name VARCHAR(100) NOT NULL,
            Price DECIMAL(10, 2) NOT NULL
        );
        """)
        
        # Create Order_Items table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Order_Items (
            OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
            OrderID INT,
            ItemID INT,
            Quantity INT NOT NULL,
            Subtotal DECIMAL(10, 2) NOT NULL,
            FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
            FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
        );
        """)

        print("Database and tables created successfully.")
        
    except Error as e:
        print(f"The error '{e}' occurred")
    finally:
        cursor.close()
        connection.close()

# Main function to execute the script
def main():
    create_database_and_tables()

if __name__ == "__main__":
    main()
