import mysql.connector

def create_database_and_table():
    """Creates the Lucky Shrub database and the Orders table."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!"
    )
    
    cursor = db_connection.cursor()
    
    # Create the database
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
    
    print("Database and Orders table created successfully.")
    cursor.close()
    db_connection.close()

def create_triggers():
    """Creates triggers for the Orders table."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Trigger to enforce quantity constraint on insert
    cursor.execute("""
        CREATE TRIGGER OrderQtyCheck
        BEFORE INSERT ON Orders
        FOR EACH ROW
        BEGIN
            IF NEW.Quantity < 0 THEN
                SET NEW.Quantity = 0;  -- Set Quantity to 0 if negative
            END IF;
        END;
    """)
    
    print("Trigger OrderQtyCheck created successfully.")
    
    # Trigger for audit trail on delete
    cursor.execute("""
        CREATE TRIGGER AfterDeleteOrder
        AFTER DELETE ON Orders
        FOR EACH ROW
        BEGIN
            INSERT INTO Audits (AuditID, TriggerTime, Description, ActionType) 
            VALUES (NULL, CURRENT_TIMESTAMP, 
                    CONCAT('Order ', OLD.OrderID, ' was deleted at ', CURRENT_TIME(), ' on ', CURRENT_DATE()), 
                    'DELETE');
        END;
    """)
    
    print("Trigger AfterDeleteOrder created successfully.")
    
    cursor.close()
    db_connection.close()

def create_audit_table():
    """Creates the Audits table for tracking deleted orders."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Drop the Audits table if it exists
    cursor.execute("DROP TABLE IF EXISTS Audits;")
    
    # Create the Audits table
    cursor.execute("""
        CREATE TABLE Audits (
            AuditID INT AUTO_INCREMENT PRIMARY KEY,
            TriggerTime DATETIME,
            Description TEXT,
            ActionType VARCHAR(10)
        );
    """)
    
    print("Audits table created successfully.")
    cursor.close()
    db_connection.close()

def show_triggers():
    """Displays all triggers in the Lucky Shrub database."""
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Lucky_Shrub"
    )
    
    cursor = db_connection.cursor()
    
    # Show all triggers
    cursor.execute("SHOW TRIGGERS;")
    triggers = cursor.fetchall()
    
    print("Triggers in the database:")
    for trigger in triggers:
        print(trigger)
    
    cursor.close()
    db_connection.close()

def main():
    create_database_and_table()  # Create database and table
    create_audit_table()         # Create audit table for triggers
    create_triggers()            # Create triggers
    show_triggers()              # List all triggers

if __name__ == "__main__":
    main()
