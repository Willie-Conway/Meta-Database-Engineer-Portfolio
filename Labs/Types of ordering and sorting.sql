/*coder@83c16e09789b:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE SampleDB;
Query OK, 1 row affected (0.01 sec)

mysql> USE SampleDB;
Database changed
mysql> CREATE TABLE customers (
    ->     CustomerId INT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Company VARCHAR(50),
    ->     Address VARCHAR(100),
    ->     City VARCHAR(50),
    ->     State VARCHAR(50),
    ->     Country VARCHAR(50),
    ->     PostalCode VARCHAR(20),
    ->     Phone VARCHAR(20),
    ->     Fax VARCHAR(20),
    ->     Email VARCHAR(100),
    ->     SupportRepId INT
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> CREATE TABLE invoices (
    ->     InvoiceId INT PRIMARY KEY,
    ->     CustomerId INT,
    ->     InvoiceDate DATE,
    ->     BillingCity VARCHAR(50),
    ->     FOREIGN KEY (CustomerId) REFERENCES customers(CustomerId)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> INSERT INTO customers (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId)
    -> VALUES
    -> (1, 'John', 'Doe', 'Company A', '123 Main St', 'New York', 'NY', 'USA', '10001', '+1 123 456 7890', NULL, 'john.doe@example.com', 1),
    -> (2, 'Jane', 'Smith', 'Company B', '456 Elm St', 'Los Angeles', 'CA', 'USA', '90001', '+1 234 567 8901', NULL, 'jane.smith@example.com', 2);
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO invoices (InvoiceId, CustomerId, InvoiceDate, BillingCity)
    -> VALUES
    -> (1, 1, '2024-01-15', 'New York'),
    -> (2, 2, '2024-02-10', 'Los Angeles');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM customers ORDER BY CustomerId DESC;
+------------+-----------+----------+-----------+-------------+-------------+-------+---------+------------+-----------------+------+------------------------+--------------+
| CustomerId | FirstName | LastName | Company   | Address     | City        | State | Country | PostalCode | Phone           | Fax  | Email                  | SupportRepId |
+------------+-----------+----------+-----------+-------------+-------------+-------+---------+------------+-----------------+------+------------------------+--------------+
|          2 | Jane      | Smith    | Company B | 456 Elm St  | Los Angeles | CA    | USA     | 90001      | +1 234 567 8901 | NULL | jane.smith@example.com |            2 |
|          1 | John      | Doe      | Company A | 123 Main St | New York    | NY    | USA     | 10001      | +1 123 456 7890 | NULL | john.doe@example.com   |            1 |
+------------+-----------+----------+-----------+-------------+-------------+-------+---------+------------+-----------------+------+------------------------+--------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM invoices ORDER BY InvoiceDate;
+-----------+------------+-------------+-------------+
| InvoiceId | CustomerId | InvoiceDate | BillingCity |
+-----------+------------+-------------+-------------+
|         1 |          1 | 2024-01-15  | New York    |
|         2 |          2 | 2024-02-10  | Los Angeles |
+-----------+------------+-------------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM invoices ORDER BY BillingCity ASC, InvoiceDate DESC;
+-----------+------------+-------------+-------------+
| InvoiceId | CustomerId | InvoiceDate | BillingCity |
+-----------+------------+-------------+-------------+
|         2 |          2 | 2024-02-10  | Los Angeles |
|         1 |          1 | 2024-01-15  | New York    |
+-----------+------------+-------------+-------------+
2 rows in set (0.00 sec)

mysql> */