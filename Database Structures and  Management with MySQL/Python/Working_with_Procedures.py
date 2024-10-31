import mysql.connector

# Connect to the MySQL database
connection = mysql.connector.connect(
    host='localhost',
    user='root',      # Replace with your MySQL username
    password='Admin@LL123!',  # Replace with your MySQL password
    database='Lucky_Shrub'    # Ensure this database exists
)

cursor = connection.cursor()

# Task 1: Create a stored procedure called 'GetOrdersData'
# This procedure retrieves all data from the Orders table.
create_procedure_get_orders_data = """
CREATE PROCEDURE GetOrdersData ()
BEGIN
    SELECT * FROM Orders;
END;
"""

# Execute the procedure creation
try:
    cursor.execute(create_procedure_get_orders_data)
    print("Stored procedure 'GetOrdersData' created successfully.")
except mysql.connector.Error as err:
    print(f"Error: {err}")

# Call the GetOrdersData procedure
try:
    cursor.callproc('GetOrdersData')
    print("Calling stored procedure 'GetOrdersData':")
    for result in cursor.stored_results():
        for row in result.fetchall():
            print(row)  # Print each row retrieved from the procedure
except mysql.connector.Error as err:
    print(f"Error calling 'GetOrdersData': {err}")

# Task 2: Create a stored procedure called 'GetListOfOrdersInRange'
# This procedure retrieves data based on a cost range defined by two parameters.
create_procedure_get_orders_in_range = """
CREATE PROCEDURE GetListOfOrdersInRange (MinimumValue DECIMAL(6, 2), MaximumValue DECIMAL(6, 2))
BEGIN
    SELECT * FROM Orders WHERE Cost >= MinimumValue AND Cost <= MaximumValue;
END;
"""

# Execute the procedure creation
try:
    cursor.execute(create_procedure_get_orders_in_range)
    print("Stored procedure 'GetListOfOrdersInRange' created successfully.")
except mysql.connector.Error as err:
    print(f"Error: {err}")

# Call the GetListOfOrdersInRange procedure with specified range values
min_value = 150
max_value = 600
try:
    cursor.callproc('GetListOfOrdersInRange', [min_value, max_value])
    print(f"Calling stored procedure 'GetListOfOrdersInRange' with values ({min_value}, {max_value}):")
    for result in cursor.stored_results():
        for row in result.fetchall():
            print(row)  # Print each row retrieved from the procedure
except mysql.connector.Error as err:
    print(f"Error calling 'GetListOfOrdersInRange': {err}")

# Close the cursor and connection
cursor.close()
connection.close()
