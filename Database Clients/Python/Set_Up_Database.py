import mysql.connector as connector
from mysql.connector import Error

def create_connection(user, password):
    """Establish a connection to the MySQL database.
    
    Args:
        user (str): The MySQL username.
        password (str): The MySQL password.
    
    Returns:
        connection: MySQL database connection object.
    """
    connection = None
    try:
        connection = connector.connect(user=user, password=password)
        if connection.is_connected():
            print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")
    return connection

def execute_query(connection, query):
    """Execute a single SQL query.
    
    Args:
        connection: MySQL database connection object.
        query (str): The SQL query to execute.
    """
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()  # Commit changes
        print("Query executed successfully")
    except Error as e:
        print(f"The error '{e}' occurred")

def main():
    # Define your MySQL credentials
    user = "your_username"  # Replace with your MySQL username
    password = "your_password"  # Replace with your MySQL password

    # Step 1: Establish a connection
    connection = create_connection(user, password)

    if connection:
        # Step 2: Create a cursor
        cursor = connection.cursor()

        # Step 3: Create the database and set it for use
        create_database_query = "CREATE DATABASE IF NOT EXISTS little_lemon_db;"
        execute_query(connection, create_database_query)
        
        use_database_query = "USE little_lemon_db;"
        execute_query(connection, use_database_query)

        # Step 4: Create tables
        create_menuitem_table = """
        CREATE TABLE IF NOT EXISTS MenuItems (
            ItemID INT AUTO_INCREMENT,
            Name VARCHAR(200),
            Type VARCHAR(100),
            Price INT,
            PRIMARY KEY (ItemID)
        );"""
        execute_query(connection, create_menuitem_table)

        create_menu_table = """
        CREATE TABLE IF NOT EXISTS Menus (
            MenuID INT,
            ItemID INT,
            Cuisine VARCHAR(100),
            PRIMARY KEY (MenuID, ItemID)
        );"""
        execute_query(connection, create_menu_table)

        create_booking_table = """
        CREATE TABLE IF NOT EXISTS Bookings (
            BookingID INT AUTO_INCREMENT,
            TableNo INT,
            GuestFirstName VARCHAR(100) NOT NULL,
            GuestLastName VARCHAR(100) NOT NULL,
            BookingSlot TIME NOT NULL,
            EmployeeID INT,
            PRIMARY KEY (BookingID)
        );"""
        execute_query(connection, create_booking_table)

        create_orders_table = """
        CREATE TABLE IF NOT EXISTS Orders (
            OrderID INT,
            TableNo INT,
            MenuID INT,
            BookingID INT,
            BillAmount INT,
            Quantity INT,
            PRIMARY KEY (OrderID, TableNo)
        );"""
        execute_query(connection, create_orders_table)

        create_employees_table = """
        CREATE TABLE IF NOT EXISTS Employees (
            EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
            Name VARCHAR(255),
            Role VARCHAR(100),
            Address VARCHAR(255),
            Contact_Number INT,
            Email VARCHAR(255),
            Annual_Salary VARCHAR(100)
        );"""
        execute_query(connection, create_employees_table)

        # Step 5: Insert data into tables
        insert_menuitems = """
        INSERT INTO MenuItems (Name, Type, Price) VALUES
        ('Olives','Starters',5),
        ('Flatbread','Starters', 5),
        ('Minestrone', 'Starters', 8),
        ('Tomato bread','Starters', 8),
        ('Falafel', 'Starters', 7),
        ('Hummus', 'Starters', 5),
        ('Greek salad', 'Main Courses', 15),
        ('Bean soup', 'Main Courses', 12),
        ('Pizza', 'Main Courses', 15),
        ('Greek yoghurt','Desserts', 7),
        ('Ice cream', 'Desserts', 6),
        ('Cheesecake', 'Desserts', 4),
        ('Athens White wine', 'Drinks', 25),
        ('Corfu Red Wine', 'Drinks', 30),
        ('Turkish Coffee', 'Drinks', 10),
        ('Kabasa', 'Main Courses', 17);"""
        execute_query(connection, insert_menuitems)

        insert_menu = """
        INSERT INTO Menus (MenuID, ItemID, Cuisine) VALUES
        (1, 1, 'Greek'),
        (1, 7, 'Greek'),
        (1, 10, 'Greek'),
        (1, 13, 'Greek'),
        (2, 3, 'Italian'),
        (2, 9, 'Italian'),
        (2, 12, 'Italian'),
        (2, 15, 'Italian'),
        (3, 5, 'Turkish'),
        (3, 17, 'Turkish');"""
        execute_query(connection, insert_menu)

        insert_bookings = """
        INSERT INTO Bookings (TableNo, GuestFirstName, GuestLastName, BookingSlot, EmployeeID) VALUES
        (1, 'John', 'Doe', '18:30:00', 1),
        (2, 'Jane', 'Smith', '19:00:00', 2),
        (3, 'Mike', 'Johnson', '20:00:00', 1);"""
        execute_query(connection, insert_bookings)

        insert_orders = """
        INSERT INTO Orders (OrderID, TableNo, MenuID, BookingID, BillAmount, Quantity) VALUES
        (1, 1, 7, 1, 15, 1),
        (2, 2, 9, 2, 15, 2),
        (3, 3, 12, 3, 6, 3);"""
        execute_query(connection, insert_orders)

        insert_employees = """
        INSERT INTO Employees (Name, Role, Address, Contact_Number, Email, Annual_Salary) VALUES
        ('Alice', 'Manager', '123 Main St', 1234567890, 'alice@example.com', '50000'),
        ('Bob', 'Chef', '456 Elm St', 9876543210, 'bob@example.com', '40000');"""
        execute_query(connection, insert_employees)

        print("Data has been inserted into tables successfully.")

        # Close the connection
        connection.close()
        print("Connection to MySQL DB closed")

if __name__ == "__main__":
    main()
