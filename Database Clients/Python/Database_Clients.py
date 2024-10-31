# MySQL Database Clients Overview

# MySQL is an open-source SQL database management system (DBMS).
# It is a relational database that organizes data into separate tables.
# MySQL follows a client/server architecture, where the server can run on various platforms
# like desktops or laptops, requiring minimal attention.

# Characteristics of MySQL:
# - Fast and reliable
# - Scalable
# - Easy to use

# In the client/server system of MySQL:
# - The MySQL server acts as the backend where databases are created and stored.
# - The client software connects to the MySQL database server to perform operations
#   using SQL queries.

# The relationship can be illustrated as follows:
# Application <--> Client (MySQL Connector) <--> MySQL Server

# Clients, also known as drivers or APIs, enable various software and programming languages
# to interact with the MySQL database. In Python, the two most commonly used clients are:
# 1. MySQL Connector/Python
# 2. SQLAlchemy

# MySQL Connector/Python:
# This is a standardized database driver for Python, widely used for connecting
# Python applications to MySQL databases.

# SQLAlchemy:
# This is an ORM (Object Relational Mapping) framework that provides Python developers
# with full control and flexibility to run SQL queries on the MySQL database.

# Connecting to MySQL using Python:
# To connect to the database, you need to follow these steps:
# 1. Import the necessary library.
# 2. Establish a connection request to the MySQL client.
# 3. If the connection is successful, you can execute SQL queries.

# Example code to connect to a MySQL database using MySQL Connector/Python:

import mysql.connector
from mysql.connector import Error

def connect_to_mysql():
    """Establish a connection to the MySQL database."""
    try:
        # Establish the connection
        connection = mysql.connector.connect(
            host='localhost',        # Host where the MySQL server is running
            database='Lucky_Shrub', # Replace with your database name
            user='root',      # Replace with your MySQL username
            password='Admin@LL123!'    # Replace with your MySQL password
        )

        # Check if the connection was successful
        if connection.is_connected():
            print("Successfully connected to the database")

            # You can run SQL queries here using the connection
            # For example, creating a cursor to execute queries:
            cursor = connection.cursor()
            cursor.execute("SELECT DATABASE();")
            record = cursor.fetchone()
            print(f"You're connected to database: {record}")

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

# Call the function to connect to MySQL
if __name__ == "__main__":
    connect_to_mysql()

# Summary:
# This script outlines the client/server architecture of MySQL,
# highlights the use of MySQL Connector/Python, and demonstrates
# how to connect to a MySQL database using Python.


# Output

# PS C:\Users\hirew\OneDrive\Desktop\Meta Data Engineer> python -u "c:\Users\hirew\OneDrive\Desktop\Meta Data Engineer\Database Clients\Python\Database_Clients.py"
# Successfully connected to the database
# You're connected to database: ('lucky_shrub',)
# MySQL connection is closed