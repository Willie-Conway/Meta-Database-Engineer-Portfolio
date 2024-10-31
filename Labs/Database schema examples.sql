/*coder@046f5c978c97:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE chinook;
Query OK, 1 row affected (0.02 sec)

mysql> USE chinook;
Database changed
mysql> CREATE TABLE Employees (
    ->     EmployeeID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Title VARCHAR(50),
    ->     ReportsTo INT,
    ->     BirthDate DATE,
    ->     HireDate DATE,
    ->     Address VARCHAR(255),
    ->     FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100),
    ->     Phone VARCHAR(20),
    ->     Address VARCHAR(255),
    ->     City VARCHAR(50),
    ->     Country VARCHAR(50),
    ->     EmployeeID INT,
    ->     FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE Invoices (
    ->     InvoiceID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     InvoiceDate DATE,
    ->     BillingAddress VARCHAR(255),
    ->     Total DECIMAL(10, 2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> CREATE TABLE Artists (
    ->     ArtistID INT PRIMARY KEY,
    ->     Name VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE TABLE Albums (
    ->     AlbumID INT PRIMARY KEY,
    ->     Title VARCHAR(100),
    ->     ArtistID INT,
    ->     FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> CREATE TABLE Tracks (
    ->     TrackID INT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     AlbumID INT,
    ->     MediaTypeID INT,
    ->     GenreID INT,
    ->     Composer VARCHAR(100),
    ->     Milliseconds INT,
    ->     Bytes INT,
    ->     UnitPrice DECIMAL(10, 2),
    ->     FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> CREATE TABLE InvoiceTrack (
    ->     InvoiceID INT,
    ->     TrackID INT,
    ->     PRIMARY KEY (InvoiceID, TrackID),
    ->     FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID),
    ->     FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> CREATE TABLE Location (
    ->     LocationID INT PRIMARY KEY,
    ->     City VARCHAR(100),
    ->     Country VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> ALTER TABLE Artists
    -> ADD LocationID INT,
    -> FOREIGN KEY (LocationID) REFERENCES Location(LocationID);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FOREIGN KEY (LocationID) REFERENCES Location(LocationID)' at line 3
mysql> INSERT INTO Employees (EmployeeID, FirstName, LastName, Title, ReportsTo, BirthDate, HireDate, Address)
    -> VALUES (1, 'John', 'Doe', 'Sales Manager', NULL, '1980-01-15', '2020-03-10', '123 Elm St');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, Country, EmployeeID)
    -> VALUES (1, 'Jane', 'Smith', 'jane.smith@example.com', '555-1234', '456 Oak St', 'London', 'UK', 1); 
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, BillingAddress, Total)
    -> VALUES (1, 1, '2024-09-01', '456 Oak St', 19.99);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Artists (ArtistID, Name)
    -> VALUES (1, 'The Beatles');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Albums (AlbumID, Title, ArtistID)
    -> VALUES (1, 'Abbey Road', 1);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Tracks (TrackID, Name, AlbumID, MediaTypeID, GenreID, Composer, Milliseconds, Bytes, UnitPrice)
    -> VALUES (1, 'Come Together', 1, 1, 1, 'John Lennon', 259000, 9000000, 1.29);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO InvoiceTrack (InvoiceID, TrackID)
    -> VALUES (1, 1);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Location (LocationID, City, Country)
    -> VALUES (1, 'Liverpool', 'UK');
Query OK, 1 row affected (0.01 sec)

mysql> UPDATE Artists
    -> SET LocationID = 1
    -> WHERE ArtistID = 1;
ERROR 1054 (42S22): Unknown column 'LocationID' in 'field list'
mysql> SHOW TABLES;
+-------------------+
| Tables_in_chinook |
+-------------------+
| Albums            |
| Artists           |
| Customers         |
| Employees         |
| InvoiceTrack      |
| Invoices          |
| Location          |
| Tracks            |
+-------------------+
8 rows in set (0.00 sec)

mysql> DESCRIBE Employees;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| EmployeeID | int          | NO   | PRI | NULL    |       |
| FirstName  | varchar(50)  | YES  |     | NULL    |       |
| LastName   | varchar(50)  | YES  |     | NULL    |       |
| Title      | varchar(50)  | YES  |     | NULL    |       |
| ReportsTo  | int          | YES  | MUL | NULL    |       |
| BirthDate  | date         | YES  |     | NULL    |       |
| HireDate   | date         | YES  |     | NULL    |       |
| Address    | varchar(255) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM Customers;
+------------+-----------+----------+------------------------+----------+------------+--------+---------+------------+
| CustomerID | FirstName | LastName | Email                  | Phone    | Address    | City   | Country | EmployeeID |
+------------+-----------+----------+------------------------+----------+------------+--------+---------+------------+
|          1 | Jane      | Smith    | jane.smith@example.com | 555-1234 | 456 Oak St | London | UK      |          1 |
+------------+-----------+----------+------------------------+----------+------------+--------+---------+------------+
1 row in set (0.00 sec)

mysql> 
*/