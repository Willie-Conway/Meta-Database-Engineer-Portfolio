import mysql.connector
from mysql.connector import Error

def create_connection(host_name, user_name, user_password, db_name=None):
    """Establish a connection to the MySQL database.
    
    Args:
        host_name (str): The host address (e.g., 'localhost' or an IP address).
        user_name (str): The MySQL username.
        user_password (str): The MySQL password.
        db_name (str, optional): The database to connect to. Defaults to None.
    
    Returns:
        connection: MySQL database connection object.
    """
    connection = None
    try:
        # Establish the connection using the provided parameters
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            password=user_password,
            database=db_name
        )
        if connection.is_connected():
            print("Connection to MySQL DB successful")
    except Error as e:
        # Handle connection errors
        print(f"The error '{e}' occurred")
    return connection

def execute_query(connection, query):
    """Execute a single query against the MySQL database.
    
    Args:
        connection: MySQL database connection object.
        query (str): The SQL query to execute.
    """
    cursor = connection.cursor()
    try:
        cursor.execute(query)
        connection.commit()  # Commit changes if applicable
        print("Query executed successfully")
    except Error as e:
        print(f"The error '{e}' occurred")

def main():
    # Define connection parameters
    host = "localhost"  # Replace with your host if not using localhost
    user = "your_username"  # Replace with your MySQL username
    password = "your_password"  # Replace with your MySQL password
    database = "little_lemon"  # Replace with your target database name

    # Create a connection to the database
    connection = create_connection(host, user, password, database)

    if connection:
        # Example SQL query to create a table (if it doesn't exist)
        create_table_query = """
        CREATE TABLE IF NOT EXISTS users (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            age INT NOT NULL
        )
        """
        execute_query(connection, create_table_query)

        # Example SQL query to insert data
        insert_user_query = """
        INSERT INTO users (name, age) VALUES ('John Doe', 30)
        """
        execute_query(connection, insert_user_query)

        # Close the connection
        connection.close()
        print("Connection to MySQL DB closed")

if __name__ == "__main__":
    main()
