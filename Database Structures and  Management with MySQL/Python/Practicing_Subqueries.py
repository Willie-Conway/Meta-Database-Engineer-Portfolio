import mysql.connector

def create_connection():
    """Create a connection to the MySQL database."""
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",  # Replace with your actual password
        database="littlelemon_db"  # Specify the database to connect to
    )
    return connection

def create_low_cost_table(cursor):
    """Create the LowCostMenuItems table if it doesn't exist."""
    create_table_query = """
    CREATE TABLE IF NOT EXISTS LowCostMenuItems (
        ItemID INT,
        Name VARCHAR(200),
        Price INT,
        PRIMARY KEY(ItemID)
    );
    """
    cursor.execute(create_table_query)
    print("LowCostMenuItems table created (if it didn't exist).")

def task_1(cursor):
    """Task 1: Find the minimum and maximum average prices."""
    query = """
    SELECT ROUND(MIN(avgPrice), 2) AS MinAvgPrice, ROUND(MAX(avgPrice), 2) AS MaxAvgPrice
    FROM (SELECT Type, AVG(Price) AS avgPrice 
          FROM MenuItems 
          GROUP BY Type) AS aPrice;
    """
    
    cursor.execute(query)
    result = cursor.fetchone()
    print(f"Minimum Average Price: ${result[0]}, Maximum Average Price: ${result[1]}")

def task_2(cursor):
    """Task 2: Insert data of menu items with a minimum price based on the 'Type' into the LowCostMenuItems table."""
    query = """
    INSERT INTO LowCostMenuItems (ItemID, Name, Price)
    SELECT ItemID, Name, Price 
    FROM MenuItems 
    WHERE Price = ANY (SELECT MIN(Price) 
                       FROM MenuItems 
                       GROUP BY Type);
    """
    
    cursor.execute(query)
    print("Inserted low-cost menu items into LowCostMenuItems table.")

def task_3(cursor):
    """Task 3: Delete all low-cost menu items whose price is more than the minimum price of menu items that are between $5 and $10."""
    query = """
    DELETE FROM LowCostMenuItems 
    WHERE Price > ALL (SELECT MIN(Price) 
                       FROM MenuItems 
                       GROUP BY Type 
                       HAVING MIN(Price) BETWEEN 5 AND 10);
    """
    
    cursor.execute(query)
    print("Deleted low-cost menu items with prices exceeding the minimum price between $5 and $10.")

def main():
    """Main function to execute tasks."""
    connection = create_connection()
    cursor = connection.cursor()

    try:
        create_low_cost_table(cursor)  # Ensure the LowCostMenuItems table exists
        
        # Task 1: Find min and max average prices
        task_1(cursor)
        
        # Task 2: Insert low-cost menu items
        task_2(cursor)
        
        # Task 3: Delete specific low-cost menu items
        task_3(cursor)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.commit()  # Commit the changes made in the database
        connection.close()    # Close the database connection

if __name__ == "__main__":
    main()
