/*coder@6f661333194b:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Lucky_Shrub;
Query OK, 1 row affected (0.03 sec)

mysql> USE Lucky_Shrub;
Database changed
mysql> CREATE TABLE Orders (
    ->     OrderID INT NOT NULL PRIMARY KEY,
    ->     ClientID VARCHAR(10),
    ->     ProductID VARCHAR(10),
    ->     Quantity INT,
    ->     Cost DECIMAL(6, 2)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) 
    -> VALUES 
    ->     (1, "Cl1", "P1", 10, 500), 
    ->     (2, "Cl2", "P2", 5, 100), 
    ->     (3, "Cl3", "P3", 20, 800), 
    ->     (4, "Cl4", "P4", 15, 150), 
    ->     (5, "Cl3", "P3", 10, 450), 
    ->     (6, "Cl2", "P2", 5, 800), 
    ->     (7, "Cl1", "P4", 22, 1200), 
    ->     (8, "Cl1", "P1", 15, 150);
Query OK, 8 rows affected (0.03 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> CREATE VIEW OrdersView AS
    -> SELECT OrderID, Quantity, Cost
    -> FROM Orders;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM OrdersView;
+---------+----------+---------+
| OrderID | Quantity | Cost    |
+---------+----------+---------+
|       1 |       10 |  500.00 |
|       2 |        5 |  100.00 |
|       3 |       20 |  800.00 |
|       4 |       15 |  150.00 |
|       5 |       10 |  450.00 |
|       6 |        5 |  800.00 |
|       7 |       22 | 1200.00 |
|       8 |       15 |  150.00 |
+---------+----------+---------+
8 rows in set (0.00 sec)

mysql> UPDATE Orders
    -> SET Cost = 200
    -> WHERE OrderID = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM OrdersView;
+---------+----------+---------+
| OrderID | Quantity | Cost    |
+---------+----------+---------+
|       1 |       10 |  500.00 |
|       2 |        5 |  200.00 |
|       3 |       20 |  800.00 |
|       4 |       15 |  150.00 |
|       5 |       10 |  450.00 |
|       6 |        5 |  800.00 |
|       7 |       22 | 1200.00 |
|       8 |       15 |  150.00 |
+---------+----------+---------+
8 rows in set (0.00 sec)

mysql> RENAME VIEW OrdersView TO ClientsOrdersView;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VIEW OrdersView TO ClientsOrdersView' at line 1
mysql> CREATE VIEW ClientsOrdersView AS
    -> SELECT OrderID, Quantity, Cost
    -> FROM Orders;
Query OK, 0 rows affected (0.02 sec)

mysql> DROP VIEW OrdersView;
Query OK, 0 rows affected (0.02 sec)

mysql> DROP VIEW ClientsOrdersView;
Query OK, 0 rows affected (0.01 sec)

mysql> */