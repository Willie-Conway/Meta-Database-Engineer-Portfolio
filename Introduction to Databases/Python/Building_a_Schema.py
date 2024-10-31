import mysql.connector
from mysql.connector import Error

def create_database_and_tables():
    connection = None  # Initialize connection variable
    try:
        # Establish a connection to the MySQL server
        connection = mysql.connector.connect(
            host='localhost',
            user='mario',  # Replace with your MySQL username
            password='cuisine'  # Replace with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()

            # Create the restaurant database
            cursor.execute("CREATE DATABASE IF NOT EXISTS restaurant;")
            cursor.execute("USE restaurant;")

            # Create the 'tbl' table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS tbl (
                table_id INT PRIMARY KEY,
                location VARCHAR(255)
            );
            """)

            # Create the 'waiter' table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS waiter (
                waiter_id INT PRIMARY KEY,
                name VARCHAR(150),
                contact_no VARCHAR(10),
                shift VARCHAR(10)
            );
            """)

            # Create the 'table_order' table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS table_order (
                order_id INT PRIMARY KEY,
                date_time DATETIME,
                table_id INT,
                waiter_id INT,
                FOREIGN KEY (table_id) REFERENCES tbl(table_id),
                FOREIGN KEY (waiter_id) REFERENCES waiter(waiter_id)
            );
            """)

            # Create the 'customer' table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS customer (
                customer_id INT PRIMARY KEY,
                name VARCHAR(100),
                NIC_no VARCHAR(12),
                contact_no VARCHAR(10)
            );
            """)

            # Create the 'reservation' table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS reservation (
                reservation_id INT PRIMARY KEY,
                date_time DATETIME,
                no_of_pax INT,
                order_id INT,
                table_id INT,
                customer_id INT,
                FOREIGN KEY (order_id) REFERENCES table_order(order_id),
                FOREIGN KEY (table_id) REFERENCES tbl(table_id),
                FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
            );
            """)

            # Create the 'menu' table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS menu (
                menu_id INT PRIMARY KEY,
                description VARCHAR(255),
                availability INT
            );
            """)

            # Create the 'menu_item' table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS menu_item (
                menu_item_id INT PRIMARY KEY,
                description VARCHAR(255),
                price FLOAT,
                availability INT,
                menu_id INT,
                FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
            );
            """)

            # Create the 'order_menu_item' table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS order_menu_item (
                order_id INT,
                menu_item_id INT,
                quantity INT,
                PRIMARY KEY (order_id, menu_item_id),
                FOREIGN KEY (order_id) REFERENCES table_order(order_id),
                FOREIGN KEY (menu_item_id) REFERENCES menu_item(menu_item_id)
            );
            """)

            print("Database and tables created successfully.")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_database_and_tables()
