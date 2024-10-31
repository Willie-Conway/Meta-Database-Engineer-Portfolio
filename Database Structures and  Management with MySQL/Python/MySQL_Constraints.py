import mysql.connector

# Connect to the MySQL database
connection = mysql.connector.connect(
    host='localhost',
    user='root',  # Replace with your MySQL username
    password='Admin@LL123!',  # Replace with your MySQL password
    database='Mangata_Gallo'  # Connect to the created database
)

# Create a cursor object to execute SQL commands
cursor = connection.cursor()

# Function to create the Staff table
def create_staff_table():
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS Staff (
        StaffID INT NOT NULL PRIMARY KEY,      -- Unique identifier for staff
        PhoneNumber INT NOT NULL UNIQUE,       -- Unique phone number for each staff member
        FullName VARCHAR(100) NOT NULL         -- Full name of the staff member
    );
    """)
    print("Staff table created successfully.")

# Function to create the ContractInfo table
def create_contract_info_table():
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS ContractInfo (
        ContractID INT NOT NULL PRIMARY KEY,    -- Unique identifier for contracts
        StaffID INT NOT NULL,                    -- Reference to StaffID
        Salary DECIMAL(7,2) NOT NULL,           -- Salary of the staff
        Location VARCHAR(50) NOT NULL DEFAULT 'Texas',  -- Default location
        StaffType VARCHAR(20) NOT NULL CHECK (StaffType IN ('Junior', 'Senior'))  -- Constraints on staff type
    );
    """)
    print("ContractInfo table created successfully.")

# Function to create the Starters table
def create_starters_table():
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS Starters (
        StarterName VARCHAR(100) NOT NULL,      -- Name of the starter
        Cost DECIMAL(5,2) NOT NULL,             -- Cost of the starter
        StarterType VARCHAR(50) NOT NULL,       -- Type of starter
        PRIMARY KEY (StarterName)                -- Set StarterName as primary key
    );
    """)
    print("Starters table created successfully.")

# Function to add foreign key constraint
def add_foreign_key():
    cursor.execute("""
    ALTER TABLE ContractInfo
    ADD FOREIGN KEY (StaffID) REFERENCES Staff(StaffID);
    """)
    print("Foreign key added successfully.")

# Function to insert or update a starter using REPLACE
def replace_starter(starter_name, cost, starter_type):
    try:
        # Prepare SQL REPLACE statement
        sql = "REPLACE INTO Starters (StarterName, Cost, StarterType) VALUES (%s, %s, %s)"
        values = (starter_name, cost, starter_type)
        
        # Execute the SQL statement
        cursor.execute(sql, values)
        # Commit the changes
        connection.commit()
        print(f"Starter '{starter_name}' replaced successfully.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")

# Create the tables
create_staff_table()
create_contract_info_table()
create_starters_table()  # Create the Starters table
add_foreign_key()

# Example: Insert a new starter
replace_starter("Cheese bread", 9.50, "Indian")

# Example: Update the starter's cost
replace_starter("Cheese bread", 9.75, "Indian")

# Close the cursor and connection
cursor.close()
connection.close()
