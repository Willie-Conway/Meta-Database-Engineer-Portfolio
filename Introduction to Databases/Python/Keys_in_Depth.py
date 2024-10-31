import mysql.connector
from mysql.connector import Error

def create_automobile_database():
    """Create a database and tables for vehicles and owners, including primary and foreign keys."""
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
            
            # Create the automobile database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS automobile;")
            cursor.execute("USE automobile;")  # Switch to the new database
            
            # Create the owner table first
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS owner (
                ownerID VARCHAR(10) PRIMARY KEY,  -- Primary key for the owner table
                ownerName VARCHAR(50),  -- Owner's name
                ownerAddress VARCHAR(255)  -- Owner's address
            );
            """)

            # Now create the vehicle table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS vehicle (
                vehicleID VARCHAR(10) PRIMARY KEY,  -- Primary key for the vehicle table
                ownerID VARCHAR(10),  -- Foreign key referencing the owner table
                plateNumber VARCHAR(10),  -- Car plate number
                phoneNumber VARCHAR(15),  -- Owner's phone number
                FOREIGN KEY (ownerID) REFERENCES owner(ownerID)  -- Define ownerID as a foreign key
            );
            """)

            print("Automobile database and tables created successfully.")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_automobile_database()
