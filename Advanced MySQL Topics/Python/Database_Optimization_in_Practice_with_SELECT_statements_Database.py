import mysql.connector

def create_clients_table():
    """Creates the Clients table in the Lucky Shrub database."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Drop Clients table if it exists
    cursor.execute("DROP TABLE IF EXISTS Clients;")
    
    # Create the Clients table
    cursor.execute("""
        CREATE TABLE Clients (
            ClientID INT AUTO_INCREMENT PRIMARY KEY,
            FullName VARCHAR(100) NOT NULL,
            ContactNumber VARCHAR(15)
        );
    """)
    
    print("Clients table created successfully.")
    cursor.close()
    db_connection.close()

def insert_sample_data():
    """Inserts sample data into the Clients table."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Insert sample client data
    cursor.execute("""
        INSERT INTO Clients (FullName, ContactNumber) VALUES
        ('Jane Delgado', '123-456-7890'),
        ('John Smith', '234-567-8901'),
        ('Alice Johnson', '345-678-9012'),
        ('Bob Brown', '456-789-0123'),
        ('Carol White', '567-890-1234'),
        ('Dave Black', '678-901-2345'),
        ('Eve Green', '789-012-3456'),
        ('Frank Blue', '890-123-4567'),
        ('Grace Purple', '901-234-5678'),
        ('Hannah Orange', '012-345-6789');
    """)
    
    print("Sample data inserted into Clients table.")
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
    
    # Create index on FullName column
    cursor.execute("CREATE INDEX IdxFullName ON Clients(FullName);")
    
    print("Index on FullName column created successfully.")
    cursor.close()
    db_connection.close()

def explain_select_query():
    """Executes an EXPLAIN statement for a SELECT query to analyze performance."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Use EXPLAIN to analyze the SELECT query
    cursor.execute("EXPLAIN SELECT ContactNumber FROM Clients WHERE FullName='Jane Delgado';")
    
    # Fetch the results of the EXPLAIN query
    results = cursor.fetchall()
    
    print("EXPLAIN results for the SELECT query:")
    for row in results:
        print(row)
    
    cursor.close()
    db_connection.close()

def main():
    create_clients_table()  # Step 1: Create Clients table
    insert_sample_data()    # Step 2: Insert sample data
    create_index()         # Step 3: Create index on FullName column
    explain_select_query()  # Step 4: Analyze SELECT query with EXPLAIN

if __name__ == "__main__":
    main()
