import mysql.connector

def create_database_and_tables():
    """Creates the Lucky Shrub database and Products and Notifications tables."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!"
    )
    
    cursor = db_connection.cursor()
    
    # Create the Lucky Shrub database
    cursor.execute("CREATE DATABASE IF NOT EXISTS Lucky_Shrub;")
    cursor.execute("USE Lucky_Shrub;")
    
    # Drop the Products table if it exists
    cursor.execute("DROP TABLE IF EXISTS Products;")
    
    # Create the Products table
    cursor.execute("""
        CREATE TABLE Products (
            ProductID VARCHAR(10),
            ProductName VARCHAR(100),
            BuyPrice DECIMAL(6,2),
            SellPrice DECIMAL(6,2),
            NumberOfItems INT
        );
    """)
    
    # Drop the Notifications table if it exists
    cursor.execute("DROP TABLE IF EXISTS Notifications;")
    
    # Create the Notifications table
    cursor.execute("""
        CREATE TABLE Notifications (
            NotificationID INT AUTO_INCREMENT PRIMARY KEY,
            Notification VARCHAR(255),
            DateTime TIMESTAMP NOT NULL
        );
    """)
    
    print("Database and tables created successfully.")
    cursor.close()
    db_connection.close()

def create_triggers():
    """Creates triggers for the Products table."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Trigger to check SellPrice after inserting a new product
    cursor.execute("""
        CREATE TRIGGER ProductSellPriceInsertCheck
        AFTER INSERT ON Products
        FOR EACH ROW
        BEGIN
            IF NEW.SellPrice < NEW.BuyPrice THEN
                INSERT INTO Notifications (Notification, DateTime) 
                VALUES (CONCAT('A SellPrice less than the BuyPrice was inserted for ProductID ', NEW.ProductID), NOW());
            END IF;
        END;
    """)
    
    print("Trigger ProductSellPriceInsertCheck created successfully.")
    
    # Trigger to check SellPrice after updating a product
    cursor.execute("""
        CREATE TRIGGER ProductSellPriceUpdateCheck
        AFTER UPDATE ON Products
        FOR EACH ROW
        BEGIN
            IF NEW.SellPrice <= NEW.BuyPrice THEN
                INSERT INTO Notifications (Notification, DateTime) 
                VALUES (CONCAT(NEW.ProductID, ' was updated with a SellPrice of ', NEW.SellPrice, ' which is the same or less than the BuyPrice'), NOW());
            END IF;
        END;
    """)
    
    print("Trigger ProductSellPriceUpdateCheck created successfully.")
    
    # Trigger to notify when a product is deleted
    cursor.execute("""
        CREATE TRIGGER NotifyProductDelete
        AFTER DELETE ON Products
        FOR EACH ROW
        BEGIN
            INSERT INTO Notifications (Notification, DateTime) 
            VALUES (CONCAT('The product with a ProductID ', OLD.ProductID, ' was deleted'), NOW());
        END;
    """)
    
    print("Trigger NotifyProductDelete created successfully.")
    
    cursor.close()
    db_connection.close()

def populate_products():
    """Populates the Products table with initial data."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Insert initial product data
    cursor.execute("""
        INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems)
        VALUES 
        ("P1", "Artificial grass bags", 40, 50, 100),
        ("P2", "Wood panels", 15, 20, 250),
        ("P3", "Patio slates", 35, 40, 60),
        ("P4", "Sycamore trees", 7, 10, 50),
        ("P5", "Trees and Shrubs", 35, 50, 75),
        ("P6", "Water fountain", 65, 80, 15);
    """)
    
    print("Products table populated successfully.")
    cursor.close()
    db_connection.close()

def main():
    create_database_and_tables()  # Create database and tables
    create_triggers()              # Create triggers
    populate_products()            # Populate Products table

if __name__ == "__main__":
    main()
