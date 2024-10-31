/*coder@f99a6261fc48:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE MyDatabase;
Query OK, 1 row affected (0.01 sec)

mysql> USE MyDatabase;
Database changed
mysql> CREATE TABLE Customers (
    ->     CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    ->     FirstName VARCHAR(50) NOT NULL,
    ->     LastName VARCHAR(50) NOT NULL,
    ->     Email VARCHAR(100),
    ->     DateOfBirth DATE
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO Customers (FirstName, LastName, Email, DateOfBirth)
    -> VALUES ('John', 'Doe', 'john.doe@example.com', '1980-01-15'),
    ->        ('Jane', 'Smith', 'jane.smith@example.com', '1990-07-22');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Customers;
+------------+-----------+----------+------------------------+-------------+
| CustomerID | FirstName | LastName | Email                  | DateOfBirth |
+------------+-----------+----------+------------------------+-------------+
|          1 | John      | Doe      | john.doe@example.com   | 1980-01-15  |
|          2 | Jane      | Smith    | jane.smith@example.com | 1990-07-22  |
+------------+-----------+----------+------------------------+-------------+
2 rows in set (0.00 sec)

mysql> UPDATE Customers
    -> SET Email = 'john.d.newemail@example.com'
    -> WHERE CustomerID = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Customers
    -> WHERE CustomerID = 2;
Query OK, 1 row affected (0.02 sec)

mysql> CREATE VIEW CustomerInfo AS
    -> SELECT FirstName, LastName, Email
    -> FROM Customers;
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT * FROM CustomerInfo;
+-----------+----------+-----------------------------+
| FirstName | LastName | Email                       |
+-----------+----------+-----------------------------+
| John      | Doe      | john.d.newemail@example.com |
+-----------+----------+-----------------------------+
1 row in set (0.00 sec)

mysql> DROP TABLE Customers;
Query OK, 0 rows affected (0.10 sec)

mysql> 
mysql> DROP DATABASE MyDatabase;
Query OK, 1 row affected (0.05 sec)

mysql> */