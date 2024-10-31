import mysql.connector
from mysql.connector import Error, pooling

# Step 1: Establish a connection pool
def create_connection_pool():
    """Creates a MySQL connection pool with specified configurations."""
    dbconfig = {
        "database": "little_lemon_db",
        "user": "mario",  # Replace with your MySQL username
        "password": "cuisine"  # Replace with your MySQL password
    }
    
    try:
        pool = mysql.connector.pooling.MySQLConnectionPool(
            pool_name="pool_a",
            pool_size=2,
            **dbconfig
        )
        print("Connection pool created successfully")
        return pool
    except Error as e:
        print(f"The error '{e}' occurred")
        return None

# Task 2: Implement stored procedure PeakHours
def create_peak_hours_procedure(cursor):
    """Creates the PeakHours stored procedure."""
    create_procedure_query = """
    CREATE PROCEDURE PeakHours()
    BEGIN
        SELECT HOUR(BookingSlot) AS BookingHour, COUNT(*) AS NumberOfBookings
        FROM Bookings
        GROUP BY BookingHour
        ORDER BY NumberOfBookings DESC;
    END;
    """
    cursor.execute(create_procedure_query)
    print("Stored procedure PeakHours created successfully")

def call_peak_hours_procedure(cursor):
    """Calls the PeakHours stored procedure and fetches results."""
    cursor.callproc('PeakHours')
    
    dataset = []
    for result in cursor.stored_results():
        dataset = result.fetchall()
        column_names = [i[0] for i in result.description]

    print("Column Names:", column_names)
    print("Peak Hours Data:")
    for row in dataset:
        print(row)

# Task 3: Implement stored procedure GuestStatus
def create_guest_status_procedure(cursor):
    """Creates the GuestStatus stored procedure."""
    create_procedure_query = """
    CREATE PROCEDURE GuestStatus()
    BEGIN
        SELECT CONCAT(GuestFirstName, ' ', GuestLastName) AS FullName,
               CASE
                   WHEN Employees.Role IN ('Manager', 'Assistant Manager') THEN 'Ready to pay'
                   WHEN Employees.Role = 'Head Chef' THEN 'Ready to serve'
                   WHEN Employees.Role = 'Assistant Chef' THEN 'Preparing Order'
                   WHEN Employees.Role = 'Head Waiter' THEN 'Order served'
                   ELSE 'Unknown status'
               END AS OrderStatus
        FROM Bookings
        LEFT JOIN Employees ON Bookings.EmployeeID = Employees.EmployeeID;
    END;
    """
    cursor.execute(create_procedure_query)
    print("Stored procedure GuestStatus created successfully")

def call_guest_status_procedure(cursor):
    """Calls the GuestStatus stored procedure and fetches results."""
    cursor.callproc('GuestStatus')
    
    dataset = []
    for result in cursor.stored_results():
        dataset = result.fetchall()
        column_names = [i[0] for i in result.description]

    print("Column Names:", column_names)
    print("Guest Status Data:")
    for row in dataset:
        print(row)

def main():
    # Step 2: Create connection pool
    pool = create_connection_pool()
    if pool:
        # Step 4: Obtain a connection from the pool and create a cursor
        connection = pool.get_connection()
        cursor = connection.cursor()

        # Task 2: Implement PeakHours stored procedure
        create_peak_hours_procedure(cursor)
        call_peak_hours_procedure(cursor)

        # Task 3: Implement GuestStatus stored procedure
        create_guest_status_procedure(cursor)
        call_guest_status_procedure(cursor)

        # Step 11: Close the connection
        cursor.close()
        connection.close()
        print("Connection returned to the pool")

if __name__ == "__main__":
    main()
