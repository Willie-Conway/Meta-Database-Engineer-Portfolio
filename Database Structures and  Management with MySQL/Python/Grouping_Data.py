def print_lucky_shrub_queries():
    """Print SQL examples for grouping and filtering data in the Lucky Shrub database."""
    
    # Task 1: Group all records that have the same order date
    task1_sql = """
    SELECT OrderDate 
    FROM Orders 
    GROUP BY OrderDate;
    """
    print("Task 1: Group by Order Date:")
    print("SQL Query:", task1_sql)
    print("Description: This query retrieves unique order dates from the Orders table.\n")

    # Task 2: Retrieve the number of orders placed on the same day
    task2_sql = """
    SELECT OrderDate, COUNT(OrderID) AS NumberOfOrders 
    FROM Orders 
    GROUP BY OrderDate;
    """
    print("Task 2: Count Orders by Order Date:")
    print("SQL Query:", task2_sql)
    print("Description: This query counts the number of orders placed on each order date.\n")

    # Task 3: Retrieve the total order quantities placed by each department
    task3_sql = """
    SELECT Department, SUM(OrderQty) AS TotalOrderQty 
    FROM Orders 
    GROUP BY Department;
    """
    print("Task 3: Total Order Quantity by Department:")
    print("SQL Query:", task3_sql)
    print("Description: This query calculates the total order quantities for each department.\n")

    # Task 4: Retrieve the number of orders placed on the same day between specific dates
    task4_sql = """
    SELECT OrderDate, COUNT(OrderID) AS NumberOfOrders 
    FROM Orders 
    WHERE OrderDate BETWEEN '2022-06-01' AND '2022-06-30' 
    GROUP BY OrderDate;
    """
    print("Task 4: Count Orders by Order Date (June 2022):")
    print("SQL Query:", task4_sql)
    print("Description: This query counts the number of orders placed on each order date within June 2022.\n")

if __name__ == "__main__":
    print("Lucky Shrub SQL Queries:")
    print_lucky_shrub_queries()
