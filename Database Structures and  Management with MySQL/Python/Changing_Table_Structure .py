import mysql.connector

def create_connection():
    """Establish a connection to the MySQL database."""
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="Mangata_Gallo"
    )
    return connection

def force_drop_table(cursor, table_name):
    """Forcefully drop a table by disabling foreign key checks."""
    cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")  # Disable foreign key checks
    try:
        cursor.execute(f"DROP TABLE IF EXISTS {table_name};")
        print(f"{table_name} table dropped successfully.")
    except mysql.connector.Error as err:
        print(f"Error dropping {table_name} table: {err}")
    finally:
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")  # Enable foreign key checks

def create_staff_table(cursor):
    """Create the Staff table with necessary constraints."""
    cursor.execute("""
        CREATE TABLE Staff (
            StaffID INT NOT NULL PRIMARY KEY,
            FullName VARCHAR(100) NOT NULL,
            PhoneNumber VARCHAR(10) NOT NULL
        );
    """)
    print("Staff table created successfully.")

def add_role_column(cursor):
    """Add the Role column to the Staff table."""
    try:
        cursor.execute("ALTER TABLE Staff ADD COLUMN Role VARCHAR(50) NOT NULL;")
        print("Role column added successfully.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")

def main():
    connection = create_connection()
    cursor = connection.cursor()

    try:
        # Force drop existing tables
        force_drop_table(cursor, "ContractInfo")  # Ensure ContractInfo is dropped first
        force_drop_table(cursor, "Staff")          # Drop Staff table
        
        # Create new Staff table
        create_staff_table(cursor)
        
        # Add Role column to Staff table
        add_role_column(cursor)
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.commit()
        connection.close()

if __name__ == "__main__":
    main()
