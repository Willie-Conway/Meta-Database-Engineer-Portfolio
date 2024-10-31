

# This Python script contains solutions for filtering data from an Orders table using SQL queries.
# Each solution corresponds to a specific task and includes detailed comments for clarity.

def print_sql_solutions():
    """Print SQL solutions for filtering order records."""

    # Task 1: Print all records of orders where the cost is $250 or less.
    task_1_sql = """
    SELECT * FROM Orders WHERE Cost <= 250;
    """
    print("Task 1 Solution:")
    print("SQL Query:", task_1_sql)
    print("This query retrieves all records from the Orders table where the Cost is less than or equal to $250.\n")

    # Task 2: Print all records of orders where the cost is between $50 and $750.
    task_2_sql = """
    SELECT * FROM Orders WHERE Cost > 50 AND Cost < 750;
    """
    print("Task 2 Solution:")
    print("SQL Query:", task_2_sql)
    print("This query retrieves all records from the Orders table where the Cost is greater than $50 and less than $750.\n")

    # Task 3: Print all records of orders placed by the client with ID 'Cl3' and where the cost is more than $100.
    task_3_sql = """
    SELECT * FROM Orders WHERE ClientID = 'Cl3' AND Cost > 100;
    """
    print("Task 3 Solution:")
    print("SQL Query:", task_3_sql)
    print("This query retrieves all records from the Orders table for the client with ID 'Cl3' where the Cost is greater than $100.\n")

    # Task 4: Print all records of orders that have a product ID of 'P1' or 'P2' and the order quantity is more than 2.
    task_4_sql = """
    SELECT * FROM Orders WHERE (ProductID = 'P1' OR ProductID = 'P2') AND Quantity > 2;
    """
    print("Task 4 Solution:")
    print("SQL Query:", task_4_sql)
    print("This query retrieves all records from the Orders table where the ProductID is either 'P1' or 'P2' and the Quantity is greater than 2.\n")

if __name__ == "__main__":
    print("SQL Filtering Data Solutions:")
    print_sql_solutions()