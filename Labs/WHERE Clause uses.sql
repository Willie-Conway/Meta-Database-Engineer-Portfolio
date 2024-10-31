/*coder@83c16e09789b:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE invoice_db;
Query OK, 1 row affected (0.01 sec)

mysql> USE invoice_db;
Database changed
mysql> CREATE TABLE invoices (
    ->     InvoiceId INT PRIMARY KEY,
    ->     CustomerId INT,
    ->     InvoiceDate DATE,
    ->     BillingAddress VARCHAR(255),
    ->     BillingCity VARCHAR(100),
    ->     BillingState VARCHAR(50),
    ->     BillingCountry VARCHAR(50),
    ->     BillingPostalCode VARCHAR(20),
    ->     Total DECIMAL(10, 2)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> INSERT INTO invoices (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES
    -> (1, 1, '2009-01-01', '123 Elm St', 'Springfield', 'IL', 'USA', '62701', 9.99),
    -> (2, 4, '2009-01-02', 'Ullevålsveien 14', 'Oslo', 'None', 'Norway', '0171', 3.96),
    -> (3, 8, '2009-01-03', 'Grétrystraat 63', 'Brussels', 'None', 'Belgium', '1000', 5.94),
    -> (4, 14, '2009-01-06', '8210 111 ST NW', 'Edmonton', 'AB', 'Canada', 'T6G 2C7', 8.91),
    -> (5, 23, '2009-01-11', '69 Salem Street', 'Boston', 'MA', 'USA', '2113', 13.86);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM invoices WHERE Total > 2;
+-----------+------------+-------------+-------------------+-------------+--------------+----------------+-------------------+-------+
| InvoiceId | CustomerId | InvoiceDate | BillingAddress    | BillingCity | BillingState | BillingCountry | BillingPostalCode | Total |
+-----------+------------+-------------+-------------------+-------------+--------------+----------------+-------------------+-------+
|         1 |          1 | 2009-01-01  | 123 Elm St        | Springfield | IL           | USA            | 62701             |  9.99 |
|         2 |          4 | 2009-01-02  | Ullevålsveien 14  | Oslo        | None         | Norway         | 0171              |  3.96 |
|         3 |          8 | 2009-01-03  | Grétrystraat 63   | Brussels    | None         | Belgium        | 1000              |  5.94 |
|         4 |         14 | 2009-01-06  | 8210 111 ST NW    | Edmonton    | AB           | Canada         | T6G 2C7           |  8.91 |
|         5 |         23 | 2009-01-11  | 69 Salem Street   | Boston      | MA           | USA            | 2113              | 13.86 |
+-----------+------------+-------------+-------------------+-------------+--------------+----------------+-------------------+-------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM invoices WHERE Total > 2 AND BillingCountry = 'USA';
+-----------+------------+-------------+-----------------+-------------+--------------+----------------+-------------------+-------+
| InvoiceId | CustomerId | InvoiceDate | BillingAddress  | BillingCity | BillingState | BillingCountry | BillingPostalCode | Total |
+-----------+------------+-------------+-----------------+-------------+--------------+----------------+-------------------+-------+
|         1 |          1 | 2009-01-01  | 123 Elm St      | Springfield | IL           | USA            | 62701             |  9.99 |
|         5 |         23 | 2009-01-11  | 69 Salem Street | Boston      | MA           | USA            | 2113              | 13.86 |
+-----------+------------+-------------+-----------------+-------------+--------------+----------------+-------------------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM invoices WHERE BillingCountry = 'USA' OR BillingCountry = 'France';
+-----------+------------+-------------+-----------------+-------------+--------------+----------------+-------------------+-------+
| InvoiceId | CustomerId | InvoiceDate | BillingAddress  | BillingCity | BillingState | BillingCountry | BillingPostalCode | Total |
+-----------+------------+-------------+-----------------+-------------+--------------+----------------+-------------------+-------+
|         1 |          1 | 2009-01-01  | 123 Elm St      | Springfield | IL           | USA            | 62701             |  9.99 |
|         5 |         23 | 2009-01-11  | 69 Salem Street | Boston      | MA           | USA            | 2113              | 13.86 |
+-----------+------------+-------------+-----------------+-------------+--------------+----------------+-------------------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM invoices WHERE Total > 2 AND (BillingCountry = 'USA' OR BillingCountry = 'France');
+-----------+------------+-------------+-----------------+-------------+--------------+----------------+-------------------+-------+
| InvoiceId | CustomerId | InvoiceDate | BillingAddress  | BillingCity | BillingState | BillingCountry | BillingPostalCode | Total |
+-----------+------------+-------------+-----------------+-------------+--------------+----------------+-------------------+-------+
|         1 |          1 | 2009-01-01  | 123 Elm St      | Springfield | IL           | USA            | 62701             |  9.99 |
|         5 |         23 | 2009-01-11  | 69 Salem Street | Boston      | MA           | USA            | 2113              | 13.86 |
+-----------+------------+-------------+-----------------+-------------+--------------+----------------+-------------------+-------+
2 rows in set (0.00 sec)

mysql> DROP TABLE invoices;
Query OK, 0 rows affected (0.08 sec)

mysql> DROP DATABASE invoice_db;
Query OK, 0 rows affected (0.04 sec)

mysql> */