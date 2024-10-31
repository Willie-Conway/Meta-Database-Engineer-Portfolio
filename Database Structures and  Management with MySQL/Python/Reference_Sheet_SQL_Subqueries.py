import sqlite3

# Connect to the SQLite database (or create it if it doesn't exist)
conn = sqlite3.connect('example.db')
cursor = conn.cursor()

# Create example tables
cursor.execute('''
CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department_id INTEGER
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS departments (
    id INTEGER PRIMARY KEY,
    department_name TEXT
)
''')

# Insert sample data into the tables
cursor.execute("INSERT INTO departments (department_name) VALUES ('HR')")
cursor.execute("INSERT INTO departments (department_name) VALUES ('IT')")
cursor.execute("INSERT INTO employees (name, department_id) VALUES ('Alice', 1)")
cursor.execute("INSERT INTO employees (name, department_id) VALUES ('Bob', 2)")
cursor.execute("INSERT INTO employees (name, department_id) VALUES ('Charlie', 1)")

# Commit the changes
conn.commit()

# Subquery example in the SELECT clause
# Selecting employee names and their department names
query = '''
SELECT name, 
       (SELECT department_name FROM departments WHERE id = employees.department_id) AS department_name 
FROM employees
'''
cursor.execute(query)
results = cursor.fetchall()
print("Employees and their departments:")
for row in results:
    print(row)

# Subquery example in the FROM clause
# Using a subquery to create a derived table for employee counts per department
query = '''
SELECT department_name, employee_count
FROM (
    SELECT d.department_name, COUNT(e.id) AS employee_count
    FROM departments d
    LEFT JOIN employees e ON d.id = e.department_id
    GROUP BY d.id
) AS department_employee_counts
'''
cursor.execute(query)
results = cursor.fetchall()
print("\nEmployee count per department:")
for row in results:
    print(row)

# Subquery example in an INSERT statement
# Inserting into a new table with data from employees
cursor.execute('''
CREATE TABLE IF NOT EXISTS employee_salaries (
    id INTEGER PRIMARY KEY,
    employee_name TEXT,
    salary INTEGER
)
''')
# Assume we want to insert salaries for employees, using a subquery to determine the salary
cursor.execute('''
INSERT INTO employee_salaries (employee_name, salary)
SELECT name, 
       (CASE 
            WHEN department_id = 1 THEN 50000 
            WHEN department_id = 2 THEN 60000 
        END) AS salary
FROM employees
''')

# Commit the changes
conn.commit()

# Subquery example in an UPDATE statement
# Update employee salaries based on their department
cursor.execute('''
UPDATE employee_salaries
SET salary = salary * 1.1
WHERE employee_name IN (SELECT name FROM employees WHERE department_id = 1)
''')

# Subquery example in a DELETE statement
# Delete employees from the employee_salaries table who are in the HR department
cursor.execute('''
DELETE FROM employee_salaries
WHERE employee_name IN (SELECT name FROM employees WHERE department_id = 1)
''')

# Commit the changes
conn.commit()

# Close the connection
conn.close()
