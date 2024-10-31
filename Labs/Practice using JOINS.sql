/*coder@46308a70fdef:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE little_lemon;
Query OK, 1 row affected (0.02 sec)

mysql> USE little_lemon;
Database changed
mysql> CREATE TABLE Customers (
    ->     CustomerID INT NOT NULL PRIMARY KEY,   
    ->     FullName VARCHAR(100) NOT NULL,    
    ->     PhoneNumber BIGINT NOT NULL UNIQUE
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> INSERT INTO Customers (CustomerID, FullName, PhoneNumber) VALUES 
    -> (1, 'Vanessa McCarthy', 0757536378), 
    -> (2, 'Marcos Romero', 0757536379), 
    -> (3, 'Hiroki Yamane', 0757536376), 
    -> (4, 'Anna Iversen', 0757536375), 
    -> (5, 'Diana Pinto', 0757536374);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Bookings (
    ->     BookingID INT NOT NULL PRIMARY KEY,  
    ->     BookingDate DATE NOT NULL,  
    ->     TableNumber INT NOT NULL,   
    ->     NumberOfGuests INT NOT NULL CHECK (NumberOfGuests <= 8),  
    ->     CustomerID INT NOT NULL,  
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES 
    -> (10, '2021-11-11', 7, 5, 1), 
    -> (11, '2021-11-10', 5, 2, 2), 
    -> (12, '2021-11-10', 3, 2, 4);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Customers;
+------------+------------------+-------------+
| CustomerID | FullName         | PhoneNumber |
+------------+------------------+-------------+
|          1 | Vanessa McCarthy |   757536378 |
|          2 | Marcos Romero    |   757536379 |
|          3 | Hiroki Yamane    |   757536376 |
|          4 | Anna Iversen     |   757536375 |
|          5 | Diana Pinto      |   757536374 |
+------------+------------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Bookings;
+-----------+-------------+-------------+----------------+------------+
| BookingID | BookingDate | TableNumber | NumberOfGuests | CustomerID |
+-----------+-------------+-------------+----------------+------------+
|        10 | 2021-11-11  |           7 |              5 |          1 |
|        11 | 2021-11-10  |           5 |              2 |          2 |
|        12 | 2021-11-10  |           3 |              2 |          4 |
+-----------+-------------+-------------+----------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT 
    ->     Customers.FullName, 
    ->     Customers.PhoneNumber, 
    ->     Bookings.BookingDate, 
    ->     Bookings.NumberOfGuests
    -> FROM 
    ->     Customers
    -> INNER JOIN 
    ->     Bookings
    -> ON 
    ->     Customers.CustomerID = Bookings.CustomerID;
+------------------+-------------+-------------+----------------+
| FullName         | PhoneNumber | BookingDate | NumberOfGuests |
+------------------+-------------+-------------+----------------+
| Vanessa McCarthy |   757536378 | 2021-11-11  |              5 |
| Marcos Romero    |   757536379 | 2021-11-10  |              2 |
| Anna Iversen     |   757536375 | 2021-11-10  |              2 |
+------------------+-------------+-------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT 
    ->     Customers.CustomerID, 
    ->     Bookings.BookingID
    -> FROM 
    ->     Customers
    -> LEFT JOIN 
    ->     Bookings
    -> ON 
    ->     Customers.CustomerID = Bookings.CustomerID;
+------------+-----------+
| CustomerID | BookingID |
+------------+-----------+
|          5 |      NULL |
|          4 |        12 |
|          3 |      NULL |
|          1 |        10 |
|          2 |        11 |
+------------+-----------+
5 rows in set (0.00 sec)

mysql> 

mysql> SELECT Customers.FullName, Customers.PhoneNumber, Bookings.BookingDate, Bookings.NumberOfGuests 
    -> FROM Customers INNER JOIN Bookings 
    -> ON Customers.CustomerID = Bookings.CustomerID;
+------------------+-------------+-------------+----------------+
| FullName         | PhoneNumber | BookingDate | NumberOfGuests |
+------------------+-------------+-------------+----------------+
| Vanessa McCarthy |   757536378 | 2021-11-11  |              5 |
| Marcos Romero    |   757536379 | 2021-11-10  |              2 |
| Anna Iversen     |   757536375 | 2021-11-10  |              2 |
+------------------+-------------+-------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT Customers.CustomerID, Bookings.BookingID 
    -> FROM Customers LEFT JOIN Bookings 
    -> ON Customers.CustomerID = Bookings.CustomerID;
+------------+-----------+
| CustomerID | BookingID |
+------------+-----------+
|          5 |      NULL |
|          4 |        12 |
|          3 |      NULL |
|          1 |        10 |
|          2 |        11 |
+------------+-----------+
5 rows in set (0.00 sec)

mysql> 
*/