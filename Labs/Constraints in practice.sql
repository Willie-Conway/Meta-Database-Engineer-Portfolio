/*coder@8d51686cf4e3:~/project$ mysql
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
mysql> CREATE TABLE Customers(CusomerID INT NOT NULL PRIMARY KEY, FullName VARCHAR(100) NOT NULL, PhoneNumber INT NOT NULL UNIQUE);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'NULLPRIMARY KEY, FullName VARCHAR(100) NOT NULL, PhoneNumber INT NOT NULL UNIQUE' at line 1
mysql> CREATE TABLE Customers (
    ->     CustomerID INT NOT NULL PRIMARY KEY,
    ->     FullName VARCHAR(100) NOT NULL,
    ->     PhoneNumber VARCHAR(20) NOT NULL UNIQUE
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> SHOW COLUMNS FROM Customers;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| CustomerID  | int          | NO   | PRI | NULL    |       |
| FullName    | varchar(100) | NO   |     | NULL    |       |
| PhoneNumber | varchar(20)  | NO   | UNI | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> CREATE TABLE Bookings(BookingID INT NOT NULL PRIMARY KEY, BookingDate DATE NOT NULL, TableNumber INT NOT NULL, NumberOfGuests INT NOT NULL CHECK(NumberOfGuests<=8), CustomerID INT NOT NULL, FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATECASCADE);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UPDATECASCADE)' at line 1
mysql> CREATE TABLE Bookings (
    ->     BookingID INT NOT NULL PRIMARY KEY,
    ->     BookingDate DATE NOT NULL,
    ->     TableNumber INT NOT NULL,
    ->     NumberOfGuests INT NOT NULL CHECK (NumberOfGuests <= 8),
    ->     CustomerID INT NOT NULL,
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> SHOW COLUMNS FROM Bookings;+----------------+------+------+-----+---------+-------+| Field          | Type | Null | Key | Default | Extra |+----------------+------+------+-----+---------+-------+
| BookingID      | int  | NO   | PRI | NULL    |       |
| BookingDate    | date | NO   |     | NULL    |       |
| TableNumber    | int  | NO   |     | NULL    |       |
| NumberOfGuests | int  | NO   |     | NULL    |       |
| CustomerID     | int  | NO   | MUL | NULL    |       |
+----------------+------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> */