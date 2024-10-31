import sqlite3

def create_tables():
    # Connect to the SQLite database (or create it if it doesn't exist)
    connection = sqlite3.connect('business_database.db')
    cursor = connection.cursor()

    # Drop existing invoices table to avoid integrity errors
    cursor.execute("DROP TABLE IF EXISTS invoices;")

    # Create the invoices table with necessary columns
    cursor.execute('''
    CREATE TABLE invoices (
        InvoiceId INTEGER PRIMARY KEY,
        BillingCountry TEXT,
        Total REAL
    );
    ''')

    # Insert sample data into the invoices table
    cursor.executemany('''
    INSERT INTO invoices (InvoiceId, BillingCountry, Total) VALUES (?, ?, ?);
    ''', [
        (1, 'USA', 150.00),
        (2, 'France', 75.00),
        (3, 'USA', 5.00),
        (4, 'Germany', 2.50),
        (5, 'France', 3.00),
        (6, 'USA', 10.00)
    ])

    # Commit the changes and close the connection
    connection.commit()
    connection.close()
    print("Invoices table created and sample data inserted.")

def filter_invoices():
    # Connect to the SQLite database
    connection = sqlite3.connect('business_database.db')
    cursor = connection.cursor()

    # Example 1: Select invoices with Total greater than 2
    print("Invoices with Total greater than 2:")
    cursor.execute('''
    SELECT * FROM invoices WHERE Total > 2;
    ''')
    invoices = cursor.fetchall()
    for invoice in invoices:
        print(invoice)

    # Example 2: Select invoices with Total greater than 2 AND BillingCountry is USA
    print("\nInvoices with Total > 2 AND BillingCountry = 'USA':")
    cursor.execute('''
    SELECT * FROM invoices WHERE Total > 2 AND BillingCountry = 'USA';
    ''')
    invoices = cursor.fetchall()
    for invoice in invoices:
        print(invoice)

    # Example 3: Select invoices where BillingCountry is USA OR France
    print("\nInvoices where BillingCountry is 'USA' OR 'France':")
    cursor.execute('''
    SELECT * FROM invoices WHERE BillingCountry = 'USA' OR BillingCountry = 'France';
    ''')
    invoices = cursor.fetchall()
    for invoice in invoices:
        print(invoice)

    # Example 4: Select invoices with Total > 2 AND (BillingCountry is USA OR France)
    print("\nInvoices with Total > 2 AND (BillingCountry = 'USA' OR BillingCountry = 'France'):")
    cursor.execute('''
    SELECT * FROM invoices WHERE Total > 2 AND (BillingCountry = 'USA' OR BillingCountry = 'France');
    ''')
    invoices = cursor.fetchall()
    for invoice in invoices:
        print(invoice)

    # Close the connection
    connection.close()

def main():
    # Create the invoices table and insert sample data
    create_tables()

    # Filter and display invoices based on different WHERE clause conditions
    filter_invoices()

if __name__ == "__main__":
    main()
