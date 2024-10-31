/*coder@62aef63cd489:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS Lucky_Shrub;
Query OK, 1 row affected (0.02 sec)

mysql> USE Lucky_Shrub;
Database changed
mysql> CREATE TABLE IF NOT EXISTS Orders (
    ->     OrderID INT NOT NULL PRIMARY KEY,
    ->     ClientID VARCHAR(10),
    ->     ProductID VARCHAR(10),
    ->     Quantity INT,
    ->     Cost DECIMAL(6,2),
    ->     Date DATE
    -> );
F NOT EXISTS Products (
    ProductID VARCHAR(10),
    ProductName VARCHAR(100),
    BuyPrice DECIMAL(6,2),
    SellPrice DECIMAL(6,2),
    NumberOfItems INT,
    PRIMARY KEY (ProductID)
);

CREATE TABLE IF NOT EXISTS Activity (
    ActivityID INT PRIMARY KEY,
    Properties JSON
);
Query OK, 0 rows affected (0.13 sec)

mysql> 
mysql> CREATE TABLE IF NOT EXISTS Products (
    ->     ProductID VARCHAR(10),
    ->     ProductName VARCHAR(100),
    ->     BuyPrice DECIMAL(6,2),
    ->     SellPrice DECIMAL(6,2),
    ->     NumberOfItems INT,
    ->     PRIMARY KEY (ProductID)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> 
mysql> CREATE TABLE IF NOT EXISTS Activity (
    ->     ActivityID INT PRIMARY KEY,
    ->     Properties JSON
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date) VALUES 
    -> (1, 'Cl1', 'P1', 10, 500, '2020-09-01'), 
    -> (2, 'Cl2', 'P2', 5, 100, '2020-09-05'), 
    -> (3, 'Cl3', 'P3', 20, 800, '2020-09-03'), 
    -> (4, 'Cl4', 'P4', 15, 150, '2020-09-07'), 
    -> (5, 'Cl3', 'P3', 10, 450, '2020-09-08'), 
    -> (6, 'Cl2', 'P2', 5, 800, '2020-09-09'), 
    -> (7, 'Cl1', 'P4', 22, 1200, '2020-09-10'), 
    -> (8, 'Cl3', 'P1', 15, 150, '2020-09-10'), 
    -> (9, 'Cl1', 'P1', 10, 500, '2020-09-12'), 
    -> (10, 'Cl2', 'P2', 5, 100, '2020-09-13'), 
    -> (11, 'Cl4', 'P5', 5, 100, '2020-09-15'),
    -> (12, 'Cl1', 'P1', 10, 500, '2022-09-01'), 
    -> (13, 'Cl2', 'P2', 5, 100, '2022-09-05'), 
    -> (14, 'Cl3', 'P3', 20, 800, '2022-09-03'), 
    -> (15, 'Cl4', 'P4', 15, 150, '2022-09-07'), 
    -> (16, 'Cl3', 'P3', 10, 450, '2022-09-08'), 
    -> (17, 'Cl2', 'P2', 5, 800, '2022-09-09'), 
    -> (18, 'Cl1', 'P4', 22, 1200, '2022-09-10'), 
    -> (19, 'Cl3', 'P1', 15, 150, '2022-09-10'), 
    -> (20, 'Cl1', 'P1', 10, 500, '2022-09-12'), 
    -> (21, 'Cl2', 'P2', 5, 100, '2022-09-13'),  
    -> (22, 'Cl2', 'P1', 10, 500, '2021-09-01'), 
    -> (23, 'Cl2', 'P2', 5, 100, '2021-09-05'), 
    -> (24, 'Cl3', 'P3', 20, 800, '2021-09-03'), 
    -> (25, 'Cl4', 'P4', 15, 150, '2021-09-07'), 
    -> (26, 'Cl1', 'P3', 10, 450, '2021-09-08'), 
    -> (27, 'Cl2', 'P1', 20, 1000, '2022-09-01'), 
    -> (28, 'Cl2', 'P2', 10, 200, '2022-09-05'), 
    -> (29, 'Cl3', 'P3', 20, 800, '2021-09-03'), 
    -> (30, 'Cl1', 'P1', 10, 500, '2022-09-01');
Query OK, 30 rows affected (0.02 sec)
Records: 30  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems) VALUES 
    -> ('P1', 'Artificial grass bags', 40, 50, 100), 
    -> ('P2', 'Wood panels', 15, 20, 250), 
    -> ('P3', 'Patio slates', 35, 40, 60), 
    -> ('P4', 'Sycamore trees', 7, 10, 50), 
    -> ('P5', 'Trees and Shrubs', 35, 50, 75), 
    -> ('P6', 'Water fountain', 65, 80, 15);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Activity (ActivityID, Properties) VALUES  
    -> (1, '{ "ClientID": "Cl1", "ProductID": "P1", "Order": "True" }'),  
    -> (2, '{ "ClientID": "Cl2", "ProductID": "P4", "Order": "False" }'),  
    -> (3, '{ "ClientID": "Cl5", "ProductID": "P5", "Order": "True" }');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> WITH OrderCounts AS (
    ->     SELECT ClientID, COUNT(OrderID) AS OrderCount
    ->     FROM Orders
    ->     WHERE YEAR(Date) = 2022 AND ClientID IN ('Cl1', 'Cl2', 'Cl3')
    ->     GROUP BY ClientID
    -> )
    -> SELECT CONCAT(ClientID, ': ', OrderCount, ' orders') AS "Total number of orders"
    -> FROM OrderCounts;
+------------------------+
| Total number of orders |
+------------------------+
| Cl1: 4 orders          |
| Cl2: 5 orders          |
| Cl3: 3 orders          |
+------------------------+
3 rows in set (0.00 sec)

mysql> PREPARE GetOrderDetail FROM
    ->     'SELECT OrderID, Quantity, Cost, Date
    '>      FROM Orders
    '>      WHERE ClientID = ? AND YEAR(Date) = ?';
Query OK, 0 rows affected (0.00 sec)
Statement prepared

mysql> 
mysql> -- Example execution:
mysql> SET @client_id = 'Cl1';
Query OK, 0 rows affected (0.00 sec)

mysql> SET @year = 2020;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> EXECUTE GetOrderDetail USING @client_id, @year;
+---------+----------+---------+------------+
| OrderID | Quantity | Cost    | Date       |
+---------+----------+---------+------------+
|       1 |       10 |  500.00 | 2020-09-01 |
|       7 |       22 | 1200.00 | 2020-09-10 |
|       9 |       10 |  500.00 | 2020-09-12 |
+---------+----------+---------+------------+
3 rows in set (0.00 sec)

mysql> 
mysql> -- Deallocate the prepared statement when done
mysql> DEALLOCATE PREPARE GetOrderDetail;
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT 
    ->     JSON_UNQUOTE(Properties->'$.ProductID') AS ProductID,
    ->     p.ProductName,
    ->     p.BuyPrice,
    ->     p.SellPrice
    -> FROM Activity a
    -> JOIN Products p ON JSON_UNQUOTE(a.Properties->'$.ProductID') = p.ProductID
    -> WHERE JSON_UNQUOTE(a.Properties->'$.Order') = 'True';
+-----------+-----------------------+----------+-----------+
| ProductID | ProductName           | BuyPrice | SellPrice |
+-----------+-----------------------+----------+-----------+
| P1        | Artificial grass bags |    40.00 |     50.00 |
| P5        | Trees and Shrubs      |    35.00 |     50.00 |
+-----------+-----------------------+----------+-----------+
2 rows in set (0.00 sec)

mysql> SELECT CONCAT("Cl1: ", COUNT(OrderID), "orders") AS "Total number of orders" 
    -> FROM Orders 
    -> WHERE YEAR(Date) = 2022 AND ClientID = "Cl1" 
    -> UNION 
    -> SELECT CONCAT("Cl2: ", COUNT(OrderID), "orders") 
    -> FROM Orders 
    -> WHERE YEAR(Date) = 2022 AND ClientID = "Cl2" 
    -> UNION 
    -> SELECT CONCAT("Cl3: ", COUNT(OrderID), "orders") 
    -> FROM Orders 
    -> WHERE YEAR(Date) = 2022 AND ClientID = "Cl3"; 
+------------------------+
| Total number of orders |
+------------------------+
| Cl1: 4orders           |
| Cl2: 5orders           |
| Cl3: 3orders           |
+------------------------+
3 rows in set (0.00 sec)

mysql> WITH 
    -> CL1_Orders AS (SELECT CONCAT("Cl1: ", COUNT(OrderID), "orders") AS "Total number of orders"   
    -> FROM Orders 
    -> WHERE YEAR(Date) = 2022 AND ClientID = "Cl1"), 
    -> CL2_Orders AS (SELECT  CONCAT("Cl2: ", COUNT(OrderID), "orders") 
    -> FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl2"), 
    -> CL3_Orders AS (SELECT  CONCAT("Cl3: ", COUNT(OrderID), "orders") 
    -> FROM Orders WHERE YEAR(Date) = 2022 AND ClientID = "Cl3") 
    -> SELECT * FROM CL1_Orders
    -> UNION 
    -> SELECT * FROM CL2_Orders
    -> UNION 
    -> SELECT * FROM CL3_Orders; 
+------------------------+
| Total number of orders |
+------------------------+
| Cl1: 4orders           |
| Cl2: 5orders           |
| Cl3: 3orders           |
+------------------------+
3 rows in set (0.00 sec)

mysql> PREPARE GetOrderDetail FROM 'SELECT OrderID, Quantity, Cost, Date FROM Orders WHERE ClientID = ? AND YEAR(Date) = ? ';
Query OK, 0 rows affected (0.00 sec)
Statement prepared

mysql> SELECT Activity.Properties ->>'$.ProductID' 
    -> AS ProductID, Products.ProductName, Products.BuyPrice, Products.SellPrice 
    -> FROM Products INNER JOIN Activity 
    -> ON Products.ProductID = Activity.Properties ->>'$.ProductID' 
    -> WHERE Activity.Properties ->>'$.Order' = "True";
+-----------+-----------------------+----------+-----------+
| ProductID | ProductName           | BuyPrice | SellPrice |
+-----------+-----------------------+----------+-----------+
| P1        | Artificial grass bags |    40.00 |     50.00 |
| P5        | Trees and Shrubs      |    35.00 |     50.00 |
+-----------+-----------------------+----------+-----------+
2 rows in set (0.00 sec)

mysql> */
