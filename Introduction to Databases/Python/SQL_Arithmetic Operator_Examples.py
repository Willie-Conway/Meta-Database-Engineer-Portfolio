import sqlite3

# Function to create the employee table and insert sample data
def create_employee_table():
    # Connect to SQLite database (or create it)
    connection = sqlite3.connect('employee_database.db')
    cursor = connection.cursor()

    # Create the employee table
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS employee (
        employee_ID INTEGER PRIMARY KEY,
        employee_name TEXT,
        salary REAL,
        allowance REAL,
        tax REAL,
        hours INTEGER
    );
    ''')

    # Insert sample data into the employee table
    cursor.executemany('''
    INSERT INTO employee (employee_ID, employee_name, salary, allowance, tax, hours) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
        (1, 'Alex', 24000, 1000, 1000, 10),
        (2, 'John', 55000, 3000, 2000, 11),
        (3, 'James', 52000, 3000, 2000, 7),
        (4, 'Sam', 24000, 1000, 1000, 11)
    ])

    # Commit changes to the database
    connection.commit()
    connection.close()
    print("Employee table created and sample data inserted.")

# Function to demonstrate SQL arithmetic operations
def demonstrate_arithmetic_operations():
    # Connect to the SQLite database
    connection = sqlite3.connect('employee_database.db')
    cursor = connection.cursor()

    # Using the addition operator
    print("Total Salary (Salary + Allowance):")
    cursor.execute("SELECT salary + allowance AS TotalSalary FROM employee;")
    for row in cursor.fetchall():
        print(row[0])

    # Using the subtraction operator
    print("\nSalary After Tax (Salary - Tax):")
    cursor.execute("SELECT salary - tax AS SalaryAfterTax FROM employee;")
    for row in cursor.fetchall():
        print(row[0])

    # Using the multiplication operator
    print("\nDoubled Tax Amount (Tax * 2):")
    cursor.execute("SELECT tax * 2 AS DoubledTax FROM employee;")
    for row in cursor.fetchall():
        print(row[0])

    # Using the division operator to calculate allowance percentage
    print("\nAllowance Percentage (Allowance / Salary * 100):")
    cursor.execute("SELECT (allowance / salary) * 100 AS AllowancePercentage FROM employee;")
    for row in cursor.fetchall():
        print(row[0])

    # Using the modulus operator to check if hours worked is even
    print("\nHours Modulus 2 (Checking if Even):")
    cursor.execute("SELECT hours % 2 AS IsEven FROM employee;")
    for row in cursor.fetchall():
        print(row[0])

    # Using the WHERE clause with the modulus operator
    print("\nEmployees Who Worked Even Hours:")
    cursor.execute("SELECT * FROM employee WHERE hours % 2 = 0;")
    for row in cursor.fetchall():
        print(row)

    # Close the database connection
    connection.close()

# Main function to execute the script
def main():
    create_employee_table()        # Create the employee table and insert data
    demonstrate_arithmetic_operations()  # Perform arithmetic operations

# Run the main function
if __name__ == "__main__":
    main()
