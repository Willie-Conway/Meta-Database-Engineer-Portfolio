import mysql.connector
import math
from datetime import datetime, timedelta

# Connect to the MySQL database
connection = mysql.connector.connect(
    host='localhost',
    user='root',      # replace with your MySQL username
    password='Admin@LL123!',  # replace with your MySQL password
    database='jewelrystore_db' # replace with your database name
)

cursor = connection.cursor()

# 1. Using CEIL function
cursor.execute("SELECT CEIL(15.50) AS ceil_value;")
ceil_value = cursor.fetchone()[0]
print(f"CEIL of 15.50 is: {ceil_value}")  # Expected output: 16

# 2. Using FLOOR function
cursor.execute("SELECT FLOOR(15.50) AS floor_value;")
floor_value = cursor.fetchone()[0]
print(f"FLOOR of 15.50 is: {floor_value}")  # Expected output: 15

# 3. Using FORMAT function
cursor.execute("SELECT FORMAT(3750.753, 2) AS formatted_value;")
formatted_value = cursor.fetchone()[0]
print(f"Formatted value: {formatted_value}")  # Expected output: '3,750.75'

# 4. Using ADDDATE function
cursor.execute("SELECT ADDDATE('2020-05-10', INTERVAL 5 DAY) AS new_date;")
new_date = cursor.fetchone()[0]
print(f"New date after adding 5 days: {new_date}")  # Expected output: '2020-05-15'

# 5. Using QUARTER function
cursor.execute("SELECT QUARTER('2020-09-15') AS quarter_value;")
quarter_value = cursor.fetchone()[0]
print(f"Quarter of the date 2020-09-15: {quarter_value}")  # Expected output: 3

# 6. Using COALESCE function
cursor.execute("SELECT COALESCE(NULL, 'Coursera', NULL, 'Database') AS coalesce_value;")
coalesce_value = cursor.fetchone()[0]
print(f"COALESCE result: {coalesce_value}")  # Expected output: 'Coursera'

# 7. Using IFNULL function
cursor.execute("SELECT IFNULL(NULL, 'Coursera') AS ifnull_value;")
ifnull_value = cursor.fetchone()[0]
print(f"IFNULL result: {ifnull_value}")  # Expected output: 'Coursera'

# 8. Using NULLIF function
cursor.execute("SELECT NULLIF(10, 15) AS nullif_value;")
nullif_value = cursor.fetchone()[0]
print(f"NULLIF result: {nullif_value}")  # Expected output: 10

# Close the cursor and connection
cursor.close()
connection.close()
