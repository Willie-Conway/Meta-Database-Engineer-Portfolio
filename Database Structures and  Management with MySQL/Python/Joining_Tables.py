def print_sql_join_examples():
    """Print SQL examples for different types of JOINS in MySQL."""
    
    # 1. INNER JOIN
    inner_join_sql = """
    SELECT Customers.FullName, Bookings.BookingID 
    FROM Customers 
    INNER JOIN Bookings 
    ON Customers.CustomerID = Bookings.CustomerID;
    """
    print("INNER JOIN Example:")
    print("SQL Query:", inner_join_sql)
    print("Description: This query retrieves the full names and booking IDs of customers who have made bookings.\n")

    # 2. LEFT JOIN
    left_join_sql = """
    SELECT Customers.FullName, Bookings.BookingID 
    FROM Customers 
    LEFT JOIN Bookings 
    ON Customers.CustomerID = Bookings.CustomerID;
    """
    print("LEFT JOIN Example:")
    print("SQL Query:", left_join_sql)
    print("Description: This query retrieves all customer full names and booking IDs, including customers without bookings.\n")

    # 3. RIGHT JOIN
    right_join_sql = """
    SELECT Customers.FullName, Bookings.BookingID 
    FROM Customers 
    RIGHT JOIN Bookings 
    ON Customers.CustomerID = Bookings.CustomerID;
    """
    print("RIGHT JOIN Example:")
    print("SQL Query:", right_join_sql)
    print("Description: This query retrieves all booking IDs and customer full names, including bookings without matching customers.\n")

    # 4. SELF JOIN
    # Assuming we have a table with employee hierarchy
    self_join_sql = """
    SELECT A.EmployeeName AS Employee, B.EmployeeName AS Manager
    FROM Employees A 
    INNER JOIN Employees B 
    ON A.ManagerID = B.EmployeeID;
    """
    print("SELF JOIN Example:")
    print("SQL Query:", self_join_sql)
    print("Description: This query retrieves a list of employees along with their managers from the same Employees table.\n")

if __name__ == "__main__":
    print("SQL JOIN Examples:")
    print_sql_join_examples()
