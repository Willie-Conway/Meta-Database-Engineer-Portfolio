/*coder@6213d172a0fa:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS Lucky_Shrub;
Query OK, 1 row affected (0.03 sec)

mysql> USE Lucky_Shrub;
Database changed
mysql> CREATE TABLE Orders (
    ->     OrderID INT NOT NULL PRIMARY KEY,
    ->     ClientID VARCHAR(10),
    ->     ProductID VARCHAR(10),
    ->     Quantity INT,
    ->     Cost DECIMAL(6,2)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) 
    -> VALUES 
    ->     (1, 'Cl1', 'P1', 10, 500.00),
    ->     (2, 'Cl2', 'P2', 5, 100.00),
    ->     (3, 'Cl3', 'P3', 20, 800.00),
    ->     (4, 'Cl4', 'P4', 15, 150.00),
    ->     (5, 'Cl3', 'P3', 10, 450.00),
    ->     (6, 'Cl2', 'P2', 5, 800.00),
    ->     (7, 'Cl1', 'P4', 22, 1200.00),
    ->     (8, 'Cl3', 'P1', 15, 150.00),
    ->     (9, 'Cl1', 'P1', 10, 500.00),
    ->     (10, 'Cl2', 'P2', 5, 100.00);
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Orders;
+---------+----------+-----------+----------+---------+
| OrderID | ClientID | ProductID | Quantity | Cost    |
+---------+----------+-----------+----------+---------+
|       1 | Cl1      | P1        |       10 |  500.00 |
|       2 | Cl2      | P2        |        5 |  100.00 |
|       3 | Cl3      | P3        |       20 |  800.00 |
|       4 | Cl4      | P4        |       15 |  150.00 |
|       5 | Cl3      | P3        |       10 |  450.00 |
|       6 | Cl2      | P2        |        5 |  800.00 |
|       7 | Cl1      | P4        |       22 | 1200.00 |
|       8 | Cl3      | P1        |       15 |  150.00 |
|       9 | Cl1      | P1        |       10 |  500.00 |
|      10 | Cl2      | P2        |        5 |  100.00 |
+---------+----------+-----------+----------+---------+
10 rows in set (0.00 sec)

mysql> SELECT * 
    -> FROM Orders 
    -> WHERE Cost >= 250;
+---------+----------+-----------+----------+---------+
| OrderID | ClientID | ProductID | Quantity | Cost    |
+---------+----------+-----------+----------+---------+
|       1 | Cl1      | P1        |       10 |  500.00 |
|       3 | Cl3      | P3        |       20 |  800.00 |
|       5 | Cl3      | P3        |       10 |  450.00 |
|       6 | Cl2      | P2        |        5 |  800.00 |
|       7 | Cl1      | P4        |       22 | 1200.00 |
|       9 | Cl1      | P1        |       10 |  500.00 |
+---------+----------+-----------+----------+---------+
6 rows in set (0.00 sec)

mysql> SELECT * 
    -> FROM Orders 
    -> WHERE Cost BETWEEN 50 AND 750;
+---------+----------+-----------+----------+--------+
| OrderID | ClientID | ProductID | Quantity | Cost   |
+---------+----------+-----------+----------+--------+
|       1 | Cl1      | P1        |       10 | 500.00 |
|       2 | Cl2      | P2        |        5 | 100.00 |
|       4 | Cl4      | P4        |       15 | 150.00 |
|       5 | Cl3      | P3        |       10 | 450.00 |
|       8 | Cl3      | P1        |       15 | 150.00 |
|       9 | Cl1      | P1        |       10 | 500.00 |
|      10 | Cl2      | P2        |        5 | 100.00 |
+---------+----------+-----------+----------+--------+
7 rows in set (0.00 sec)

mysql> SELECT * 
    -> FROM Orders 
    -> WHERE ClientID = 'Cl3' AND Cost > 100;
+---------+----------+-----------+----------+--------+
| OrderID | ClientID | ProductID | Quantity | Cost   |
+---------+----------+-----------+----------+--------+
|       3 | Cl3      | P3        |       20 | 800.00 |
|       5 | Cl3      | P3        |       10 | 450.00 |
|       8 | Cl3      | P1        |       15 | 150.00 |
+---------+----------+-----------+----------+--------+
3 rows in set (0.00 sec)

mysql> SELECT * 
    -> FROM Orders 
    -> WHERE (ProductID = 'P1' OR ProductID = 'P2') AND Quantity > 2;
+---------+----------+-----------+----------+--------+
| OrderID | ClientID | ProductID | Quantity | Cost   |
+---------+----------+-----------+----------+--------+
|       1 | Cl1      | P1        |       10 | 500.00 |
|       2 | Cl2      | P2        |        5 | 100.00 |
|       6 | Cl2      | P2        |        5 | 800.00 |
|       8 | Cl3      | P1        |       15 | 150.00 |
|       9 | Cl1      | P1        |       10 | 500.00 |
|      10 | Cl2      | P2        |        5 | 100.00 |
+---------+----------+-----------+----------+--------+
6 rows in set (0.00 sec)

mysql> */
