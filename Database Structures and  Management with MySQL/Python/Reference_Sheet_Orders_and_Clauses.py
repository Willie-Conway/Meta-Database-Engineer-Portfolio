def print_sql_operators_and_clauses():
    """Print SQL examples for GROUP BY, HAVING, ANY, and ALL operators."""
    
    # GROUP BY clause
    group_by_sql = """
    -- GROUP BY clause
    SELECT Department, COUNT(*) AS NumberOfOrders
    FROM orders
    GROUP BY Department;
    """
    print("GROUP BY Clause:")
    print("SQL Query:", group_by_sql)
    print("Description: This query groups the orders by Department and counts the number of orders for each department.\n")

    # HAVING clause
    having_sql = """
    -- HAVING clause
    SELECT Department, SUM(OrderTotal) AS TotalSales
    FROM orders
    GROUP BY Department
    HAVING SUM(OrderTotal) > 1000;
    """
    print("HAVING Clause:")
    print("SQL Query:", having_sql)
    print("Description: This query groups the orders by Department, calculates total sales, and filters to include only departments with total sales greater than $1000.\n")

    # ANY operator
    any_sql = """
    -- ANY operator
    SELECT EmployeeID, EmployeeName
    FROM employees
    WHERE EmployeeID = ANY (
        SELECT EmployeeID
        FROM employee_orders
        WHERE Status = 'Completed'
    );
    """
    print("ANY Operator:")
    print("SQL Query:", any_sql)
    print("Description: This query retrieves all employees whose IDs match any of the IDs of employees that have orders with a status of 'Completed'.\n")

    # ALL operator
    all_sql = """
    -- ALL operator
    SELECT EmployeeID, HandlingCost
    FROM employee_orders
    WHERE HandlingCost > ALL (
        SELECT ROUND(OrderTotal / 100 * 20)
        FROM orders
    );
    """
    print("ALL Operator:")
    print("SQL Query:", all_sql)
    print("Description: This query retrieves all employees from the employee_orders table whose handling costs exceed all calculated 20% values of order totals.\n")

if __name__ == "__main__":
    print("SQL Operators and Clauses:")
    print_sql_operators_and_clauses()
