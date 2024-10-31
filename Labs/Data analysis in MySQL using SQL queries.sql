/*coder@62aef63cd489:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE Lucky_Shrub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW tables;
+-----------------------+
| Tables_in_Lucky_Shrub |
+-----------------------+
| Activity              |
| Orders                |
| Products              |
+-----------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Orders;
+---------+----------+-----------+----------+---------+------------+
| OrderID | ClientID | ProductID | Quantity | Cost    | Date       |
+---------+----------+-----------+----------+---------+------------+
|       1 | Cl1      | P1        |       10 |  500.00 | 2020-09-01 |
|       2 | Cl2      | P2        |        5 |  100.00 | 2020-09-05 |
|       3 | Cl3      | P3        |       20 |  800.00 | 2020-09-03 |
|       4 | Cl4      | P4        |       15 |  150.00 | 2020-09-07 |
|       5 | Cl3      | P3        |       10 |  450.00 | 2020-09-08 |
|       6 | Cl2      | P2        |        5 |  800.00 | 2020-09-09 |
|       7 | Cl1      | P4        |       22 | 1200.00 | 2020-09-10 |
|       8 | Cl3      | P1        |       15 |  150.00 | 2020-09-10 |
|       9 | Cl1      | P1        |       10 |  500.00 | 2020-09-12 |
|      10 | Cl2      | P2        |        5 |  100.00 | 2020-09-13 |
|      11 | Cl4      | P5        |        5 |  100.00 | 2020-09-15 |
|      12 | Cl1      | P1        |       10 |  500.00 | 2022-09-01 |
|      13 | Cl2      | P2        |        5 |  100.00 | 2022-09-05 |
|      14 | Cl3      | P3        |       20 |  800.00 | 2022-09-03 |
|      15 | Cl4      | P4        |       15 |  150.00 | 2022-09-07 |
|      16 | Cl3      | P3        |       10 |  450.00 | 2022-09-08 |
|      17 | Cl2      | P2        |        5 |  800.00 | 2022-09-09 |
|      18 | Cl1      | P4        |       22 | 1200.00 | 2022-09-10 |
|      19 | Cl3      | P1        |       15 |  150.00 | 2022-09-10 |
|      20 | Cl1      | P1        |       10 |  500.00 | 2022-09-12 |
|      21 | Cl2      | P2        |        5 |  100.00 | 2022-09-13 |
|      22 | Cl2      | P1        |       10 |  500.00 | 2021-09-01 |
|      23 | Cl2      | P2        |        5 |  100.00 | 2021-09-05 |
|      24 | Cl3      | P3        |       20 |  800.00 | 2021-09-03 |
|      25 | Cl4      | P4        |       15 |  150.00 | 2021-09-07 |
|      26 | Cl1      | P3        |       10 |  450.00 | 2021-09-08 |
|      27 | Cl2      | P1        |       20 | 1000.00 | 2022-09-01 |
|      28 | Cl2      | P2        |       10 |  200.00 | 2022-09-05 |
|      29 | Cl3      | P3        |       20 |  800.00 | 2021-09-03 |
|      30 | Cl1      | P1        |       10 |  500.00 | 2022-09-01 |
+---------+----------+-----------+----------+---------+------------+
30 rows in set (0.00 sec)

mysql> SELECT ProductID FROM Products WHERE ProductID = ANY(SELECT ProductID FROM Orders WH                         +-----------+
| ProductID |
+-----------+
| P1        |
| P2        |
| P3        |
| P4        |
+-----------+
4 rows in set (0.00 sec)

mysql> SELECT Orders.ClientID, Orders.Cost, Clients.FullName, Clients.ContactNumber FROM Orders INNER JOIN Clients ON(Orders.ClientID = Clients.ClientID) AND (Date BETWEEN '2020-09-10' AND '2020-09-20');
ERROR 1146 (42S02): Table 'Lucky_Shrub.Clients' doesn't exist
mysql> SELECT * FROM Products;
+-----------+-----------------------+----------+-----------+---------------+
| ProductID | ProductName           | BuyPrice | SellPrice | NumberOfItems |
+-----------+-----------------------+----------+-----------+---------------+
| P1        | Artificial grass bags |    40.00 |     50.00 |           100 |
| P2        | Wood panels           |    15.00 |     20.00 |           250 |
| P3        | Patio slates          |    35.00 |     40.00 |            60 |
| P4        | Sycamore trees        |     7.00 |     10.00 |            50 |
| P5        | Trees and Shrubs      |    35.00 |     50.00 |            75 |
| P6        | Water fountain        |    65.00 |     80.00 |            15 |
+-----------+-----------------------+----------+-----------+---------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Activity;
+------------+----------------------------------------------------------+
| ActivityID | Properties                                               |
+------------+----------------------------------------------------------+
|          1 | {"Order": "True", "ClientID": "Cl1", "ProductID": "P1"}  |
|          2 | {"Order": "False", "ClientID": "Cl2", "ProductID": "P4"} |
|          3 | {"Order": "True", "ClientID": "Cl5", "ProductID": "P5"}  |
+------------+----------------------------------------------------------+
3 rows in set (0.00 sec)

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
3 rows in set (0.01 sec)

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

mysql> CREATE TABLE IF NOT EXISTS Clients (
    ->     ClientID VARCHAR(10) NOT NULL PRIMARY KEY,
    ->     FullName VARCHAR(100),
    ->     ContactNumber VARCHAR(15)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> INSERT INTO Clients (ClientID, FullName, ContactNumber) VALUES
    -> ('Cl1', 'Alice Johnson', '123-456-7890'),
    -> ('Cl2', 'Bob Smith', '234-567-8901'),
    -> ('Cl3', 'Carol Williams', '345-678-9012'),
    -> ('Cl4', 'David Brown', '456-789-0123'),
    -> ('Cl5', 'Eve Davis', '567-890-1234');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> -- Check the tables
mysql> SHOW TABLES;
+-----------------------+
| Tables_in_Lucky_Shrub |
+-----------------------+
| Activity              |
| Clients               |
| Orders                |
| Products              |
+-----------------------+
4 rows in set (0.00 sec)

mysql> 
mysql> -- Show the contents of the Clients table
mysql> SELECT * FROM Clients;
+----------+----------------+---------------+
| ClientID | FullName       | ContactNumber |
+----------+----------------+---------------+
| Cl1      | Alice Johnson  | 123-456-7890  |
| Cl2      | Bob Smith      | 234-567-8901  |
| Cl3      | Carol Williams | 345-678-9012  |
| Cl4      | David Brown    | 456-789-0123  |
| Cl5      | Eve Davis      | 567-890-1234  |
+----------+----------------+---------------+
5 rows in set (0.00 sec)

mysql> SELECT Orders.ClientID, Orders.Cost, Clients.FullName, Clients.ContactNumber FROM Orders INNER JOIN Clients ON(Orders.ClientID = Clients.ClientID) AND (Date BETWEEN '2020-09-10' AND '2020-09-20');                                        +----------+---------+----------------+---------------+
| ClientID | Cost    | FullName       | ContactNumber |
+----------+---------+----------------+---------------+
| Cl1      | 1200.00 | Alice Johnson  | 123-456-7890  |
| Cl3      |  150.00 | Carol Williams | 345-678-9012  |
| Cl1      |  500.00 | Alice Johnson  | 123-456-7890  |
| Cl2      |  100.00 | Bob Smith      | 234-567-8901  |
| Cl4      |  100.00 | David Brown    | 456-789-0123  |
+----------+---------+----------------+---------------+
5 rows in set (0.00 sec)

mysql> CREATE VIEW TopProducts AS SELECT Products.ProductName, Orders.Quantity, Orders.Cost FROM Orders INNER JOIN Products ON Orders.ProductID = Products.ProductID ORDER BY Orders.Cost DESC LIMIT 5;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM TopProducts;
+-----------------------+----------+---------+
| ProductName           | Quantity | Cost    |
+-----------------------+----------+---------+
| Sycamore trees        |       22 | 1200.00 |
| Sycamore trees        |       22 | 1200.00 |
| Artificial grass bags |       20 | 1000.00 |
| Wood panels           |        5 |  800.00 |
| Patio slates          |       20 |  800.00 |
+-----------------------+----------+---------+
5 rows in set (0.00 sec)

mysql> */