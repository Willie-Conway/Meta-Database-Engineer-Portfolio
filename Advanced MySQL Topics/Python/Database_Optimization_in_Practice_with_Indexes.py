import mysql.connector

def create_database_and_tables():
    """Creates the Lucky Shrub database and Clients table with new fields."""
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
    
    # Create the Clients table with additional fields
    cursor.execute("""
        CREATE TABLE Clients (
            ClientID INT AUTO_INCREMENT PRIMARY KEY,
            FullName VARCHAR(100),
            ContactNumber VARCHAR(15),
            City VARCHAR(50),
            State VARCHAR(50),
            DOB DATE,
            LoyaltyPoints INT
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
        INSERT INTO Clients (FullName, ContactNumber, City, State, DOB, LoyaltyPoints) VALUES 
        ('Jane Delgado', '555-1234', 'Tucson', 'Arizona', '1990-01-01', 120),
        ('John Smith', '555-5678', 'Phoenix', 'Arizona', '1985-05-15', 90),
        ('Alice Johnson', '555-8765', 'Tucson', 'Arizona', '1992-08-22', 150),
        ('Bob Brown', '555-4321', 'Flagstaff', 'Arizona', '1988-02-10', 70),
        ('Charlie Davis', '555-3456', 'Scottsdale', 'Arizona', '1995-11-30', 200),
        ('Emily Clark', '555-6543', 'Tempe', 'Arizona', '1993-04-18', 110),
        ('Frank Harris', '555-7890', 'Tucson', 'Arizona', '1991-12-05', 130),
        ('Grace Lee', '555-0987', 'Yuma', 'Arizona', '1987-03-23', 60),
        ('Henry White', '555-3210', 'Mesa', 'Arizona', '1994-07-14', 80),
        ('Isabella Martin', '555-2109', 'Tucson', 'Arizona', '1996-09-12', 140);
    """)
    
    print("Clients table populated successfully.")
    cursor.close()
    db_connection.close()

def create_indexes():
    """Creates indexes on the columns to optimize query performance."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Create indexes on relevant columns for optimization
    cursor.execute("CREATE INDEX idx_city ON Clients(City);")
    cursor.execute("CREATE INDEX idx_state ON Clients(State);")
    cursor.execute("CREATE INDEX idx_loyalty_points ON Clients(LoyaltyPoints);")
    cursor.execute("CREATE INDEX idx_dob ON Clients(DOB);")
    
    print("Indexes created successfully on City, State, LoyaltyPoints, and DOB columns.")
    cursor.close()
    db_connection.close()

def run_queries():
    """Executes sample queries to demonstrate the use of indexes."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Query 1: All clients from Tucson, Arizona
    cursor.execute("SELECT ClientID, FullName FROM Clients WHERE City = 'Tucson';")
    results = cursor.fetchall()
    print("\nClients from Tucson, Arizona:")
    for row in results:
        print(row)

    # Query 2: Clients from Arizona but outside of Tucson
    cursor.execute("SELECT ClientID, FullName FROM Clients WHERE State = 'Arizona' AND City <> 'Tucson';")
    results = cursor.fetchall()
    print("\nClients from Arizona (excluding Tucson):")
    for row in results:
        print(row)

    # Query 3: A list of clients with the maximum loyalty points
    cursor.execute("SELECT ClientID, FullName, LoyaltyPoints FROM Clients WHERE LoyaltyPoints = (SELECT MAX(LoyaltyPoints) FROM Clients);")
    results = cursor.fetchall()
    print("\nClients with maximum loyalty points:")
    for row in results:
        print(row)

    # Query 4: Clients whose date of birth falls on a given date
    cursor.execute("SELECT ClientID, FullName FROM Clients WHERE DOB = '1990-01-01';")
    results = cursor.fetchall()
    print("\nClients with DOB of 1990-01-01:")
    for row in results:
        print(row)

    cursor.close()
    db_connection.close()

def main():
    create_database_and_tables()  # Create database and table
    populate_clients()             # Populate Clients table
    create_indexes()               # Create indexes for optimization
    run_queries()                  # Run sample queries

if __name__ == "__main__":
    main()
