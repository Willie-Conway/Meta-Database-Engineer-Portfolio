# Import necessary modules
import mysql.connector
from mysql.connector import Error, pooling

# Task 1: Establish a connection pool
def create_connection_pool():
    """Creates a MySQL connection pool with specified configurations."""
    dbconfig = {
        "database": "little_lemon_db",
        "user": "mario",  # Replace with your MySQL username
        "password": "cuisine"  # Replace with your MySQL password
    }

    try:
        pool = mysql.connector.pooling.MySQLConnectionPool(
            pool_name="pool_b",
            pool_size=2,
            **dbconfig
        )
        print("Connection pool created successfully")
        return pool
    except Error as e:
        print(f"The error '{e}' occurred")
        return None

# Task 2: Insert bookings for three guests
def insert_bookings(pool):
    """Inserts booking data for three guests into the Bookings table."""
    # Booking data for three guests
    bookings = [
        (8, 'Anees', 'Java', '18:00', 6),
        (5, 'Bald', 'Vin', '19:00', 6),
        (12, 'Jay', 'Kon', '19:30', 6)
    ]

    connections = []

    for i, (table_no, first_name, last_name, booking_time, employee_id) in enumerate(bookings):
        try:
            # Get connection from the pool
            connection = pool.get_connection()
            connections.append(connection)
            cursor = connection.cursor()
            insert_query = """
            INSERT INTO Bookings (TableNo, GuestFirstName, GuestLastName, BookingSlot, EmployeeID)
            VALUES (%s, %s, %s, %s, %s);
            """
            cursor.execute(insert_query, (table_no, first_name, last_name, booking_time, employee_id))
            connection.commit()
            print(f"Booking for {first_name} {last_name} inserted successfully.")
            cursor.close()
        except mysql.connector.Error as e:
            print(f"Error occurred: {e}")
        finally:
            if i < 2:  # Only return first two connections
                connection.close()

    # Attempt to return third connection to the pool
    try:
        connections[2].close()  # This will raise an error
    except IndexError:
        print("Error: Unable to return the third connection to the pool. Pool size limit reached.")

# Task 3: Create a report
def generate_report(pool):
    """Generates a report with required statistics."""
    try:
        connection = pool.get_connection()
        cursor = connection.cursor()

        # Query to find the name and EmployeeID of the manager
        manager_query = "SELECT Name, EmployeeID FROM Employees WHERE Role = 'Manager';"
        cursor.execute(manager_query)
        manager = cursor.fetchone()
        
        # Query to find the employee with the highest salary
        highest_salary_query = "SELECT Name, Role FROM Employees ORDER BY Annual_Salary DESC LIMIT 1;"
        cursor.execute(highest_salary_query)
        highest_salary_employee = cursor.fetchone()
        
        # Query to count guests booked between 18:00 and 20:00
        count_guests_query = """
        SELECT COUNT(*) FROM Bookings WHERE BookingSlot BETWEEN '18:00' AND '20:00';
        """
        cursor.execute(count_guests_query)
        count_guests = cursor.fetchone()[0]

        # Query to find guests waiting to be seated
        waiting_guests_query = """
        SELECT CONCAT(GuestFirstName, ' ', GuestLastName) AS FullName, BookingID, BookingSlot
        FROM Bookings
        WHERE EmployeeID IS NULL
        ORDER BY BookingSlot ASC;
        """
        cursor.execute(waiting_guests_query)
        waiting_guests = cursor.fetchall()

        # Printing the report
        print("Manager Name and ID:", manager)
        print("Highest Salary Employee Name and Role:", highest_salary_employee)
        print("Number of Guests Booked between 18:00 and 20:00:", count_guests)
        
        print("Guests Waiting to be Seated:")
        for guest in waiting_guests:
            print(f"Full Name: {guest[0]}, Booking ID: {guest[1]}, Booking Slot: {guest[2]}")
        
    except Error as e:
        print(f"The error '{e}' occurred")
    finally:
        cursor.close()
        connection.close()

# Task 4: Create stored procedure BasicSalesReport
def create_basic_sales_report_procedure(pool):
    """Creates a stored procedure that returns sales statistics."""
    try:
        connection = pool.get_connection()
        cursor = connection.cursor()

        create_procedure_query = """
        CREATE PROCEDURE BasicSalesReport()
        BEGIN
            SELECT SUM(BillAmount) AS TotalSales,
                   AVG(BillAmount) AS AverageSale,
                   MIN(BillAmount) AS MinSale,
                   MAX(BillAmount) AS MaxSale
            FROM Orders;
        END;
        """
        cursor.execute(create_procedure_query)
        print("Stored procedure BasicSalesReport created successfully.")
    except Error as e:
        print(f"The error '{e}' occurred")
    finally:
        cursor.close()
        connection.close()

# Task 5: Display the next three upcoming bookings
def display_upcoming_bookings(pool):
    """Displays the next three upcoming bookings."""
    try:
        connection = pool.get_connection()
        cursor = connection.cursor()

        upcoming_bookings_query = """
        SELECT BookingSlot, CONCAT(GuestFirstName, ' ', GuestLastName) AS GuestName, 
               CONCAT(Employees.Name, ' [', Employees.Role, ']') AS AssignedTo
        FROM Bookings
        LEFT JOIN Employees ON Bookings.EmployeeID = Employees.EmployeeID
        ORDER BY BookingSlot ASC
        LIMIT 3;
        """
        cursor.execute(upcoming_bookings_query)
        upcoming_bookings = cursor.fetchall()

        print("Upcoming Bookings:")
        for booking in upcoming_bookings:
            print(f"[{booking[0]}]\n[{booking[1]}]\n[Assigned to: {booking[2]}]")
        
    except Error as e:
        print(f"The error '{e}' occurred")
    finally:
        cursor.close()
        connection.close()

# Main function to execute all tasks
def main():
    pool = create_connection_pool()
    if pool:
        # Task 2: Insert bookings
        insert_bookings(pool)
        # Task 3: Generate report
        generate_report(pool)
        # Task 4: Create stored procedure for sales report
        create_basic_sales_report_procedure(pool)
        # Task 5: Display upcoming bookings
        display_upcoming_bookings(pool)

if __name__ == "__main__":
    main()
