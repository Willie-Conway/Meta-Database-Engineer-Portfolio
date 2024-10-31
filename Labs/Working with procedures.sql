/*coder@5ec84c3a017b:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Lucky_Shrub;
Query OK, 1 row affected (0.02 sec)

mysql> USE Lucky_Shrub;
Database changed
mysql> CREATE TABLE Orders (
    ->     OrderID INT,
    ->     ClientID VARCHAR(10),
    ->     ProductID VARCHAR(10),
    ->     Quantity INT,
    ->     Cost DECIMAL(6, 2)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES
    -> (1, 'Cl1', 'P1', 10, 500),
    -> (2, 'Cl2', 'P2', 5, 100),
    -> (3, 'Cl3', 'P3', 20, 800),
    -> (4, 'Cl4', 'P4', 15, 150),
    -> (5, 'Cl3', 'P3', 10, 450),
    -> (6, 'Cl2', 'P2', 5, 800),
    -> (7, 'Cl1', 'P4', 22, 1200),
    -> (8, 'Cl1', 'P1', 15, 150);
Query OK, 8 rows affected (0.03 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetOrdersData()
    -> BEGIN
    ->     SELECT * FROM Orders;
    -> END //
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> DELIMITER ;
mysql> CALL GetOrdersData();
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
|       8 | Cl1      | P1        |       15 |  150.00 |
+---------+----------+-----------+----------+---------+
8 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetListOfOrdersInRange(IN MinimumValue DECIMAL(6, 2), IN MaximumValue DECIMAL(6, 2))
    -> BEGIN
    ->     SELECT * FROM Orders
    ->     WHERE Cost BETWEEN MinimumValue AND MaximumValue;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELIMITER ;
mysql> CALL GetListOfOrdersInRange(150, 600);
+---------+----------+-----------+----------+--------+
| OrderID | ClientID | ProductID | Quantity | Cost   |
+---------+----------+-----------+----------+--------+
|       1 | Cl1      | P1        |       10 | 500.00 |
|       4 | Cl4      | P4        |       15 | 150.00 |
|       5 | Cl3      | P3        |       10 | 450.00 |
|       8 | Cl1      | P1        |       15 | 150.00 |
+---------+----------+-----------+----------+--------+
4 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> */