/*coder@b00dd9a27d22:~/project$ mysql
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
    ->     OrderID INT NOT NULL PRIMARY KEY,
    ->     ClientID VARCHAR(10),
    ->     ProductID VARCHAR(10),
    ->     Quantity INT,
    ->     Cost DECIMAL(6,2)
    -> );
Query OK, 0 rows affected (0.14 sec)

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

mysql> REPLACE INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES 
    -> (9, 'Cl1', 'P1', 10, 5000), 
    -> (10, 'Cl2', 'P2', 5, 100);
Query OK, 2 rows affected (0.00 sec)
Records: 2  Duplicates: 0  Warnings: 0

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
|       8 | Cl1      | P1        |       15 |  150.00 |
|       9 | Cl1      | P1        |       10 | 5000.00 |
|      10 | Cl2      | P2        |        5 |  100.00 |
+---------+----------+-----------+----------+---------+
10 rows in set (0.00 sec)

mysql> REPLACE INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES 
    -> (9, 'Cl1', 'P1', 10, 500);
Query OK, 2 rows affected (0.00 sec)

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
|       8 | Cl1      | P1        |       15 |  150.00 |
|       9 | Cl1      | P1        |       10 |  500.00 |
|      10 | Cl2      | P2        |        5 |  100.00 |
+---------+----------+-----------+----------+---------+
10 rows in set (0.00 sec)

mysql> */


/*coder@ca2f689ece00:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| Lucky_Shrub        |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> USE Lucky_Shrub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW tables;
+-----------------------+
| Tables_in_Lucky_Shrub |
+-----------------------+
| Orders                |
+-----------------------+
1 row in set (0.00 sec)

mysql> REPLACE INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES (9, "Cl1", "P1", 10, 5000), (10, "Cl2", "P2", 5, 100);
Query OK, 3 rows affected (0.03 sec)
Records: 2  Duplicates: 1  Warnings: 0

mysql> REPLACE INTO Orders SET OrderID = 9, ClientID = "Cl1", ProductID = "P1", Quantity = 10, Cost = 500;
Query OK, 2 rows affected (0.01 sec)

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
|       8 | Cl1      | P1        |       15 |  150.00 |
|       9 | Cl1      | P1        |       10 |  500.00 |
|      10 | Cl2      | P2        |        5 |  100.00 |
+---------+----------+-----------+----------+---------+
10 rows in set (0.00 sec)

mysql> */