/*coder@c4d78d406d83:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE luckyshrub_db;
Query OK, 1 row affected (0.03 sec)

mysql> USE luckyshrub_db;
Database changed
mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     Department VARCHAR(100),
    ->     OrderDate DATE,
    ->     OrderQty INT,
    ->     OrderTotal INT
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> INSERT INTO Orders (OrderID, Department, OrderDate, OrderQty, OrderTotal) VALUES
    -> (1, 'Lawn Care', '2022-05-05', 12, 500),
    -> (2, 'Decking', '2022-05-22', 150, 1450),
    -> (3, 'Compost and Stones', '2022-05-27', 20, 780),
    -> (4, 'Trees and Shrubs', '2022-06-01', 15, 400),
    -> (5, 'Garden Decor', '2022-06-10', 2, 1250),
    -> (6, 'Lawn Care', '2022-06-10', 12, 500),
    -> (7, 'Decking', '2022-06-25', 150, 1450),
    -> (8, 'Compost and Stones', '2022-05-29', 20, 780),
    -> (9, 'Trees and Shrubs', '2022-06-10', 15, 400),
    -> (10, 'Garden Decor', '2022-06-10', 2, 1250),
    -> (11, 'Lawn Care', '2022-06-25', 10, 400),
    -> (12, 'Decking', '2022-06-25', 100, 1400),
    -> (13, 'Compost and Stones', '2022-05-30', 15, 700),
    -> (14, 'Trees and Shrubs', '2022-06-15', 10, 300),
    -> (15, 'Garden Decor', '2022-06-11', 2, 1250),
    -> (16, 'Lawn Care', '2022-06-10', 12, 500),
    -> (17, 'Decking', '2022-06-25', 150, 1450),
    -> (18, 'Trees and Shrubs', '2022-06-10', 15, 400),
    -> (19, 'Lawn Care', '2022-06-10', 12, 500),
    -> (20, 'Decking', '2022-06-25', 150, 1450),
    -> (21, 'Decking', '2022-06-25', 150, 1450);
Query OK, 21 rows affected (0.03 sec)
Records: 21  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Orders;
+---------+--------------------+------------+----------+------------+
| OrderID | Department         | OrderDate  | OrderQty | OrderTotal |
+---------+--------------------+------------+----------+------------+
|       1 | Lawn Care          | 2022-05-05 |       12 |        500 |
|       2 | Decking            | 2022-05-22 |      150 |       1450 |
|       3 | Compost and Stones | 2022-05-27 |       20 |        780 |
|       4 | Trees and Shrubs   | 2022-06-01 |       15 |        400 |
|       5 | Garden Decor       | 2022-06-10 |        2 |       1250 |
|       6 | Lawn Care          | 2022-06-10 |       12 |        500 |
|       7 | Decking            | 2022-06-25 |      150 |       1450 |
|       8 | Compost and Stones | 2022-05-29 |       20 |        780 |
|       9 | Trees and Shrubs   | 2022-06-10 |       15 |        400 |
|      10 | Garden Decor       | 2022-06-10 |        2 |       1250 |
|      11 | Lawn Care          | 2022-06-25 |       10 |        400 |
|      12 | Decking            | 2022-06-25 |      100 |       1400 |
|      13 | Compost and Stones | 2022-05-30 |       15 |        700 |
|      14 | Trees and Shrubs   | 2022-06-15 |       10 |        300 |
|      15 | Garden Decor       | 2022-06-11 |        2 |       1250 |
|      16 | Lawn Care          | 2022-06-10 |       12 |        500 |
|      17 | Decking            | 2022-06-25 |      150 |       1450 |
|      18 | Trees and Shrubs   | 2022-06-10 |       15 |        400 |
|      19 | Lawn Care          | 2022-06-10 |       12 |        500 |
|      20 | Decking            | 2022-06-25 |      150 |       1450 |
|      21 | Decking            | 2022-06-25 |      150 |       1450 |
+---------+--------------------+------------+----------+------------+
21 rows in set (0.00 sec)

mysql> SELECT OrderDate, COUNT(*) AS NumberOfOrders
    -> FROM Orders
    -> GROUP BY OrderDate;
+------------+----------------+
| OrderDate  | NumberOfOrders |
+------------+----------------+
| 2022-05-05 |              1 |
| 2022-05-22 |              1 |
| 2022-05-27 |              1 |
| 2022-06-01 |              1 |
| 2022-06-10 |              7 |
| 2022-06-25 |              6 |
| 2022-05-29 |              1 |
| 2022-05-30 |              1 |
| 2022-06-15 |              1 |
| 2022-06-11 |              1 |
+------------+----------------+
10 rows in set (0.00 sec)

mysql> SELECT OrderDate, COUNT(*) AS NumberOfOrders
    -> FROM Orders
    -> GROUP BY OrderDate;
+------------+----------------+
| OrderDate  | NumberOfOrders |
+------------+----------------+
| 2022-05-05 |              1 |
| 2022-05-22 |              1 |
| 2022-05-27 |              1 |
| 2022-06-01 |              1 |
| 2022-06-10 |              7 |
| 2022-06-25 |              6 |
| 2022-05-29 |              1 |
| 2022-05-30 |              1 |
| 2022-06-15 |              1 |
| 2022-06-11 |              1 |
+------------+----------------+
10 rows in set (0.00 sec)

mysql> SELECT Department, SUM(OrderQty) AS TotalOrderQty
    -> FROM Orders
    -> GROUP BY Department;
+--------------------+---------------+
| Department         | TotalOrderQty |
+--------------------+---------------+
| Lawn Care          |            58 |
| Decking            |           850 |
| Compost and Stones |            55 |
| Trees and Shrubs   |            55 |
| Garden Decor       |             6 |
+--------------------+---------------+
5 rows in set (0.00 sec)

mysql> SELECT OrderDate, COUNT(*) AS NumberOfOrders
    -> FROM Orders
    -> WHERE OrderDate BETWEEN '2022-06-01' AND '2022-06-30'
    -> GROUP BY OrderDate;
+------------+----------------+
| OrderDate  | NumberOfOrders |
+------------+----------------+
| 2022-06-01 |              1 |
| 2022-06-10 |              7 |
| 2022-06-25 |              6 |
| 2022-06-15 |              1 |
| 2022-06-11 |              1 |
+------------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT OrderDate FROM Orders GROUP BY OrderDate;
+------------+
| OrderDate  |
+------------+
| 2022-05-05 |
| 2022-05-22 |
| 2022-05-27 |
| 2022-06-01 |
| 2022-06-10 |
| 2022-06-25 |
| 2022-05-29 |
| 2022-05-30 |
| 2022-06-15 |
| 2022-06-11 |
+------------+
10 rows in set (0.00 sec)

mysql> SELECT OrderDate,COUNT(OrderID) FROM Orders GROUP BY OrderDate;
+------------+----------------+
| OrderDate  | COUNT(OrderID) |
+------------+----------------+
| 2022-05-05 |              1 |
| 2022-05-22 |              1 |
| 2022-05-27 |              1 |
| 2022-06-01 |              1 |
| 2022-06-10 |              7 |
| 2022-06-25 |              6 |
| 2022-05-29 |              1 |
| 2022-05-30 |              1 |
| 2022-06-15 |              1 |
| 2022-06-11 |              1 |
+------------+----------------+
10 rows in set (0.00 sec)

mysql> SELECT Department, SUM(OrderQty) FROM Orders GROUP BY Department;
+--------------------+---------------+
| Department         | SUM(OrderQty) |
+--------------------+---------------+
| Lawn Care          |            58 |
| Decking            |           850 |
| Compost and Stones |            55 |
| Trees and Shrubs   |            55 |
| Garden Decor       |             6 |
+--------------------+---------------+
5 rows in set (0.00 sec)

mysql> SELECT OrderDate,COUNT(OrderID) FROM Orders GROUP BY OrderDate HAVING OrderDate BETWEEN '2022-06-01' AND '2022-06-30';
+------------+----------------+
| OrderDate  | COUNT(OrderID) |
+------------+----------------+
| 2022-06-01 |              1 |
| 2022-06-10 |              7 |
| 2022-06-25 |              6 |
| 2022-06-15 |              1 |
| 2022-06-11 |              1 |
+------------+----------------+
5 rows in set (0.00 sec)

mysql> */