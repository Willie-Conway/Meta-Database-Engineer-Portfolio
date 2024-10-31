/*coder@f0c4c508c046:~/project$ mysql
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
    ->     OrderID INT NOT NULL,
    ->     ClientID VARCHAR(10) DEFAULT NULL,
    ->     ProductID VARCHAR(10) DEFAULT NULL,
    ->     Quantity INT DEFAULT NULL,
    ->     Cost DECIMAL(6,2) DEFAULT NULL,
    ->     Date DATE DEFAULT NULL,
    ->     PRIMARY KEY (OrderID)
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE TABLE Employees (
    ->     EmployeeID INT DEFAULT NULL,
    ->     FullName VARCHAR(100) DEFAULT NULL,
    ->     Role VARCHAR(50) DEFAULT NULL,
    ->     Department VARCHAR(255) DEFAULT NULL
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date)  
    -> VALUES  
    -> (1, "Cl1", "P1", 10, 500, "2020-09-01"), 
    -> (2, "Cl2", "P2", 5, 100, "2020-09-05"),  
    -> (3, "Cl3", "P3", 20, 800, "2020-09-03"),  
    -> (4, "Cl4", "P4", 15, 150, "2020-09-07"),  
    -> (5, "Cl3", "P3", 10, 450, "2020-09-08"),  
    -> (6, "Cl2", "P2", 5, 800, "2020-09-09"),  
    -> (7, "Cl1", "P4", 22, 1200, "2020-09-10"),  
    -> (8, "Cl3", "P1", 15, 150, "2020-09-10"),  
    -> (9, "Cl1", "P1", 10, 500, "2020-09-12"),  
    -> (10, "Cl2", "P2", 5, 100, "2020-09-13"),  
    -> (11, "Cl1", "P2", 15, 80, "2020-09-12"), 
    -> (12, "Cl1", "P1", 10, 500, "2022-09-01"),  
    -> (13, "Cl2", "P2", 5, 100, "2022-09-05"),  
    -> (14, "Cl3", "P3", 20, 800, "2022-09-03"),  
    -> (15, "Cl4", "P4", 15, 150, "2022-09-07"),  
    -> (16, "Cl3", "P3", 10, 450, "2022-09-08"),  
    -> (17, "Cl2", "P2", 5, 800, "2022-09-09"),  
    -> (18, "Cl1", "P4", 22, 1200, "2022-09-10"),  
    -> (19, "Cl3", "P1", 15, 150, "2022-09-10"),  
    -> (20, "Cl1", "P1", 10, 500, "2022-09-12"),  
    -> (21, "Cl2", "P2", 5, 100, "2022-09-13"),   
    -> (22, "Cl2", "P1", 10, 500, "2021-09-01"),  
    -> (23, "Cl2", "P2", 5, 100, "2021-09-05"),  
    -> (24, "Cl3", "P3", 20, 800, "2021-09-03"),  
    -> (25, "Cl4", "P4", 15, 150, "2021-09-07"),  
    -> (26, "Cl1", "P3", 10, 450, "2021-09-08"),  
    -> (27, "Cl2", "P1", 20, 1000, "2022-09-01"),  
    -> (28, "Cl2", "P2", 10, 200, "2022-09-05"),  
    -> (29, "Cl3", "P3", 20, 800, "2021-09-03");
Query OK, 29 rows affected (0.02 sec)
Records: 29  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Employees (EmployeeID, FullName, Role, Department)  
    -> VALUES    
    -> (1, "Seamus Hogan", "Manager", "Management"),    
    -> (2, "Thomas Eriksson", "Assistant", "Sales"),   
    -> (3, "Simon Tolo", "Executive", "Management"),   
    -> (4, "Francesca Soffia", "Assistant", "Human Resources"),   
    -> (5, "Emily Sierra", "Accountant", "Finance"),    
    -> (6, "Greta Galkina", "Accountant", "Finance"), 
    -> (7, "Maria Carter", "Executive", "Human Resources"), 
    -> (8, "Rick Griffin", "Manager", "Marketing");
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT OrderID, ProductID, Quantity, Date FROM Orders;
+---------+-----------+----------+------------+
| OrderID | ProductID | Quantity | Date       |
+---------+-----------+----------+------------+
|       1 | P1        |       10 | 2020-09-01 |
|       2 | P2        |        5 | 2020-09-05 |
|       3 | P3        |       20 | 2020-09-03 |
|       4 | P4        |       15 | 2020-09-07 |
|       5 | P3        |       10 | 2020-09-08 |
|       6 | P2        |        5 | 2020-09-09 |
|       7 | P4        |       22 | 2020-09-10 |
|       8 | P1        |       15 | 2020-09-10 |
|       9 | P1        |       10 | 2020-09-12 |
|      10 | P2        |        5 | 2020-09-13 |
|      11 | P2        |       15 | 2020-09-12 |
|      12 | P1        |       10 | 2022-09-01 |
|      13 | P2        |        5 | 2022-09-05 |
|      14 | P3        |       20 | 2022-09-03 |
|      15 | P4        |       15 | 2022-09-07 |
|      16 | P3        |       10 | 2022-09-08 |
|      17 | P2        |        5 | 2022-09-09 |
|      18 | P4        |       22 | 2022-09-10 |
|      19 | P1        |       15 | 2022-09-10 |
|      20 | P1        |       10 | 2022-09-12 |
|      21 | P2        |        5 | 2022-09-13 |
|      22 | P1        |       10 | 2021-09-01 |
|      23 | P2        |        5 | 2021-09-05 |
|      24 | P3        |       20 | 2021-09-03 |
|      25 | P4        |       15 | 2021-09-07 |
|      26 | P3        |       10 | 2021-09-08 |
|      27 | P1        |       20 | 2022-09-01 |
|      28 | P2        |       10 | 2022-09-05 |
|      29 | P3        |       20 | 2021-09-03 |
+---------+-----------+----------+------------+
29 rows in set (0.00 sec)

mysql> CREATE INDEX IdxClientID ON Orders(ClientID);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> EXPLAIN SELECT * FROM Orders WHERE ClientID = 'Cl1';
+----+-------------+--------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
| id | select_type | table  | partitions | type | possible_keys | key         | key_len | ref   | rows | filtered | Extra |
+----+-------------+--------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | Orders | NULL       | ref  | IdxClientID   | IdxClientID | 43      | const |    8 |   100.00 | NULL  |
+----+-------------+--------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> ALTER TABLE Employees ADD COLUMN ReverseFullName VARCHAR(100);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE Employees
    -> SET ReverseFullName = REVERSE(FullName);
Query OK, 8 rows affected (0.02 sec)
Rows matched: 8  Changed: 8  Warnings: 0

mysql> CREATE INDEX IdxReverseFullName ON Employees(ReverseFullName);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Employees WHERE ReverseFullName LIKE 'oloT%';
+------------+------------+-----------+------------+-----------------+
| EmployeeID | FullName   | Role      | Department | ReverseFullName |
+------------+------------+-----------+------------+-----------------+
|          3 | Simon Tolo | Executive | Management | oloT nomiS      |
+------------+------------+-----------+------------+-----------------+
1 row in set (0.00 sec)

mysql> SELECT * 
    -> FROM Orders;
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
|      11 | Cl1      | P2        |       15 |   80.00 | 2020-09-12 |
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
+---------+----------+-----------+----------+---------+------------+
29 rows in set (0.00 sec)

mysql> SELECT OrderID, ProductID, Quantity, Date 
    -> FROM Orders;
+---------+-----------+----------+------------+
| OrderID | ProductID | Quantity | Date       |
+---------+-----------+----------+------------+
|       1 | P1        |       10 | 2020-09-01 |
|       2 | P2        |        5 | 2020-09-05 |
|       3 | P3        |       20 | 2020-09-03 |
|       4 | P4        |       15 | 2020-09-07 |
|       5 | P3        |       10 | 2020-09-08 |
|       6 | P2        |        5 | 2020-09-09 |
|       7 | P4        |       22 | 2020-09-10 |
|       8 | P1        |       15 | 2020-09-10 |
|       9 | P1        |       10 | 2020-09-12 |
|      10 | P2        |        5 | 2020-09-13 |
|      11 | P2        |       15 | 2020-09-12 |
|      12 | P1        |       10 | 2022-09-01 |
|      13 | P2        |        5 | 2022-09-05 |
|      14 | P3        |       20 | 2022-09-03 |
|      15 | P4        |       15 | 2022-09-07 |
|      16 | P3        |       10 | 2022-09-08 |
|      17 | P2        |        5 | 2022-09-09 |
|      18 | P4        |       22 | 2022-09-10 |
|      19 | P1        |       15 | 2022-09-10 |
|      20 | P1        |       10 | 2022-09-12 |
|      21 | P2        |        5 | 2022-09-13 |
|      22 | P1        |       10 | 2021-09-01 |
|      23 | P2        |        5 | 2021-09-05 |
|      24 | P3        |       20 | 2021-09-03 |
|      25 | P4        |       15 | 2021-09-07 |
|      26 | P3        |       10 | 2021-09-08 |
|      27 | P1        |       20 | 2022-09-01 |
|      28 | P2        |       10 | 2022-09-05 |
|      29 | P3        |       20 | 2021-09-03 |
+---------+-----------+----------+------------+
29 rows in set (0.00 sec)

mysql> SELECT * 
    -> FROM Orders 
    -> WHERE ClientID='Cl1';
+---------+----------+-----------+----------+---------+------------+
| OrderID | ClientID | ProductID | Quantity | Cost    | Date       |
+---------+----------+-----------+----------+---------+------------+
|       1 | Cl1      | P1        |       10 |  500.00 | 2020-09-01 |
|       7 | Cl1      | P4        |       22 | 1200.00 | 2020-09-10 |
|       9 | Cl1      | P1        |       10 |  500.00 | 2020-09-12 |
|      11 | Cl1      | P2        |       15 |   80.00 | 2020-09-12 |
|      12 | Cl1      | P1        |       10 |  500.00 | 2022-09-01 |
|      18 | Cl1      | P4        |       22 | 1200.00 | 2022-09-10 |
|      20 | Cl1      | P1        |       10 |  500.00 | 2022-09-12 |
|      26 | Cl1      | P3        |       10 |  450.00 | 2021-09-08 |
+---------+----------+-----------+----------+---------+------------+
8 rows in set (0.00 sec)

mysql> EXPLAIN SELECT * 
    -> FROM Orders 
    -> WHERE ClientID='Cl1';
+----+-------------+--------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
| id | select_type | table  | partitions | type | possible_keys | key         | key_len | ref   | rows | filtered | Extra |
+----+-------------+--------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | Orders | NULL       | ref  | IdxClientID   | IdxClientID | 43      | const |    8 |   100.00 | NULL  |
+----+-------------+--------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> SELECT * 
    -> FROM Employees 
    -> WHERE FullName LIKE '%Tolo';
+------------+------------+-----------+------------+-----------------+
| EmployeeID | FullName   | Role      | Department | ReverseFullName |
+------------+------------+-----------+------------+-----------------+
|          3 | Simon Tolo | Executive | Management | oloT nomiS      |
+------------+------------+-----------+------------+-----------------+
1 row in set (0.00 sec)

mysql> */