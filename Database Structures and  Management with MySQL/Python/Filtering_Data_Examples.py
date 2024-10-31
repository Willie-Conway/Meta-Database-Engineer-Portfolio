# This Python script contains SQL queries for filtering employee data from the Lucky Shrub database.
# Each query corresponds to a specific task with detailed comments explaining each task.

def print_employee_sql_solutions():
    """Print SQL solutions for filtering employee data based on specified criteria."""

    # Task 1: Find employees who earn an annual salary of $50,000 or more in the Marketing department.
    task_1_sql = """
    SELECT * FROM employees 
    WHERE AnnualSalary >= 50000 AND Department = 'Marketing';
    """
    print("Task 1 Solution:")
    print("SQL Query:", task_1_sql)
    print("This query retrieves all employees from the employees table who have an AnnualSalary of $50,000 or more and belong to the Marketing department.\n")

    # Task 2: Find employees not earning over $50,000 across all departments.
    task_2_sql = """
    SELECT * FROM employees 
    WHERE NOT (AnnualSalary > 50000);
    """
    print("Task 2 Solution:")
    print("SQL Query:", task_2_sql)
    print("This query retrieves all employees whose AnnualSalary is not greater than $50,000.\n")

    # Task 3: Find Marketing, Finance, and Legal employees whose annual salary is below $50,000.
    task_3_sql = """
    SELECT * FROM employees 
    WHERE Department IN ('Marketing', 'Finance', 'Legal') AND AnnualSalary < 50000;
    """
    print("Task 3 Solution:")
    print("SQL Query:", task_3_sql)
    print("This query retrieves all employees from the Marketing, Finance, and Legal departments who have an AnnualSalary below $50,000.\n")

    # Task 4: Find employees who earn annual salaries between $10,000 and $50,000.
    task_4_sql = """
    SELECT * FROM employees 
    WHERE AnnualSalary BETWEEN 10000 AND 50000;
    """
    print("Task 4 Solution:")
    print("SQL Query:", task_4_sql)
    print("This query retrieves all employees whose AnnualSalary is between $10,000 and $50,000 inclusive.\n")

    # Task 5: Find employees whose names start with 'S' and are at least 4 characters in length.
    task_5_sql = """
    SELECT * FROM employees 
    WHERE EmployeeName LIKE 'S___%';
    """
    print("Task 5 Solution:")
    print("SQL Query:", task_5_sql)
    print("This query retrieves all employees whose names start with 'S' and have at least 4 characters in length.\n")

if __name__ == "__main__":
    print("SQL Employee Filtering Solutions:")
    print_employee_sql_solutions()
