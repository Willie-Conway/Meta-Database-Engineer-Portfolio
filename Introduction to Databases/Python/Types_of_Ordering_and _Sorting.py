import sqlite3

def create_tables():
    # Connect to the SQLite database (or create it if it doesn't exist)
    connection = sqlite3.connect('business_database.db')
    cursor = connection.cursor()

    # Drop existing tables to avoid integrity errors
    cursor.execute("DROP TABLE IF EXISTS customers;")
    cursor.execute("DROP TABLE IF EXISTS invoices;")

    # Create the customers table
    cursor.execute('''
    CREATE TABLE customers (
        CustomerId INTEGER PRIMARY KEY,
        FirstName TEXT,
        LastName TEXT,
        City TEXT
    );
    ''')

    # Create the invoices table
    cursor.execute('''
    CREATE TABLE invoices (
        InvoiceId INTEGER PRIMARY KEY,
        BillingCity TEXT,
        InvoiceDate DATE,
        Amount REAL
    );
    ''')

    # Insert sample data into the customers table
    cursor.executemany('''
    INSERT INTO customers (CustomerId, FirstName, LastName, City) VALUES (?, ?, ?, ?);
    ''', [
        (1, 'Alice', 'Johnson', 'New York'),
        (2, 'Bob', 'Smith', 'Amsterdam'),
        (3, 'Charlie', 'Brown', 'Berlin'),
        (4, 'David', 'Wilson', 'Amsterdam'),
        (5, 'Eve', 'Davis', 'New York')
    ])

    # Insert sample data into the invoices table
    cursor.executemany('''
    INSERT INTO invoices (InvoiceId, BillingCity, InvoiceDate, Amount) VALUES (?, ?, ?, ?);
    ''', [
        (1, 'Amsterdam', '2024-01-01', 150.00),
        (2, 'New York', '2024-02-15', 200.00),
        (3, 'Berlin', '2024-03-10', 250.00),
        (4, 'Amsterdam', '2024-01-20', 100.00),
        (5, 'New York', '2024-02-25', 300.00)
    ])

    # Commit the changes and close the connection
    connection.commit()
    connection.close()
    print("Tables created and sample data inserted.")

def sort_customers():
    # Connect to the SQLite database
    connection = sqlite3.connect('business_database.db')
    cursor = connection.cursor()

    # Query to sort customers by CustomerId in descending order
    print("Customers sorted by CustomerId DESC:")
    cursor.execute('''
    SELECT * FROM customers ORDER BY CustomerId DESC;
    ''')
    customers = cursor.fetchall()
    for customer in customers:
        print(customer)

    # Query to sort customers by City in ascending order
    print("\nCustomers sorted by City ASC:")
    cursor.execute('''
    SELECT * FROM customers ORDER BY City ASC;
    ''')
    customers = cursor.fetchall()
    for customer in customers:
        print(customer)

    # Query to sort invoices by InvoiceDate in ascending order
    print("\nInvoices sorted by InvoiceDate ASC:")
    cursor.execute('''
    SELECT * FROM invoices ORDER BY InvoiceDate ASC;
    ''')
    invoices = cursor.fetchall()
    for invoice in invoices:
        print(invoice)

    # Query to sort invoices by InvoiceDate in descending order
    print("\nInvoices sorted by InvoiceDate DESC:")
    cursor.execute('''
    SELECT * FROM invoices ORDER BY InvoiceDate DESC;
    ''')
    invoices = cursor.fetchall()
    for invoice in invoices:
        print(invoice)

    # Query to sort invoices by BillingCity ASC and InvoiceDate DESC
    print("\nInvoices sorted by BillingCity ASC, then InvoiceDate DESC:")
    cursor.execute('''
    SELECT * FROM invoices ORDER BY BillingCity ASC, InvoiceDate DESC;
    ''')
    invoices = cursor.fetchall()
    for invoice in invoices:
        print(invoice)

    # Close the connection
    connection.close()

def main():
    # Create tables and insert sample data
    create_tables()

    # Sort and display data from the customers and invoices tables
    sort_customers()

if __name__ == "__main__":
    main()
