import mysql.connector

# Connect to the MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",  # Replace with your MySQL username
    password="Admin@LL123!",  # Replace with your MySQL password
)

cursor = db.cursor()

# Step 1: Create the Lucky Shrub database
cursor.execute("CREATE DATABASE IF NOT EXISTS Lucky_Shrub;")
cursor.execute("USE Lucky_Shrub;")

# Step 2: Create the Orders table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT NOT NULL,
    ClientID VARCHAR(10) DEFAULT NULL,
    ProductID VARCHAR(10) DEFAULT NULL,
    Quantity INT DEFAULT NULL,
    Cost DECIMAL(6,2) DEFAULT NULL,
    OrderDate DATE DEFAULT NULL,  -- Ensure the column name is correct
    PRIMARY KEY (OrderID)
);
""")

# Step 3: Insert data into the Orders table
cursor.execute("""
INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, OrderDate) VALUES
(1, "Cl1", "P1", 10, 500, "2020-09-01"),
(2, "Cl2", "P2", 5, 100, "2020-09-05"),
(3, "Cl3", "P3", 20, 800, "2020-09-03"),
(4, "Cl4", "P4", 15, 150, "2020-09-07"),
(5, "Cl3", "P3", 10, 450, "2020-09-08"),
(6, "Cl2", "P2", 5, 800, "2020-09-09"),
(7, "Cl1", "P4", 22, 1200, "2020-09-10"),
(8, "Cl3", "P1", 15, 150, "2020-09-10"),
(9, "Cl1", "P1", 10, 500, "2020-09-12"),
(10, "Cl2", "P2", 5, 100, "2020-09-13"),
(11, "Cl1", "P2", 15, 80, "2020-09-12"),
(12, "Cl1", "P1", 10, 500, "2022-09-01"),
(13, "Cl2", "P2", 5, 100, "2022-09-05"),
(14, "Cl3", "P3", 20, 800, "2022-09-03"),
(15, "Cl4", "P4", 15, 150, "2022-09-07"),
(16, "Cl3", "P3", 10, 450, "2022-09-08"),
(17, "Cl2", "P2", 5, 800, "2022-09-09"),
(18, "Cl1", "P4", 22, 1200, "2022-09-10"),
(19, "Cl3", "P1", 15, 150, "2022-09-10"),
(20, "Cl1", "P1", 10, 500, "2022-09-12"),
(21, "Cl2", "P2", 5, 100, "2022-09-13"),
(22, "Cl2", "P1", 10, 500, "2021-09-01"),
(23, "Cl2", "P2", 5, 100, "2021-09-05"),
(24, "Cl3", "P3", 20, 800, "2021-09-03"),
(25, "Cl4", "P4", 15, 150, "2021-09-07"),
(26, "Cl1", "P3", 10, 450, "2021-09-08"),
(27, "Cl2", "P1", 20, 1000, "2022-09-01"),
(28, "Cl2", "P2", 10, 200, "2022-09-05"),
(29, "Cl3", "P3", 20, 800, "2021-09-03");
""")

# Step 4: Create the Employees table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT DEFAULT NULL,
    FullName VARCHAR(100) DEFAULT NULL,
    Role VARCHAR(50) DEFAULT NULL,
    Department VARCHAR(255) DEFAULT NULL
);
""")

# Step 5: Insert data into the Employees table
cursor.execute("""
INSERT INTO Employees (EmployeeID, FullName, Role, Department) VALUES
(1, "Seamus Hogan", "Manager", "Management"),
(2, "Thomas Eriksson", "Assistant", "Sales"),
(3, "Simon Tolo", "Executive", "Management"),
(4, "Francesca Soffia", "Assistant", "Human Resources"),
(5, "Emily Sierra", "Accountant", "Finance"),
(6, "Greta Galkina", "Accountant", "Finance"),
(7, "Maria Carter", "Executive", "Human Resources"),
(8, "Rick Griffin", "Manager", "Marketing");
""")

# Task 1: Optimize SELECT Statement
cursor.execute("SELECT OrderID, ProductID, Quantity, OrderDate FROM Orders;")
orders_results = cursor.fetchall()
print("Task 1 Results:")
for row in orders_results:
    print(row)

# Task 2: Create an index for ClientID and run EXPLAIN
cursor.execute("CREATE INDEX IdxClientID ON Orders(ClientID);")
cursor.execute("EXPLAIN SELECT * FROM Orders WHERE ClientID = 'Cl1';")
explain_results = cursor.fetchall()
print("\nTask 2 Explain Results:")
for row in explain_results:
    print(row)

# Task 3: Add ReverseFullName column and populate it
cursor.execute("ALTER TABLE Employees ADD COLUMN ReverseFullName VARCHAR(255);")
cursor.execute("""
    UPDATE Employees 
    SET ReverseFullName = CONCAT(
        SUBSTRING_INDEX(FullName, ' ', -1),
        ' ',
        SUBSTRING_INDEX(FullName, ' ', 1)
    );
""")
cursor.execute("CREATE INDEX IdxReverseFullName ON Employees(ReverseFullName);")
cursor.execute("SELECT * FROM Employees WHERE ReverseFullName LIKE 'Tolo%';")
employees_results = cursor.fetchall()

print("\nTask 3 Results:")
for row in employees_results:
    print(row)

# Commit changes and close the connection
db.commit()
cursor.close()
db.close()
