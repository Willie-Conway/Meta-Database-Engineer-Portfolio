def print_lucky_shrub_sql_tasks():
    """Print SQL examples for operators and clauses in the Lucky Shrub database."""
    
    # Task 1: Use the ANY operator to identify all employees with the Order Status 'Completed'
    task1_sql = """
    SELECT EmployeeID, EmployeeName 
    FROM employees 
    WHERE EmployeeID = ANY (
        SELECT EmployeeID 
        FROM employee_orders 
        WHERE Status = 'Completed'
    );
    """
    print("Task 1: Employees with 'Completed' Orders:")
    print("SQL Query:", task1_sql)
    print("Description: This query retrieves all employees whose IDs match any of the IDs of employees that have orders with a status of 'Completed'.\n")

    # Task 2: Use the ALL operator to identify employees with handling cost > 20% of order value
    task2_sql = """
    SELECT EmployeeID, HandlingCost 
    FROM employee_orders 
    WHERE HandlingCost > ALL (
        SELECT ROUND(OrderTotal / 100 * 20) 
        FROM orders
    );
    """
    print("Task 2: Employees with Handling Cost > 20% of Order Total:")
    print("SQL Query:", task2_sql)
    print("Description: This query retrieves all employees from the employee_orders table whose handling costs exceed all calculated 20% values of order totals.\n")

    # Task 3: Use the GROUP BY clause to summarize duplicate records
    task3_sql = """
    SELECT EmployeeID, HandlingCost 
    FROM employee_orders 
    WHERE HandlingCost > ALL (
        SELECT ROUND(OrderTotal / 100 * 20) 
        FROM orders
    ) 
    GROUP BY EmployeeID, HandlingCost;
    """
    print("Task 3: Grouped Handling Costs by Employee:")
    print("SQL Query:", task3_sql)
    print("Description: This query groups the records by EmployeeID and HandlingCost for those costs that are greater than all 20% values of the order totals.\n")

    # Task 4: Use the HAVING clause to filter grouped data for costs > $100
    task4_sql = """
    SELECT EmployeeID, HandlingCost 
    FROM employee_orders  
    WHERE HandlingCost > ALL (
        SELECT ROUND(OrderTotal / 100 * 20) AS twentyPercent 
        FROM orders 
        GROUP BY OrderTotal  
        HAVING twentyPercent > 100
    )  
    GROUP BY EmployeeID, HandlingCost;
    """
    print("Task 4: Filtered Handling Costs > $100:")
    print("SQL Query:", task4_sql)
    print("Description: This query retrieves employee IDs and handling costs, filtering to only include those handling costs that exceed the 20% values greater than $100 from the orders table.\n")

if __name__ == "__main__":
    print("Lucky Shrub SQL Tasks:")
    print_lucky_shrub_sql_tasks()
