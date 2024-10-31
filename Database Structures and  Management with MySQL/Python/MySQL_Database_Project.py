import mysql.connector
from mysql.connector import Error

def create_connection():
    """Create a database connection to a MySQL database."""
    connection = None
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',  # Replace with your MySQL username
            password='Admin@LL123!',  # Replace with your MySQL password
            database='Little_Lemon'  # Database to connect to
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")

    return connection

def execute_query(connection, query):
    """Execute a single query."""
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()
        print("Query executed successfully")
    except Error as e:
        print(f"The error '{e}' occurred")

def drop_tables(connection):
    """Drop existing tables if they exist."""
    execute_query(connection, "SET FOREIGN_KEY_CHECKS = 0;")
    
    drop_bookings_table = "DROP TABLE IF EXISTS Bookings;"
    drop_courses_table = "DROP TABLE IF EXISTS Courses;"
    drop_customers_table = "DROP TABLE IF EXISTS Customers;"
    
    execute_query(connection, drop_bookings_table)
    execute_query(connection, drop_courses_table)
    execute_query(connection, drop_customers_table)
    
    execute_query(connection, "SET FOREIGN_KEY_CHECKS = 1;")

def create_tables(connection):
    """Create necessary tables."""
    print("Creating tables...")
    
    create_customers_table = """
    CREATE TABLE Customers (
        CustomerID INT NOT NULL PRIMARY KEY,
        FullName VARCHAR(100) NOT NULL,
        PhoneNumber INT NOT NULL UNIQUE
    );
    """
    execute_query(connection, create_customers_table)

    create_courses_table = """
    CREATE TABLE Courses (
        CourseName VARCHAR(255) PRIMARY KEY,
        Cost DECIMAL(4, 2)
    );
    """
    execute_query(connection, create_courses_table)

    create_bookings_table = """
    CREATE TABLE Bookings (
        BookingID INT,
        BookingDate DATE NOT NULL,
        TableNumber INT,
        NumberOfGuests INT,
        CustomerID INT,
        PRIMARY KEY (BookingID),
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    );
    """
    execute_query(connection, create_bookings_table)

def populate_data(connection):
    """Populate initial data into the tables."""
    # Populate Customers
    print("Populating 'Customers' table...")
    insert_customers = """
    INSERT INTO Customers (CustomerID, FullName, PhoneNumber) VALUES 
    (1, "Vanessa McCarthy", 0757536378), 
    (2, "Marcos Romero", 0757536379), 
    (3, "Hiroki Yamane", 0757536376), 
    (4, "Anna Iversen", 0757536375), 
    (5, "Diana Pinto", 0757536374),     
    (6, "Altay Ayhan", 0757636378),      
    (7, "Jane Murphy", 0753536379),      
    (8, "Laurina Delgado", 0754536376),      
    (9, "Mike Edwards", 0757236375),     
    (10, "Karl Pederson", 0757936374);
    """
    execute_query(connection, insert_customers)

    # Populate Courses
    print("Populating 'Courses' table...")
    insert_courses = """
    INSERT INTO Courses (CourseName, Cost) VALUES 
    ("Greek salad", 15.50), 
    ("Bean soup", 12.25), 
    ("Pizza", 15.00), 
    ("Carbonara", 12.50), 
    ("Kabasa", 17.00), 
    ("Shwarma", 11.30);
    """
    execute_query(connection, insert_courses)

    # Populate Bookings
    print("Populating 'Bookings' table...")
    insert_bookings = """
    INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES 
    (10, '2021-11-10', 7, 5, 1),  
    (11, '2021-11-10', 5, 2, 2),  
    (12, '2021-11-10', 3, 2, 4), 
    (13, '2021-11-11', 2, 5, 5),  
    (14, '2021-11-11', 5, 2, 6),  
    (15, '2021-11-11', 3, 2, 7), 
    (16, '2021-11-11', 3, 5, 1),  
    (17, '2021-11-12', 5, 2, 2),  
    (18, '2021-11-12', 3, 2, 4), 
    (19, '2021-11-13', 7, 5, 6),  
    (20, '2021-11-14', 5, 2, 3),  
    (21, '2021-11-14', 3, 2, 4);
    """
    execute_query(connection, insert_bookings)

def main():
    """Main function to run the script."""
    connection = create_connection()

    if connection:
        drop_tables(connection)
        create_tables(connection)
        populate_data(connection)

        # Task 1: Fetching bookings for specific dates
        print("Task 1: Fetching bookings for dates 2021-11-11 to 2021-11-13...")
        cursor = connection.cursor()
        cursor.execute("""
        SELECT * FROM Bookings 
        WHERE BookingDate BETWEEN '2021-11-11' AND '2021-11-13';
        """)
        bookings = cursor.fetchall()
        for booking in bookings:
            print(booking)

        cursor.close()
        connection.close()

if __name__ == "__main__":
    main()
