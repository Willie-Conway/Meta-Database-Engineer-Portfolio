import mysql.connector
from mysql.connector import Error

def create_connection(host_name, user_name, user_password, db_name):
    """Establish a connection to the MySQL database.
    
    Args:
        host_name (str): The host address (e.g., 'localhost' or an IP address).
        user_name (str): The MySQL username.
        user_password (str): The MySQL password.
        db_name (str): The database to connect to.
    
    Returns:
        connection: MySQL database connection object.
    """
    connection = None
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="Admin@LL123!",
            database="little_lemon"
        )
        if connection.is_connected():
            print("Connection to MySQL DB successful")
    except Error as e:
        print(f"The error '{e}' occurred")
    return connection

def execute_query(connection, query):
    """Execute a single query against the MySQL database.
    
    Args:
        connection: MySQL database connection object.
        query (str): The SQL query to execute.
    
    Returns:
        results: Query results if applicable, otherwise None.
    """
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()  # Commit changes if applicable
        print("Query executed successfully")
        
        # If the query is a SELECT statement, fetch the results
        if query.lower().startswith("select"):
            return cursor.fetchall()
    except Error as e:
        print(f"The error '{e}' occurred")
        return None

def main():
    # Define connection parameters
    host = "localhost"  # Replace with your host if not using localhost
    user = "root"  # Replace with your MySQL username
    password = "Admin@LL123!"  # Replace with your MySQL password
    database = "little_lemon"  # Replace with your target database name

    # Create a connection to the database
    connection = create_connection(host, user, password, database)

    if connection:
        # Example SQL query to calculate total sales using SUM function
        total_sales_query = """SELECT SUM(BillAmount) AS Total_Sale FROM Orders;"""
        total_sales_results = execute_query(connection, total_sales_query)

        # Print total sales results
        if total_sales_results:
            for result in total_sales_results:
                print(f"Total Sales: {result[0]} dollars")

        # Example SQL query to extract the hour from the BookingSlot column using HOUR function
        peak_hours_query = """SELECT HOUR(BookingSlot) AS Peak_Hour FROM Bookings;"""
        peak_hours_results = execute_query(connection, peak_hours_query)

        # Print peak hours results
        if peak_hours_results:
            print("Peak Hours from Bookings:")
            for result in peak_hours_results:
                print(f"Hour: {result[0]}")

        # Close the connection
        connection.close()
        print("Connection to MySQL DB closed")

if __name__ == "__main__":
    main()
