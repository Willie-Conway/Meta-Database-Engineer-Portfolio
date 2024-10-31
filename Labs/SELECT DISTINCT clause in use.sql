/*coder@550ccea2bdab:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE ExampleDB;
Query OK, 1 row affected (0.01 sec)

mysql> USE ExampleDB;
Database changed
mysql> -- Drop the existing table if it exists
mysql> DROP TABLE IF EXISTS Customer;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> 
mysql> -- Create the table with BillingCountry and BillingZip
mysql> CREATE TABLE Customer (
    ->     CustomerId INT NOT NULL AUTO_INCREMENT,
    ->     FirstName VARCHAR(40) NOT NULL,
    ->     LastName VARCHAR(20) NOT NULL,
    ->     Company VARCHAR(80),
    ->     Address VARCHAR(70),
    ->     City VARCHAR(40),
    ->     State VARCHAR(40),
    ->     BillingCountry VARCHAR(40),  -- Changed column name
    ->     BillingZip VARCHAR(10),       -- Changed column name
    ->     Phone VARCHAR(24),
    ->     Fax VARCHAR(24),
    ->     Email VARCHAR(60) NOT NULL,
    ->     SupportRepId INT,
    ->     PRIMARY KEY (CustomerId)
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> INSERT INTO Customer (FirstName, LastName, Company, Address, City, State, BillingCountry, BillingZip, Phone, Fax, Email, SupportRepId)
    -> VALUES
    -> ('Luís', 'Gonçalves', 'Embraer - Empresa Brasileira de Aeronáutica S.A.', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', '+55 (12) 3923-5566', 'luisg@embraer.com.br', 3),
    -> ('Eduardo', 'Martins', 'Woodstock Discos', 'Rua Dr. Falcão Filho, 155', 'São Paulo', 'SP', 'Brazil', '01007-010', '+55 (11) 3033-5446', '+55 (11) 3033-4564', 'eduardo@woodstock.com.br', 4),
    -> ('Alexandre', 'Rocha', 'Banco do Brasil S.A.', 'Av. Paulista, 2022', 'São Paulo', 'SP', 'Brazil', '01310-200', '+55 (11) 3055-3278', '+55 (11) 3055-8131', 'alero@uol.com.br', 5),
    -> ('Roberto', 'Almeida', 'Riotur', 'Praça Pio X, 119', 'Rio de Janeiro', 'RJ', 'Brazil', '20040-020', '+55 (21) 2271-7000', '+55 (21) 2271-7070', 'roberto.almeida@riotur.gov.br', 3),
    -> ('Mark', 'Philips', 'Telus', '8210 111 ST NW', 'Edmonton', 'AB', 'Canada', 'T6G 2C7', '+1 (780) 434-4554', '+1 (780) 434-5565', 'mphilips12@shaw.ca', 5),
    -> ('Jennifer', 'Peterson', 'Rogers Canada', '700 W Pender Street', 'Vancouver', 'BC', 'Canada', 'V6C 1G8', '+1 (604) 688-2255', '+1 (604) 688-8756', 'jenniferp@rogers.ca', 3);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT DISTINCT BillingCountry
    -> FROM Customer
    -> ORDER BY BillingCountry;
+----------------+
| BillingCountry |
+----------------+
| Brazil         |
| Canada         |
+----------------+
2 rows in set (0.00 sec)

mysql> SELECT DISTINCT City, BillingCountry
    -> FROM Customer
    -> ORDER BY BillingCountry, City;
+-----------------------+----------------+
| City                  | BillingCountry |
+-----------------------+----------------+
| Rio de Janeiro        | Brazil         |
| São José dos Campos   | Brazil         |
| São Paulo             | Brazil         |
| Edmonton              | Canada         |
| Vancouver             | Canada         |
+-----------------------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT COUNT(DISTINCT BillingCountry) AS UniqueBillingCountries
    -> FROM Customer;
+------------------------+
| UniqueBillingCountries |
+------------------------+
|                      2 |
+------------------------+
1 row in set (0.00 sec)

mysql> */