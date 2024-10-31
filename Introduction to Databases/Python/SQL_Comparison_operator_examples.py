import sqlite3

def create_employee_table():
    # Connect to the SQLite database (or create it if it doesn't exist)
    connection = sqlite3.connect('employee_database.db')
    cursor = connection.cursor()

    # Drop the employee table if it exists to avoid integrity errors
    cursor.execute("DROP TABLE IF EXISTS employee;")

    # Create the employee table
    cursor.execute('''
    CREATE TABLE employee (
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

    # Commit the changes and close the connection
    connection.commit()
    connection.close()
    print("Employee table created and sample data inserted.")

def get_even_hour_employees():
    # Connect to the SQLite database
    connection = sqlite3.connect('employee_database.db')
    cursor = connection.cursor()

    # Query to retrieve employees who worked an even number of hours
    cursor.execute('''
    SELECT * FROM employee WHERE hours % 2 = 0;
    ''')

    # Fetch all matching records
    even_hour_employees = cursor.fetchall()

    # Close the connection
    connection.close()
    
    return even_hour_employees

def main():
    # Create the employee table and insert data
    create_employee_table()

    # Retrieve and print employees who worked even hours
    even_hour_employees = get_even_hour_employees()
    print("Employees Who Worked Even Hours:")
    for employee in even_hour_employees:
        print(employee)

if __name__ == "__main__":
    main()
