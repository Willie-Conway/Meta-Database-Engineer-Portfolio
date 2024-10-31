/*coder@e01f1cea38ca:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Chinook;
Query OK, 1 row affected (0.02 sec)

mysql> USE Chinook;
Database changed
mysql> CREATE TABLE Employees (
    ->     EmployeeID INT NOT NULL AUTO_INCREMENT,
    ->     FirstName VARCHAR(40) NOT NULL,
    ->     LastName VARCHAR(20) NOT NULL,
    ->     Title VARCHAR(30),
    ->     ReportsTo INT,
    ->     BirthDate DATE,
    ->     HireDate DATE,
    ->     Address VARCHAR(70),
    ->     City VARCHAR(40),
    ->     State VARCHAR(40),
    ->     Country VARCHAR(40),
    ->     PostalCode VARCHAR(10),
    ->     Phone VARCHAR(24),
    ->     Fax VARCHAR(24),
    ->     Email VARCHAR(60) NOT NULL,
    ->     PRIMARY KEY (EmployeeID),
    ->     FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> CREATE TABLE Customers (
    ->     CustomerID INT NOT NULL AUTO_INCREMENT,
    ->     FirstName VARCHAR(40) NOT NULL,
    ->     LastName VARCHAR(20) NOT NULL,
    ->     Company VARCHAR(80),
    ->     Address VARCHAR(70),
    ->     City VARCHAR(40),
    ->     State VARCHAR(40),
    ->     Country VARCHAR(40),
    ->     PostalCode VARCHAR(10),
    ->     Phone VARCHAR(24),
    ->     Fax VARCHAR(24),
    ->     Email VARCHAR(60) NOT NULL,
    ->     SupportRepID INT,
    ->     PRIMARY KEY (CustomerID),
    ->     FOREIGN KEY (SupportRepID) REFERENCES Employees(EmployeeID)
    -> );
Query OK, 0 rows affected (0.18 sec)

mysql> CREATE TABLE Invoices (
    ->     InvoiceID INT NOT NULL AUTO_INCREMENT,
    ->     CustomerID INT,
    ->     InvoiceDate DATETIME NOT NULL,
    ->     BillingAddress VARCHAR(70),
    ->     BillingCity VARCHAR(40),
    ->     BillingState VARCHAR(40),
    ->     BillingCountry VARCHAR(40),
    ->     BillingPostalCode VARCHAR(10),
    ->     Total DECIMAL(10, 2),
    ->     PRIMARY KEY (InvoiceID),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> CREATE TABLE Artists (
    ->     ArtistID INT NOT NULL AUTO_INCREMENT,
    ->     Name VARCHAR(120) NOT NULL,
    ->     PRIMARY KEY (ArtistID)
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE TABLE Albums (
    ->     AlbumID INT NOT NULL AUTO_INCREMENT,
    ->     Title VARCHAR(160) NOT NULL,
    ->     ArtistID INT,
    ->     PRIMARY KEY (AlbumID),
    ->     FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> CREATE TABLE Tracks (
    ->     TrackID INT NOT NULL AUTO_INCREMENT,
    ->     Name VARCHAR(200) NOT NULL,
    ->     AlbumID INT,
    ->     MediaTypeID INT,
    ->     GenreID INT,
    ->     Composer VARCHAR(220),
    ->     Milliseconds INT,
    ->     Bytes INT,
    ->     UnitPrice DECIMAL(10, 2),
    ->     PRIMARY KEY (TrackID),
    ->     FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> CREATE TABLE Location (
    ->     LocationID INT NOT NULL AUTO_INCREMENT,
    ->     City VARCHAR(40),
    ->     Country VARCHAR(40),
    ->     PRIMARY KEY (LocationID)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> ALTER TABLE Artists
    -> ADD LocationID INT,
    -> ADD FOREIGN KEY (LocationID) REFERENCES Location(LocationID);
Query OK, 0 rows affected (0.35 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW table;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SHOW TABLES;
+-------------------+
| Tables_in_Chinook |
+-------------------+
| Albums            |
| Artists           |
| Customers         |
| Employees         |
| Invoices          |
| Location          |
| Tracks            |
+-------------------+
7 rows in set (0.00 sec)*/