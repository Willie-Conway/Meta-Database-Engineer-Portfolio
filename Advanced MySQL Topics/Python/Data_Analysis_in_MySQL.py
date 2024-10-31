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
    """Create the Lucky_Shrub database if it does not exist."""
    cursor = connection.cursor()
    try:
        cursor.execute("CREATE DATABASE IF NOT EXISTS Lucky_Shrub;")
        print("Database created or already exists.")
    except Error as e:
        print(f"Error creating database: {e}")
    finally:
        cursor.close()

def create_tables(connection):
    """Create tables for the Lucky Shrub database."""
    cursor = connection.cursor()
    try:
        cursor.execute("USE Lucky_Shrub;")  # Use the created database

        # Drop existing tables if any
        cursor.execute("DROP TABLE IF EXISTS Clients;")
        cursor.execute("DROP TABLE IF EXISTS Orders;")
        cursor.execute("DROP TABLE IF EXISTS Products;")
        cursor.execute("DROP TABLE IF EXISTS Addresses;")

        # Create Clients table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Clients (
            ClientID VARCHAR(10),
            FullName VARCHAR(100),
            ContactNumber INT,
            AddressID INT
        );
        """)

        # Create Orders table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Orders (
            OrderID INT NOT NULL PRIMARY KEY,
            ClientID VARCHAR(10),
            ProductID VARCHAR(10),
            Quantity INT,
            Cost DECIMAL(6,2),
            Date DATE
        );
        """)

        # Create Products table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Products (
            ProductID VARCHAR(10),
            ProductName VARCHAR(100),
            BuyPrice DECIMAL(6,2),
            SellPrice DECIMAL(6,2),
            NumberOfItems INT
        );
        """)

        # Create Addresses table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Addresses (
            AddressID INT PRIMARY KEY,
            Street VARCHAR(255),
            County VARCHAR(100)
        );
        """)

        print("Tables created or already exist.")
        connection.commit()  # Commit changes to the database
    except Error as e:
        print(f"Error creating tables: {e}")
    finally:
        cursor.close()

def populate_tables(connection):
    """Populate the tables with initial data."""
    cursor = connection.cursor()
    try:
        cursor.execute("USE Lucky_Shrub;")  # Use the created database
        
        # Insert data into Clients table
        cursor.execute("""
        INSERT INTO Clients(ClientID, FullName, ContactNumber, AddressID) VALUES
        ("Cl1", "Takashi Ito", 351786345, 1),
        ("Cl2", "Jane Murphy", 351567243, 2),
        ("Cl3", "Laurina Delgado", 351342597, 3),
        ("Cl4", "Benjamin Clauss", 351342509, 4),
        ("Cl5", "Altay Ayhan", 351208983, 5),
        ("Cl6", "Greta Galkina", 351298755, 6);
        """)

        # Insert data into Orders table
        cursor.execute("""
        INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date) VALUES
        (1, "Cl1", "P1", 10, 500, "2020-09-01"),
        (2, "Cl2", "P2", 5, 100, "2020-09-05"),
        (3, "Cl3", "P3", 20, 800, "2020-09-03"),
        (4, "Cl4", "P4", 15, 150, "2020-09-07"),
        (5, "Cl3", "P3", 10, 450, "2020-09-08"),
        (6, "Cl2", "P2", 5, 800, "2020-09-09"),
        (7, "Cl1", "P4", 22, 1200, "2020-09-10"),
        (8, "Cl3", "P1", 15, 150, "2020-09-10"),
        (9, "Cl1", "P1", 10, 500, "2020-09-12"),
        (10, "Cl2", "P2", 5, 100, "2020-09-13"),
        (11, "Cl4", "P5", 5, 100, "2020-09-15"),
        (12, "Cl1", "P1", 10, 500, "2022-09-01"),
        (13, "Cl2", "P2", 5, 100, "2022-09-05"),
        (14, "Cl3", "P3", 20, 800, "2022-09-03"),
        (15, "Cl4", "P4", 15, 150, "2022-09-07"),
        (16, "Cl3", "P3", 10, 450, "2022-09-08"),
        (17, "Cl2", "P2", 5, 800, "2022-09-09"),
        (18, "Cl1", "P4", 22, 1200, "2022-09-10"),
        (19, "Cl3", "P1", 15, 150, "2022-09-10"),
        (20, "Cl1", "P1", 10, 500, "2022-09-12"),
        (21, "Cl2", "P2", 5, 100, "2022-09-13"),
        (22, "Cl2", "P1", 10, 500, "2021-09-01"),
        (23, "Cl2", "P2", 5, 100, "2021-09-05"),
        (24, "Cl3", "P3", 20, 800, "2021-09-03"),
        (25, "Cl4", "P4", 15, 150, "2021-09-07"),
        (26, "Cl1", "P3", 10, 450, "2021-09-08"),
        (27, "Cl2", "P1", 20, 1000, "2022-09-01"),
        (28, "Cl2", "P2", 10, 200, "2022-09-05"),
        (29, "Cl3", "P3", 20, 800, "2021-09-03"),
        (30, "Cl1", "P1", 10, 500, "2022-09-01");
        """)

        # Insert data into Products table
        cursor.execute("""
        INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems) VALUES
        ("P1", "Artificial grass bags", 40, 50, 100),
        ("P2", "Wood panels", 15, 20, 250),
        ("P3", "Patio slates", 35, 40, 60),
        ("P4", "Sycamore trees", 7, 10, 50),
        ("P5", "Trees and Shrubs", 35, 50, 75),
        ("P6", "Water fountain", 65, 80, 15);
        """)

        # Insert data into Addresses table
        cursor.execute("""
        INSERT INTO Addresses (AddressID, Street, County) VALUES
        (1, "291 Oak Wood Avenue", "Graham County"),
        (2, "724 Greenway Drive", "Pinal County"),
        (3, "102 Sycamore Lane", "Santa Cruz County"),
        (4, "125 Roselawn Close", "Gila County"),
        (5, "831 Beechwood Terrace", "Cochise County"),
        (6, "755 Palm Tree Hills", "Mohave County"),
        (7, "751 Waterfall Hills", "Tucson County"),
        (8, "878 Riverside Lane", "Tucson County"),
        (9, "908 Seaview Hills", "Tucson County"),
        (10, "243 Waterview Terrace", "Tucson County"),
        (11, "148 Riverview Lane", "Tucson County"),
        (12, "178 Seaview Avenue", "Tucson County");
        """)

        print("Data inserted into tables.")
        connection.commit()  # Commit changes to the database
    except Error as e:
        print(f"Error inserting data: {e}")
    finally:
        cursor.close()

