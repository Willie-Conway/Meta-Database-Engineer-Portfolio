/*coder@fa133b56c33e:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Little_Lemon;
Query OK, 1 row affected (0.02 sec)

mysql> USE Little_Lemon;
Database changed
mysql> CREATE TABLE Customers (
    ->     CustomerID INT NOT NULL PRIMARY KEY,
    ->     FullName VARCHAR(100) NOT NULL,
    ->     PhoneNumber INT NOT NULL UNIQUE
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> INSERT INTO Customers (CustomerID, FullName, PhoneNumber) VALUES 
    ->     (1, 'Vanessa McCarthy', 0757536378), 
    ->     (2, 'Marcos Romero', 0757536379), 
    ->     (3, 'Hiroki Yamane', 0757536376), 
    ->     (4, 'Anna Iversen', 0757536375),
    ->     (5, 'Diana Pinto', 0757536374),
    ->     (6, 'Altay Ayhan', 0757636378), 
    ->     (7, 'Jane Murphy', 0753536379), 
    ->     (8, 'Laurina Delgado', 0754536376), 
    ->     (9, 'Mike Edwards', 0757236375),
    ->     (10, 'Karl Pederson', 0757936374);
Query OK, 10 rows affected (0.03 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Bookings (
    ->     BookingID INT,   
    ->     BookingDate DATE,   
    ->     TableNumber INT,    
    ->     NumberOfGuests INT,   
    ->     CustomerID INT
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES 
    -> (10, '2021-11-10', 7, 5, 1), 
    -> (11, '2021-11-10', 5, 2, 2), 
    -> (12, '2021-11-10', 3, 2, 4),
    -> (13, '2021-11-11', 2, 5, 5), 
    -> (14, '2021-11-11', 5, 2, 6), 
    -> (15, '2021-11-11', 3, 2, 7),
    -> (16, '2021-11-11', 3, 5, 1), 
    -> (17, '2021-11-12', 5, 2, 2), 
    -> (18, '2021-11-12', 3, 2, 4),
    -> (19, '2021-11-13', 7, 5, 6), 
    -> (20, '2021-11-14', 5, 2, 3), 
    -> (21, '2021-11-14', 3, 2, 4);
Query OK, 12 rows affected (0.02 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Courses (
    ->     CourseName VARCHAR(255) PRIMARY KEY,
    ->     Cost DECIMAL(4,2)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> INSERT INTO Courses (CourseName, Cost) VALUES 
    ->     ('Greek salad', 15.50), 
    ->     ('Bean soup', 12.25), 
    ->     ('Pizza', 15.00), 
    ->     ('Carbonara', 12.50), 
    ->     ('Kabsa', 17.00), 
    ->     ('Shwarma', 11.30);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * 
    -> FROM Bookings 
    -> WHERE BookingDate BETWEEN '2021-11-11' AND '2021-11-13';
+-----------+-------------+-------------+----------------+------------+
| BookingID | BookingDate | TableNumber | NumberOfGuests | CustomerID |
+-----------+-------------+-------------+----------------+------------+
|        13 | 2021-11-11  |           2 |              5 |          5 |
|        14 | 2021-11-11  |           5 |              2 |          6 |
|        15 | 2021-11-11  |           3 |              2 |          7 |
|        16 | 2021-11-11  |           3 |              5 |          1 |
|        17 | 2021-11-12  |           5 |              2 |          2 |
|        18 | 2021-11-12  |           3 |              2 |          4 |
|        19 | 2021-11-13  |           7 |              5 |          6 |
+-----------+-------------+-------------+----------------+------------+
7 rows in set (0.00 sec)

mysql> SELECT c.FullName, b.BookingID 
    -> FROM Customers c
    -> JOIN Bookings b ON c.CustomerID = b.CustomerID
    -> WHERE b.BookingDate = '2021-11-11';
+------------------+-----------+
| FullName         | BookingID |
+------------------+-----------+
| Diana Pinto      |        13 |
| Altay Ayhan      |        14 |
| Jane Murphy      |        15 |
| Vanessa McCarthy |        16 |
+------------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT BookingDate, COUNT(*) AS TotalBookings 
    -> FROM Bookings 
    -> GROUP BY BookingDate;
+-------------+---------------+
| BookingDate | TotalBookings |
+-------------+---------------+
| 2021-11-10  |             3 |
| 2021-11-11  |             4 |
| 2021-11-12  |             2 |
| 2021-11-13  |             1 |
| 2021-11-14  |             2 |
+-------------+---------------+
5 rows in set (0.00 sec)

mysql> UPDATE Courses 
    -> SET Cost = 20.00 
    -> WHERE CourseName = 'Kabsa';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> CREATE TABLE DeliveryAddress (
    ->     ID INT PRIMARY KEY,
    ->     Address VARCHAR(255) NOT NULL,
    ->     Type VARCHAR(50) NOT NULL DEFAULT 'Private',
    ->     CustomerID INT NOT NULL,
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.18 sec)

mysql> ALTER TABLE Courses
    -> ADD Ingredients VARCHAR(255);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT FullName 
    -> FROM Customers 
    -> WHERE CustomerID IN (
    ->     SELECT CustomerID 
    ->     FROM Bookings 
    ->     WHERE BookingDate = '2021-11-11'
    -> );
+------------------+
| FullName         |
+------------------+
| Diana Pinto      |
| Altay Ayhan      |
| Jane Murphy      |
| Vanessa McCarthy |
+------------------+
4 rows in set (0.00 sec)

mysql> CREATE VIEW BookingsView AS
    -> SELECT BookingID, BookingDate, NumberOfGuests
    -> FROM Bookings
    -> WHERE BookingDate < '2021-11-13' AND NumberOfGuests > 3;
o view the data from the virtual table:
SELECT * FROM BookingsView;
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> -- To view the data from the virtual table:
mysql> SELECT * FROM BookingsView;
+-----------+-------------+----------------+
| BookingID | BookingDate | NumberOfGuests |
+-----------+-------------+----------------+
|        10 | 2021-11-10  |              5 |
|        13 | 2021-11-11  |              5 |
|        16 | 2021-11-11  |              5 |
+-----------+-------------+----------------+
3 rows in set (0.00 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetBookingsData(IN InputDate DATE)
    -> BEGIN
    ->     SELECT * 
    ->     FROM Bookings 
    ->     WHERE BookingDate = InputDate;
    -> END //
LIMITER ;

-- To call the stored procedure with '2021-11-13' as the input date:
CALL GetBookingsData('2021-11-13');
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql> DELIMITER ;
mysql> 
mysql> -- To call the stored procedure with '2021-11-13' as the input date:
mysql> CALL GetBookingsData('2021-11-13');
+-----------+-------------+-------------+----------------+------------+
| BookingID | BookingDate | TableNumber | NumberOfGuests | CustomerID |
+-----------+-------------+-------------+----------------+------------+
|        19 | 2021-11-13  |           7 |              5 |          6 |
+-----------+-------------+-------------+----------------+------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> SELECT 
    ->     CONCAT('ID: ', BookingID, ', Date: ', BookingDate, ', Number of guests: ', NumberOfGuests) AS 'Booking Details'
    -> FROM Bookings;
+-----------------------------------------------+
| Booking Details                               |
+-----------------------------------------------+
| ID: 10, Date: 2021-11-10, Number of guests: 5 |
| ID: 11, Date: 2021-11-10, Number of guests: 2 |
| ID: 12, Date: 2021-11-10, Number of guests: 2 |
| ID: 13, Date: 2021-11-11, Number of guests: 5 |
| ID: 14, Date: 2021-11-11, Number of guests: 2 |
| ID: 15, Date: 2021-11-11, Number of guests: 2 |
| ID: 16, Date: 2021-11-11, Number of guests: 5 |
| ID: 17, Date: 2021-11-12, Number of guests: 2 |
| ID: 18, Date: 2021-11-12, Number of guests: 2 |
| ID: 19, Date: 2021-11-13, Number of guests: 5 |
| ID: 20, Date: 2021-11-14, Number of guests: 2 |
| ID: 21, Date: 2021-11-14, Number of guests: 2 |
+-----------------------------------------------+
12 rows in set (0.00 sec)

mysql> SELECT * FROM Customers;
+------------+------------------+-------------+
| CustomerID | FullName         | PhoneNumber |
+------------+------------------+-------------+
|          1 | Vanessa McCarthy |   757536378 |
|          2 | Marcos Romero    |   757536379 |
|          3 | Hiroki Yamane    |   757536376 |
|          4 | Anna Iversen     |   757536375 |
|          5 | Diana Pinto      |   757536374 |
|          6 | Altay Ayhan      |   757636378 |
|          7 | Jane Murphy      |   753536379 |
|          8 | Laurina Delgado  |   754536376 |
|          9 | Mike Edwards     |   757236375 |
|         10 | Karl Pederson    |   757936374 |
+------------+------------------+-------------+
10 rows in set (0.00 sec) 

mysql> */