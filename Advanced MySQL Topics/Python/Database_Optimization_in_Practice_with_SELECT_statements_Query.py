import mysql.connector

def create_database_and_tables():
    """Creates the Lucky Shrub database and Clients table."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!"
    )
    
    cursor = db_connection.cursor()
    
    # Create the Lucky Shrub database
    cursor.execute("CREATE DATABASE IF NOT EXISTS Lucky_Shrub;")
    cursor.execute("USE Lucky_Shrub;")
    
    # Drop the Clients table if it exists
    cursor.execute("DROP TABLE IF EXISTS Clients;")
    
    # Create the Clients table
    cursor.execute("""
        CREATE TABLE Clients (
            ClientID INT AUTO_INCREMENT PRIMARY KEY,
            FullName VARCHAR(100),
            ContactNumber VARCHAR(15)
        );
    """)
    
    print("Database and Clients table created successfully.")
    cursor.close()
    db_connection.close()

def populate_clients():
    """Populates the Clients table with initial data."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Insert initial client data
    cursor.execute("""
        INSERT INTO Clients (FullName, ContactNumber) VALUES 
        ('Jane Delgado', '555-1234'),
        ('John Smith', '555-5678'),
        ('Alice Johnson', '555-8765'),
        ('Bob Brown', '555-4321'),
        ('Charlie Davis', '555-3456'),
        ('Emily Clark', '555-6543'),
        ('Frank Harris', '555-7890'),
        ('Grace Lee', '555-0987'),
        ('Henry White', '555-3210'),
        ('Isabella Martin', '555-2109');
    """)
    
    print("Clients table populated successfully.")
    cursor.close()
    db_connection.close()

def create_index():
    """Creates an index on the FullName column to optimize queries."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Create an index on the FullName column
    cursor.execute("CREATE INDEX IdxFullName ON Clients(FullName);")
    
    print("Index on FullName column created successfully.")
    cursor.close()
    db_connection.close()

def explain_query():
    """Executes an EXPLAIN statement to show how the query will be executed."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Explain the query to get the execution plan
    cursor.execute("EXPLAIN SELECT ContactNumber FROM Clients WHERE FullName='Jane Delgado';")
    results = cursor.fetchall()
    
    # Display EXPLAIN results
    print("EXPLAIN results for the query:")
    for row in results:
        print(row)
    
    cursor.close()
    db_connection.close()

def main():
    create_database_and_tables()  # Create database and table
    populate_clients()             # Populate Clients table
    create_index()                 # Create index on FullName
    explain_query()                # Explain the query

if __name__ == "__main__":
    main()
