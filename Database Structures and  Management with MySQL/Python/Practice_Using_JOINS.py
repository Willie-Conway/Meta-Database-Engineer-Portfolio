def print_little_lemon_join_examples():
    """Print SQL examples for INNER JOIN and LEFT JOIN in the Little Lemon database."""
    
    # Task 1: INNER JOIN Example
    inner_join_sql = """
    SELECT Customers.FullName, Customers.PhoneNumber, Bookings.BookingDate, Bookings.NumberOfGuests 
    FROM Customers 
    INNER JOIN Bookings 
    ON Customers.CustomerID = Bookings.CustomerID;
    """
    print("Task 1: INNER JOIN Example:")
    print("SQL Query:", inner_join_sql)
    print("Description: This query retrieves the full name and phone number of customers who have made bookings, along with the booking date and number of guests.\n")

    # Task 2: LEFT JOIN Example
    left_join_sql = """
    SELECT Customers.CustomerID, Bookings.BookingID 
    FROM Customers 
    LEFT JOIN Bookings 
    ON Customers.CustomerID = Bookings.CustomerID;
    """
    print("Task 2: LEFT JOIN Example:")
    print("SQL Query:", left_join_sql)
    print("Description: This query retrieves the Customer ID from the Customers table and the related Booking ID from the Bookings table, including customers who haven't made any bookings.\n")

if __name__ == "__main__":
    print("Little Lemon SQL JOIN Examples:")
    print_little_lemon_join_examples()
