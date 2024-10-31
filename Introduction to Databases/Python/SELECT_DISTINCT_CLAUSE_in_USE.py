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
        BillingCity TEXT,
        Total REAL
    );
    ''')

    # Insert sample data into the invoices table
    cursor.executemany('''
    INSERT INTO invoices (InvoiceId, BillingCountry, BillingCity, Total) VALUES (?, ?, ?, ?);
    ''', [
        (1, 'USA', 'New York', 150.00),
        (2, 'France', 'Paris', 75.00),
        (3, 'USA', 'Los Angeles', 5.00),
        (4, 'Germany', None, 2.50),
        (5, 'France', 'Lyon', 3.00),
        (6, 'USA', 'New York', 10.00),
        (7, 'Argentina', None, 20.00),
        (8, 'Australia', 'Sydney', 30.00),
        (9, 'Argentina', 'Buenos Aires', 15.00)
    ])

    # Commit the changes and close the connection
    connection.commit()
    connection.close()
    print("Invoices table created and sample data inserted.")

def distinct_queries():
    # Connect to the SQLite database
    connection = sqlite3.connect('business_database.db')
    cursor = connection.cursor()

    # Example 1: Select distinct BillingCountry
    print("Distinct BillingCountries:")
    cursor.execute('''
    SELECT DISTINCT BillingCountry FROM invoices ORDER BY BillingCountry;
    ''')
    distinct_countries = cursor.fetchall()
    for country in distinct_countries:
        print(country)

    # Example 2: Select distinct combinations of BillingCountry and BillingCity
    print("\nDistinct BillingCountry and BillingCity combinations:")
    cursor.execute('''
    SELECT DISTINCT BillingCountry, BillingCity FROM invoices ORDER BY BillingCountry, BillingCity;
    ''')
    distinct_city_country = cursor.fetchall()
    for city_country in distinct_city_country:
        print(city_country)

    # Example 3: Count distinct BillingCountries
    print("\nCount of distinct BillingCountries:")
    cursor.execute('''
    SELECT COUNT(DISTINCT BillingCountry) FROM invoices;
    ''')
    distinct_country_count = cursor.fetchone()
    print(distinct_country_count[0])

    # Close the connection
    connection.close()

def main():
    # Create the invoices table and insert sample data
    create_tables()

    # Execute distinct queries
    distinct_queries()

if __name__ == "__main__":
    main()
