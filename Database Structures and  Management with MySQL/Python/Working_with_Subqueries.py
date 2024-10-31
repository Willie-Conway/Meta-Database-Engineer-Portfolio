import mysql.connector

def create_connection():
    """Create a connection to the MySQL database."""
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",  # Replace with your actual password
    )
    return connection

def setup_database(cursor):
    """Create the Little Lemon database and necessary tables."""
    # Step 1: Create the database if it doesn't exist
    cursor.execute("CREATE DATABASE IF NOT EXISTS littlelemon_db;")
    cursor.execute("USE littlelemon_db;")  # Use the created database

    # Step 2: Create the MenuItems table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS MenuItems (
            ItemID INT PRIMARY KEY,
            Name VARCHAR(200),
            Type VARCHAR(100),
            Price INT
        );
    """)

    # Step 3: Create the Menus table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS Menus (
            MenuID INT,
            ItemID INT,
            Cuisine VARCHAR(100),
            PRIMARY KEY (MenuID, ItemID)
        );
    """)

    # Step 4: Create the Bookings table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS Bookings (
            BookingID INT PRIMARY KEY,
            TableNo INT,
            GuestFirstName VARCHAR(100),
            GuestLastName VARCHAR(100),
            BookingSlot TIME,
            EmployeeID INT
        );
    """)

    # Step 5: Create the TableOrders table
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS TableOrders (
            OrderID INT,
            TableNo INT,
            MenuID INT,
            BookingID INT,
            BillAmount INT,
            Quantity INT,
            PRIMARY KEY (OrderID, TableNo)
        );
    """)

    # Step 6: Insert data into MenuItems
    cursor.execute("""
        INSERT IGNORE INTO MenuItems VALUES
        (1, 'Olives', 'Starters', 5),
        (2, 'Flatbread', 'Starters', 5),
        (3, 'Minestrone', 'Starters', 8),
        (4, 'Tomato bread', 'Starters', 8),
        (5, 'Falafel', 'Starters', 7),
        (6, 'Hummus', 'Starters', 5),
        (7, 'Greek salad', 'Main Courses', 15),
        (8, 'Bean soup', 'Main Courses', 12),
        (9, 'Pizza', 'Main Courses', 15),
        (10, 'Greek yoghurt', 'Desserts', 7),
        (11, 'Ice cream', 'Desserts', 6),
        (12, 'Cheesecake', 'Desserts', 4),
        (13, 'Athens White wine', 'Drinks', 25),
        (14, 'Corfu Red Wine', 'Drinks', 30),
        (15, 'Turkish Coffee', 'Drinks', 10),
        (16, 'Turkish Coffee', 'Drinks', 10),
        (17, 'Kabasa', 'Main Courses', 17);
    """)

    # Step 7: Insert data into Menus
    cursor.execute("""
        INSERT IGNORE INTO Menus VALUES
        (1, 1, 'Greek'),
        (1, 7, 'Greek'),
        (1, 10, 'Greek'),
        (1, 13, 'Greek'),
        (2, 3, 'Italian'),
        (2, 9, 'Italian'),
        (2, 12, 'Italian'),
        (2, 15, 'Italian'),
        (3, 5, 'Turkish'),
        (3, 17, 'Turkish'),
        (3, 11, 'Turkish'),
        (3, 16, 'Turkish');
    """)

    # Step 8: Insert data into Bookings
    cursor.execute("""
        INSERT IGNORE INTO Bookings VALUES
        (1, 12, 'Anna', 'Iversen', '19:00:00', 1),
        (2, 12, 'Joakim', 'Iversen', '19:00:00', 1),
        (3, 19, 'Vanessa', 'McCarthy', '15:00:00', 3),
        (4, 15, 'Marcos', 'Romero', '17:30:00', 4),
        (5, 5, 'Hiroki', 'Yamane', '18:30:00', 2),
        (6, 8, 'Diana', 'Pinto', '20:00:00', 5);
    """)

    # Step 9: Insert data into TableOrders
    cursor.execute("""
        INSERT IGNORE INTO TableOrders VALUES
        (1, 12, 1, 1, 2, 86),
        (2, 19, 2, 2, 1, 37),
        (3, 15, 2, 3, 1, 37),
        (4, 5, 3, 4, 1, 40),
        (5, 8, 1, 5, 1, 43);
    """)

def query_bookings_after_vanessa(cursor):
    """Query to find bookings after Vanessa McCarthy's booking."""
    cursor.execute("""
        SELECT * FROM Bookings 
        WHERE BookingSlot > (
            SELECT BookingSlot 
            FROM Bookings 
            WHERE GuestFirstName = 'Vanessa' AND GuestLastName = 'McCarthy'
        );
    """)
    results = cursor.fetchall()
    print("Bookings after Vanessa McCarthy's booking:")
    for row in results:
        print(row)

def query_expensive_menu_items(cursor):
    """Query to find menu items more expensive than all starters and desserts."""
    cursor.execute("""
        SELECT * FROM MenuItems 
        WHERE Price > ALL (
            SELECT Price 
            FROM MenuItems 
            WHERE Type IN ('Starters', 'Desserts')
        );
    """)
    results = cursor.fetchall()
    print("\nMenu items more expensive than all Starters and Desserts:")
    for row in results:
        print(row)

def query_same_price_as_italian_starters(cursor):
    """Query to find menu items that cost the same as Italian starter menu items."""
    cursor.execute("""
        SELECT * FROM MenuItems 
        WHERE Price = (
            SELECT Price 
            FROM Menus, MenuItems 
            WHERE Menus.ItemID = MenuItems.ItemID 
            AND MenuItems.Type = 'Starters' 
            AND Cuisine = 'Italian'
        );
    """)
    results = cursor.fetchall()
    print("\nMenu items that cost the same as Italian Starters:")
    for row in results:
        print(row)

def query_not_ordered_menu_items(cursor):
    """Query to find menu items that were not ordered by guests."""
    cursor.execute("""
        SELECT * FROM MenuItems 
        WHERE NOT EXISTS (
            SELECT * 
            FROM TableOrders, Menus 
            WHERE TableOrders.MenuID = Menus.MenuID 
            AND Menus.ItemID = MenuItems.ItemID
        );
    """)
    results = cursor.fetchall()
    print("\nMenu items that were not ordered:")
    for row in results:
        print(row)

def main():
    connection = create_connection()
    cursor = connection.cursor()

    try:
        setup_database(cursor)
        query_bookings_after_vanessa(cursor)
        query_expensive_menu_items(cursor)
        query_same_price_as_italian_starters(cursor)
        query_not_ordered_menu_items(cursor)
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.commit()
        connection.close()

if __name__ == "__main__":
    main()
