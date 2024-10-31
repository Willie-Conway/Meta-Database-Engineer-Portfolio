import sqlite3

def create_database():
    # Connect to the SQLite database (or create it if it doesn't exist)
    connection = sqlite3.connect('company_database.db')
    cursor = connection.cursor()

    # Drop existing tables to avoid integrity errors
    cursor.execute("DROP TABLE IF EXISTS employees;")
    cursor.execute("DROP TABLE IF EXISTS departments;")
    cursor.execute("DROP TABLE IF EXISTS jobs;")

    # Create the departments table
    cursor.execute('''
    CREATE TABLE departments (
        DepartmentId INTEGER PRIMARY KEY,
        DepartmentName TEXT NOT NULL
    );
    ''')

    # Create the jobs table
    cursor.execute('''
    CREATE TABLE jobs (
        JobId INTEGER PRIMARY KEY,
        JobTitle TEXT NOT NULL,
        Salary REAL NOT NULL
    );
    ''')

    # Create the employees table
    cursor.execute('''
    CREATE TABLE employees (
        EmployeeId INTEGER PRIMARY KEY,
        FirstName TEXT NOT NULL,
        LastName TEXT NOT NULL,
        DepartmentId INTEGER,
        JobId INTEGER,
        FOREIGN KEY (DepartmentId) REFERENCES departments (DepartmentId),
        FOREIGN KEY (JobId) REFERENCES jobs (JobId)
    );
    ''')

    # Insert sample data into departments
    cursor.executemany('''
    INSERT INTO departments (DepartmentId, DepartmentName) VALUES (?, ?);
    ''', [
        (1, 'Sales'),
        (2, 'Marketing'),
        (3, 'IT'),
        (4, 'HR')
    ])

    # Insert sample data into jobs
    cursor.executemany('''
    INSERT INTO jobs (JobId, JobTitle, Salary) VALUES (?, ?, ?);
    ''', [
        (1, 'Sales Manager', 60000),
        (2, 'Marketing Specialist', 50000),
        (3, 'Software Engineer', 80000),
        (4, 'HR Coordinator', 40000)
    ])

    # Insert sample data into employees
    cursor.executemany('''
    INSERT INTO employees (EmployeeId, FirstName, LastName, DepartmentId, JobId) VALUES (?, ?, ?, ?, ?);
    ''', [
        (1, 'John', 'Doe', 1, 1),
        (2, 'Jane', 'Smith', 2, 2),
        (3, 'Emily', 'Davis', 3, 3),
        (4, 'Michael', 'Johnson', 4, 4),
        (5, 'Alice', 'Brown', 1, 1)
    ])

    # Commit the changes and close the connection
    connection.commit()
    connection.close()
    print("Database created and sample data inserted.")

def display_data():
    # Connect to the SQLite database
    connection = sqlite3.connect('company_database.db')
    cursor = connection.cursor()

    # Display all employees
    print("All Employees:")
    cursor.execute('SELECT * FROM employees;')
    employees = cursor.fetchall()
    for emp in employees:
        print(emp)

    # Display all departments
    print("\nAll Departments:")
    cursor.execute('SELECT * FROM departments;')
    departments = cursor.fetchall()
    for dept in departments:
        print(dept)

    # Display all jobs
    print("\nAll Jobs:")
    cursor.execute('SELECT * FROM jobs;')
    jobs = cursor.fetchall()
    for job in jobs:
        print(job)

    # Close the connection
    connection.close()

def external_view_schema():
    # Connect to the SQLite database
    connection = sqlite3.connect('company_database.db')
    cursor = connection.cursor()

    # Simulate an external view for the HR department
    print("\nHR Department View:")
    cursor.execute('''
    SELECT FirstName, LastName, DepartmentId FROM employees WHERE DepartmentId = 4;
    ''')
    hr_employees = cursor.fetchall()
    for emp in hr_employees:
        print(emp)

    # Simulate an external view for the IT department
    print("\nIT Department View:")
    cursor.execute('''
    SELECT FirstName, LastName, JobId FROM employees WHERE DepartmentId = 3;
    ''')
    it_employees = cursor.fetchall()
    for emp in it_employees:
        print(emp)

    # Close the connection
    connection.close()

def main():
    # Create the database and populate it with data
    create_database()

    # Display the data in the database
    display_data()

    # Show external view schemas
    external_view_schema()

if __name__ == "__main__":
    main()
