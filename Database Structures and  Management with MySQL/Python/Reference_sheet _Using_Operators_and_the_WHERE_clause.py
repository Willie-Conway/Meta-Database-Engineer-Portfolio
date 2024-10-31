# This Python script provides SQL examples that utilize the WHERE clause
# and various operators for filtering data in an Employees table.

def print_sql_examples():
    """Print SQL examples using the WHERE clause with various operators."""
    
    # SQL Query: Find EmployeeName values that start with "a".
    task_1_sql = """
    SELECT * FROM Employees 
    WHERE EmployeeName LIKE 'a%';
    """
    print("Example 1:")
    print("SQL Query:", task_1_sql)
    print("Description: This query retrieves all employees whose names start with 'a'.\n")
    
    # SQL Query: Find EmployeeName values that end with "i".
    task_2_sql = """
    SELECT * FROM Employees 
    WHERE EmployeeName LIKE '%i';
    """
    print("Example 2:")
    print("SQL Query:", task_2_sql)
    print("Description: This query retrieves all employees whose names end with 'i'.\n")

    # SQL Query: Find EmployeeName values that contain "li" anywhere.
    task_3_sql = """
    SELECT * FROM Employees 
    WHERE EmployeeName LIKE '%li%';
    """
    print("Example 3:")
    print("SQL Query:", task_3_sql)
    print("Description: This query retrieves all employees whose names contain 'li' in any position.\n")

    # SQL Query: Find EmployeeName values that have "a" in the second position.
    task_4_sql = """
    SELECT * FROM Employees 
    WHERE EmployeeName LIKE '_a%';
    """
    print("Example 4:")
    print("SQL Query:", task_4_sql)
    print("Description: This query retrieves all employees whose names have 'a' in the second position.\n")

    # SQL Query: Find EmployeeName values that start with "a" and are at least 4 characters long.
    task_5_sql = """
    SELECT * FROM Employees 
    WHERE EmployeeName LIKE 'a___%';
    """
    print("Example 5:")
    print("SQL Query:", task_5_sql)
    print("Description: This query retrieves all employees whose names start with 'a' and have at least 4 characters in length.\n")

    # SQL Query: Find EmployeeName values that start with "a" and end with "i".
    task_6_sql = """
    SELECT * FROM Employees 
    WHERE EmployeeName LIKE 'a%i';
    """
    print("Example 6:")
    print("SQL Query:", task_6_sql)
    print("Description: This query retrieves all employees whose names start with 'a' and end with 'i'.\n")

if __name__ == "__main__":
    print("SQL Examples Using WHERE Clause and LIKE Operator:")
    print_sql_examples()
