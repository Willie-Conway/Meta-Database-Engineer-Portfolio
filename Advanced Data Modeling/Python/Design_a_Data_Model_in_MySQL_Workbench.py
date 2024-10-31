import mysql.connector
from mysql.connector import Error

# Database connection configuration
db_config = {
    'host': 'localhost',  # Update with your database host
    'database': 'mangata_gallo',  # Update with your database name
    'user': 'root',  # Update with your MySQL username
    'password': 'Admin@LL123!'  # Update with your MySQL password
}

def create_connection(config):
    """Create a database connection."""
    conn = None
    try:
        conn = mysql.connector.connect(**config)
        if conn.is_connected():
            print("Connected to MySQL database")
    except Error as e:
        print(f"Error: {e}")
    return conn

def create_tables(conn):
    """Create tables in the database."""
    create_clients_table = """
    CREATE TABLE IF NOT EXISTS Clients (
        ClientID INT AUTO_INCREMENT PRIMARY KEY,
        Name VARCHAR(100) NOT NULL,
        PhoneNumber VARCHAR(15),
        Email VARCHAR(100) NOT NULL UNIQUE
    );
    """

    create_products_table = """
    CREATE TABLE IF NOT EXISTS Products (
        ProductID INT AUTO_INCREMENT PRIMARY KEY,
        ItemName VARCHAR(100) NOT NULL,
        Price DECIMAL(10, 2) NOT NULL,
        Quantity INT NOT NULL
    );
    """

    create_orders_table = """
    CREATE TABLE IF NOT EXISTS Orders (
        OrderID INT AUTO_INCREMENT PRIMARY KEY,
        OrderDate DATE NOT NULL,
        DeliveryStatus VARCHAR(50) NOT NULL,
        ClientID INT,
        FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
    );
    """

    create_delivery_table = """
    CREATE TABLE IF NOT EXISTS Delivery (
        DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
        Address VARCHAR(255) NOT NULL,
        ZipCode VARCHAR(10),
        State VARCHAR(50)
    );
    """

    create_address_table = """
    CREATE TABLE IF NOT EXISTS Address (
        AddressID INT AUTO_INCREMENT PRIMARY KEY,
        OrderID INT,
        DeliveryID INT,
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
        FOREIGN KEY (DeliveryID) REFERENCES Delivery(DeliveryID)
    );
    """

    cursor = conn.cursor()
    try:
        cursor.execute(create_clients_table)
        cursor.execute(create_products_table)
        cursor.execute(create_orders_table)
        cursor.execute(create_delivery_table)
        cursor.execute(create_address_table)
        print("Tables created successfully")
    except Error as e:
        print(f"Error: {e}")
    finally:
        cursor.close()

def insert_data(conn):
    """Insert data into the tables."""
    insert_clients = """
    INSERT INTO Clients (Name, PhoneNumber, Email) VALUES
    ('Vanessa McCarthy', '757536378', 'vm@mangatagallo.com'),
    ('Marcos Romero', '757536379', 'mr@mangatagallo.com'),
    ('Hiroki Yamane', '757536376', 'hy@mangatagallo.com'),
    ('Anna Iversen', '757536375', 'ai@mangatagallo.com'),
    ('Diana Pinto', '757536374', 'dp@mangatagallo.com');
    """

    insert_products = """
    INSERT INTO Products (ItemName, Price, Quantity) VALUES
    ('Engagement ring', 2000.00, 25),
    ('Silver brooch', 300.00, 100),
    ('Earrings', 1000.00, 100),
    ('Luxury watch', 500.00, 50),
    ('Golden bracelet', 800.00, 100);
    """

    insert_orders = """
    INSERT INTO Orders (OrderDate, DeliveryStatus, ClientID) VALUES
    ('2022-10-15', 'Done', 1),
    ('2022-10-16', 'Done', 2),
    ('2022-10-17', 'Done', 3),
    ('2022-10-20', 'Done', 1),
    ('2022-10-22', 'Done', 3);
    """

    insert_delivery = """
    INSERT INTO Delivery (Address, ZipCode, State) VALUES
    ('812 Diamond Crescent, North Burnet, TX', '78611', 'Texas'),
    ('785 Bronze Lane, East Austin, TX', '78717', 'Texas'),
    ('908 Diamond Crescent, South Lamar, TX', '76643', 'Texas'),
    ('345 Golden Hills, North Austin, TX', '78759', 'Texas');
    """

    insert_address = """
    INSERT INTO Address (OrderID, DeliveryID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 1);
    """

    cursor = conn.cursor()
    try:
        cursor.execute(insert_clients)
        cursor.execute(insert_products)
        cursor.execute(insert_orders)
        cursor.execute(insert_delivery)
        cursor.execute(insert_address)
        conn.commit()
        print("Data inserted successfully")
    except Error as e:
        print(f"Error: {e}")
    finally:
        cursor.close()

def create_view(conn):
    """Create a view to summarize orders."""
    create_view_sql = """
    CREATE VIEW orders_view AS
    SELECT 
        o.OrderID,
        c.Name AS ClientName,
        p.ItemName AS ProductName,
        o.OrderDate,
        o.DeliveryStatus,
        d.Address,
        d.ZipCode,
        d.State
    FROM 
        Orders o
    INNER JOIN 
        Clients c ON o.ClientID = c.ClientID
    INNER JOIN 
        Address a ON o.OrderID = a.OrderID
    INNER JOIN 
        Delivery d ON a.DeliveryID = d.DeliveryID
    INNER JOIN 
        Products p ON o.OrderID = p.ProductID;  -- Adjust join logic based on actual keys
    """
    
    cursor = conn.cursor()
    try:
        cursor.execute(create_view_sql)
        conn.commit()
        print("View created successfully")
    except Error as e:
        print(f"Error: {e}")
    finally:
        cursor.close()

def main():
    conn = create_connection(db_config)
    if conn:
        create_tables(conn)
        insert_data(conn)
        create_view(conn)
        conn.close()

if __name__ == '__main__':
    main()
