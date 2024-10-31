# Import necessary library
import sqlite3

# Function to create a database and the customers table
def create_customers_table():
    # Connect to SQLite database (or create it)
    connection = sqlite3.connect('sample_database.db')
    cursor = connection.cursor()

    # SQL command to create a table named customers
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS customers (
        CustomerId INTEGER PRIMARY KEY,    -- Unique identifier for each customer
        FirstName VARCHAR(40),             -- Customer's first name (max 40 characters)
        LastName VARCHAR(20),              -- Customer's last name (max 20 characters)
        Company VARCHAR(80),               -- Customer's company name (max 80 characters)
        Address VARCHAR(70),               -- Customer's address (max 70 characters)
        City VARCHAR(40),                  -- Customer's city (max 40 characters)
        State VARCHAR(40),                 -- Customer's state (max 40 characters)
        Country VARCHAR(40),               -- Customer's country (max 40 characters)
        PostalCode VARCHAR(10),            -- Customer's postal code (max 10 characters)
        Phone VARCHAR(24),                 -- Customer's phone number (max 24 characters)
        Fax VARCHAR(24),                   -- Customer's fax number (max 24 characters)
        Email VARCHAR(60),                 -- Customer's email address (max 60 characters)
        SupportRapid INTEGER                -- Support rapid response indicator (1 for yes, 0 for no)
    );
    ''')

    # Commit changes to the database
    connection.commit()

    # Close the database connection
    connection.close()
    print("Table 'customers' created successfully.")

# Main function to execute the script
def main():
    create_customers_table()  # Create the customers table

# Run the main function
if __name__ == "__main__":
    main()
