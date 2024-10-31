/*coder@e8b26ae49a6d:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS Little_Lemon;
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> USE Little_Lemon;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY,
    ->     FullName VARCHAR(100),
    ->     PhoneNumber VARCHAR(15)
    -> );
ERROR 1050 (42S01): Table 'Customers' already exists
mysql> SHOW TABLES;
+------------------------+
| Tables_in_Little_Lemon |
+------------------------+
| Bookings               |
| Customers              |
+------------------------+
2 rows in set (0.01 sec)

mysql> DESCRIBE Customers;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| CustomerID  | int          | NO   | PRI | NULL    |       |
| FullName    | varchar(100) | YES  |     | NULL    |       |
| PhoneNumber | varchar(15)  | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> SELECT
    ->     c.FullName AS CustomerName,
    ->     b.BookingID AS BookingIdentifier
    -> FROM
    ->     Customers c
    -> INNER JOIN
    ->     Bookings b
    -> ON
    ->     c.CustomerID = b.CustomerID;
+---------------+-------------------+
| CustomerName  | BookingIdentifier |
+---------------+-------------------+
| Alice Johnson |                 1 |
| Alice Johnson |                 2 |
| Bob Smith     |                 3 |
| Bob Smith     |                 6 |
| Charlie Brown |                 4 |
| Diana Prince  |                 7 |
+---------------+-------------------+
6 rows in set (0.00 sec)

mysql> SELECT
    ->     c.FullName AS CustomerName,
    ->     b.BookingID AS BookingIdentifier
    -> FROM
    ->     Customers c
    -> LEFT JOIN
    ->     Bookings b
    -> ON
    ->     c.CustomerID = b.CustomerID;
+---------------+-------------------+
| CustomerName  | BookingIdentifier |
+---------------+-------------------+
| Alice Johnson |                 1 |
| Alice Johnson |                 2 |
| Bob Smith     |                 3 |
| Bob Smith     |                 6 |
| Charlie Brown |                 4 |
| Diana Prince  |                 7 |
+---------------+-------------------+
6 rows in set (0.00 sec)

mysql> SELECT
    ->     b.BookingID AS BookingIdentifier,
    ->     c.FullName AS CustomerName
    -> FROM
    ->     Bookings b
    -> RIGHT JOIN
    ->     Customers c
    -> ON
    ->     c.CustomerID = b.CustomerID;
+-------------------+---------------+
| BookingIdentifier | CustomerName  |
+-------------------+---------------+
|                 1 | Alice Johnson |
|                 2 | Alice Johnson |
|                 3 | Bob Smith     |
|                 6 | Bob Smith     |
|                 4 | Charlie Brown |
|                 7 | Diana Prince  |
+-------------------+---------------+
6 rows in set (0.00 sec)

mysql> SELECT
    ->     b1.BookingID AS Booking1,
    ->     b2.BookingID AS Booking2,
    ->     b1.BookingDate AS BookingDate
    -> FROM
    ->     Bookings b1
    -> INNER JOIN
    ->     Bookings b2
    -> ON
    ->     b1.BookingDate = b2.BookingDate
    ->     AND b1.TableNumber = b2.TableNumber
    ->     AND b1.BookingID <> b2.BookingID;
+----------+----------+-------------+
| Booking1 | Booking2 | BookingDate |
+----------+----------+-------------+
|        7 |        6 | 2024-09-06  |
|        6 |        7 | 2024-09-06  |
+----------+----------+-------------+
2 rows in set (0.00 sec)

mysql> */