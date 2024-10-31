import mysql.connector

def create_database_and_tables():
    """Create a MySQL database and tables with constraints."""

    # Connect to MySQL server
    conn = mysql.connector.connect(
        host='localhost',
        user='mario',  # Replace with your MySQL username
        password='cuisine'  # Replace with your MySQL password
    )
    
    cursor = conn.cursor()
    
    # Step 1: Create the database
    cursor.execute("CREATE DATABASE IF NOT EXISTS MyDatabase;")
    
    # Step 2: Use the newly created database
    cursor.execute("USE MyDatabase;")
    
    # Step 3: Drop existing tables if they exist
    cursor.execute("DROP TABLE IF EXISTS Orders;")
    cursor.execute("DROP TABLE IF EXISTS Ratings;")
    cursor.execute("DROP TABLE IF EXISTS Citizens;")

    # Step 4: Create a table with key constraints
    cursor.execute("""
    CREATE TABLE Citizens (
        PersonalNumber INT NOT NULL PRIMARY KEY,  -- Primary key to ensure unique personal numbers
        Name VARCHAR(100) NOT NULL,
        Age INT CHECK (Age >= 18)  -- CHECK constraint to enforce that Age must be 18 or older
    );
    """)
    
    # Step 5: Create a table with domain constraints
    cursor.execute("""
    CREATE TABLE Ratings (
        RatingID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        UserID INT NOT NULL,
        Rating INT CHECK (Rating BETWEEN 3 AND 10),  -- Domain constraint to restrict rating values between 3 and 10
        FOREIGN KEY (UserID) REFERENCES Citizens(PersonalNumber)  -- Referential integrity constraint
    );
    """)

    # Step 6: Create a table with referential integrity constraints
    cursor.execute("""
    CREATE TABLE Orders (
        OrderID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        UserID INT NOT NULL,
        Product VARCHAR(100) NOT NULL,
        FOREIGN KEY (UserID) REFERENCES Citizens(PersonalNumber)  -- Ensures UserID must exist in Citizens table
    );
    """)

    # Commit the changes and close the connection
    conn.commit()
    cursor.close()
    conn.close()

if __name__ == "__main__":
    create_database_and_tables()
