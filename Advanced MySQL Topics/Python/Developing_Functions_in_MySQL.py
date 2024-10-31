import mysql.connector

def create_database_and_tables():
    """Creates the Lucky Shrub database, Orders table, function, and stored procedure."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!"
    )

    try:
        cursor = db_connection.cursor()
        
        # Create the Lucky Shrub database
        cursor.execute("CREATE DATABASE IF NOT EXISTS Lucky_Shrub;")
        cursor.execute("USE Lucky_Shrub;")
        
        # Drop the Orders table if it exists
        cursor.execute("DROP TABLE IF EXISTS Orders;")

        # Create the Orders table
        cursor.execute("""
            CREATE TABLE Orders (
                OrderID INT NOT NULL PRIMARY KEY,
                ClientID VARCHAR(10),
                ProductID VARCHAR(10),
                Quantity INT,
                Cost DECIMAL(6,2),
                OrderDate DATE
            );
        """)

        # Insert sample data into the Orders table
        cursor.execute("""
            INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, OrderDate) VALUES
            (1, "Cl1", "P1", 10, 500, "2020-09-01"),
            (2, "Cl2", "P2", 5, 100, "2020-09-05"),
            (3, "Cl3", "P3", 20, 800, "2020-09-03"),
            (4, "Cl4", "P4", 15, 150, "2020-09-07"),
            (5, "Cl3", "P3", 10, 450, "2020-09-08"),
            (6, "Cl2", "P2", 5, 800, "2020-09-09"),
            (7, "Cl1", "P4", 22, 1200, "2020-09-10"),
            (8, "Cl3", "P1", 15, 150, "2020-09-10"),
            (9, "Cl1", "P1", 10, 500, "2020-09-12");
        """)

        # Create the FindCost function
        cursor.execute("""
            CREATE FUNCTION FindCost(order_id INT) RETURNS DECIMAL(5,2) DETERMINISTIC 
            BEGIN
                DECLARE cost_value DECIMAL(5,2);
                SELECT Cost INTO cost_value FROM Orders WHERE OrderID = order_id;
                RETURN cost_value;
            END;
        """)

        # Create the GetDiscount stored procedure
        cursor.execute("""
            CREATE PROCEDURE GetDiscount(OrderIDInput INT) 
            BEGIN
                DECLARE cost_after_discount DECIMAL(7,2);
                DECLARE current_cost DECIMAL(7,2);
                DECLARE order_quantity INT;

                SELECT Quantity INTO order_quantity FROM Orders WHERE OrderID = OrderIDInput;
                SELECT Cost INTO current_cost FROM Orders WHERE OrderID = OrderIDInput;

                IF order_quantity >= 20 THEN
                    SET cost_after_discount = current_cost - (current_cost * 0.2);
                ELSEIF order_quantity >= 10 THEN
                    SET cost_after_discount = current_cost - (current_cost * 0.1);
                ELSE
                    SET cost_after_discount = current_cost;
                END IF;

                SELECT cost_after_discount;
            END;
        """)

        print("Database, table, function, and procedure created successfully.")

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        db_connection.close()

def find_cost(order_id):
    """Fetches and prints the cost of a specific order by Order ID."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    try:
        cursor = db_connection.cursor()
        
        # Call the FindCost function
        cursor.execute("SELECT FindCost(%s);", (order_id,))
        cost = cursor.fetchone()[0]  # Fetch the result
        
        print(f"The cost for Order ID {order_id} is: {cost:.2f}")

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        db_connection.close()

def get_discount(order_id):
    """Fetches and prints the final cost after discount for a specific order by Order ID."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    try:
        cursor = db_connection.cursor()
        
        # Call the GetDiscount stored procedure
        cursor.callproc('GetDiscount', [order_id])
        
        # Fetch the result from the stored procedure
        for result in cursor.stored_results():
            discounted_cost = result.fetchone()[0]  # Fetch the result
        
        print(f"The final cost after discount for Order ID {order_id} is: {discounted_cost:.2f}")

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        db_connection.close()

if __name__ == "__main__":
    create_database_and_tables()  # Create database and tables first
    order_id_to_check = 5  # Example Order ID
    find_cost(order_id_to_check)  # Fetch and print the cost
    get_discount(order_id_to_check)  # Fetch and print the discounted cost
