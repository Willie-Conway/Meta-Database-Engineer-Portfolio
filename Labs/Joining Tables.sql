/*coder@e8b26ae49a6d:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS Little_Lemon;
ttle_Lemon;
Query OK, 1 row affected (0.02 sec)

mysql> USE Little_Lemon;
Database changed
mysql> CREATE TABLE Customers (
    ->     CustomerID INT NOT NULL PRIMARY KEY,
    ->     FullName VARCHAR(100),
    ->     PhoneNumber VARCHAR(15)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE Bookings (
    ->     BookingID INT NOT NULL PRIMARY KEY,
    ->     BookingDate DATE,
    ->     TableNumber INT,
    ->     NumberOfGuests INT,
    ->     CustomerID INT,
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> INSERT INTO Customers (CustomerID, FullName, PhoneNumber) VALUES
    -> (1, 'Alice Johnson', '555-1234'),
    -> (2, 'Bob Smith', '555-5678'),
    -> (3, 'Charlie Brown', '555-8765'),
    -> (4, 'Diana Prince', '555-4321');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES
    -> (1, '2024-09-01', 5, 4, 1),
    -> (2, '2024-09-02', 8, 2, 1),
    -> (3, '2024-09-03', 12, 3, 2),
    -> (4, '2024-09-04', 3, 5, 3),
    -> (5, '2024-09-05', 7, 2, NULL); -- Booking without a customer
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT Customers.FullName, Bookings.BookingID
    -> FROM Customers
    -> INNER JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID;
+---------------+-----------+
| FullName      | BookingID |
+---------------+-----------+
| Alice Johnson |         1 |
| Alice Johnson |         2 |
| Bob Smith     |         3 |
| Charlie Brown |         4 |
+---------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT Customers.FullName, Bookings.BookingID
    -> FROM Customers
    -> LEFT JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID;
+---------------+-----------+
| FullName      | BookingID |
+---------------+-----------+
| Alice Johnson |         1 |
| Alice Johnson |         2 |
| Bob Smith     |         3 |
| Charlie Brown |         4 |
| Diana Prince  |      NULL |
+---------------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT Customers.FullName, Bookings.BookingID
    -> FROM Customers
    -> RIGHT JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID;
+---------------+-----------+
| FullName      | BookingID |
+---------------+-----------+
| NULL          |         5 |
| Alice Johnson |         1 |
| Alice Johnson |         2 |
| Bob Smith     |         3 |
| Charlie Brown |         4 |
+---------------+-----------+
5 rows in set (0.00 sec)

mysql> SELECT b1.BookingID AS Booking1, b2.BookingID AS Booking2, b1.BookingDate
    -> FROM Bookings b1
    -> INNER JOIN Bookings b2
    -> ON b1.BookingDate = b2.BookingDate AND b1.TableNumber = b2.TableNumber AND b1.BookingID <> b2.BookingID;
Empty set (0.00 sec)

mysql> SELECT * FROM Bookings;
+-----------+-------------+-------------+----------------+------------+
| BookingID | BookingDate | TableNumber | NumberOfGuests | CustomerID |
+-----------+-------------+-------------+----------------+------------+
|         1 | 2024-09-01  |           5 |              4 |          1 |
|         2 | 2024-09-02  |           8 |              2 |          1 |
|         3 | 2024-09-03  |          12 |              3 |          2 |
|         4 | 2024-09-04  |           3 |              5 |          3 |
|         5 | 2024-09-05  |           7 |              2 |       NULL |
+-----------+-------------+-------------+----------------+------------+
5 rows in set (0.00 sec)

mysql> -- Insert additional sample data with duplicate dates and table numbers
mysql> INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES
    -> (6, '2024-09-06', 5, 4, 2),
    -> (7, '2024-09-06', 5, 2, 4);  -- Same date and table number as Booking 6
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT b1.BookingID AS Booking1, b2.BookingID AS Booking2, b1.BookingDate
    -> FROM Bookings b1
    -> INNER JOIN Bookings b2
    -> ON b1.BookingDate = b2.BookingDate 
    ->    AND b1.TableNumber = b2.TableNumber 
    ->    AND b1.BookingID <> b2.BookingID;
+----------+----------+-------------+
| Booking1 | Booking2 | BookingDate |
+----------+----------+-------------+
|        7 |        6 | 2024-09-06  |
|        6 |        7 | 2024-09-06  |
+----------+----------+-------------+
2 rows in set (0.00 sec)

mysql> */