def task_1(connection):
    """Query to find total quantity of sycamore trees sold over 2020, 2021, and 2022."""
    cursor = connection.cursor()
    query = """
    SELECT CONCAT(SUM(Quantity), " (2020)") AS "P4 product: Quantity sold"
    FROM Orders WHERE YEAR(Date) = 2020 AND ProductID = "P4"
    UNION 
    SELECT CONCAT(SUM(Quantity), " (2021)") FROM Orders WHERE YEAR(Date) = 2021 AND ProductID = "P4"
    UNION 
    SELECT CONCAT(SUM(Quantity), " (2022)") FROM Orders WHERE YEAR(Date) = 2022 AND ProductID = "P4";
    """
    
    cursor.execute(query)
    result = cursor.fetchall()
    for row in result:
        print(row)
    cursor.close()

def task_2(connection):
    """Query to get client and order details for 2021 and 2022."""
    cursor = connection.cursor()
    query = """
    SELECT Clients.ClientID, Clients.ContactNumber, Addresses.Street, Addresses.County,
           Orders.OrderID, Orders.ProductID, Products.ProductName, Orders.Cost, Orders.Date 
    FROM Clients 
    INNER JOIN Addresses ON Clients.AddressID = Addresses.AddressID 
    INNER JOIN Orders ON Clients.ClientID = Orders.ClientID 
    INNER JOIN Products ON Orders.ProductID = Products.ProductID 
    WHERE YEAR(Orders.Date) IN (2021, 2022) 
    ORDER BY Orders.Date;
    """
    
    cursor.execute(query)
    result = cursor.fetchall()
    for row in result:
        print(row)
    cursor.close()

def task_3(connection):
    """Create a function to find sold quantity of a product by ProductID and year."""
    cursor = connection.cursor()
    cursor.execute("""
    CREATE FUNCTION FindSoldQuantity(product_id VARCHAR(10), YearInput INT) RETURNS INT DETERMINISTIC 
    RETURN (SELECT SUM(Quantity) FROM Orders WHERE ProductID = product_id AND YEAR(Date) = YearInput);
    """)

    print("Function FindSoldQuantity created.")

    # Test the function with Product ID 'P3' for the year 2021
    cursor.execute("SELECT FindSoldQuantity('P3', 2021);")
    result = cursor.fetchone()
    print(f"Quantity sold for Product P3 in 2021: {result[0]}")
    
    cursor.close()

def select_all_tables(connection):
    """Select and display all data from each table."""
    cursor = connection.cursor()
    
    tables = ['Clients', 'Orders', 'Products', 'Addresses']
    
    for table in tables:
        cursor.execute(f"SELECT * FROM {table};")
        rows = cursor.fetchall()
        print(f"\nData from {table}:")
        for row in rows:
            print(row)

    cursor.close()

def main():
    """Main function to execute all tasks."""
    connection = create_connection()
    if connection is not None:
        create_database(connection)
        create_tables(connection)
        populate_tables(connection)

        print("\n--- Task 1: Total Quantity of Sycamore Trees Sold ---")
        task_1(connection)

        print("\n--- Task 2: Client and Order Details for 2021 and 2022 ---")
        task_2(connection)

        print("\n--- Task 3: Find Sold Quantity Function ---")
        task_3(connection)

        print("\n--- Selecting All Data from Tables ---")
        select_all_tables(connection)

        connection.close()
    else:
        print("Failed to create database connection.")

if __name__ == "__main__":
    main()
