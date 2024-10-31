/*coder@a38a3cf3c3ad:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE jewelrystore_db;
db;
Query OK, 1 row affected (0.02 sec)

mysql> USE jewelrystore_db;
Database changed
mysql> CREATE TABLE clients (
    ->     ClientID INT NOT NULL,
    ->     ClientName VARCHAR(255) DEFAULT NULL,
    ->     Address VARCHAR(255) DEFAULT NULL,
    ->     ContactNo VARCHAR(10) DEFAULT NULL,
    ->     PRIMARY KEY (ClientID)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE client_orders (
    ->     OrderID INT NOT NULL,
    ->     ClientID INT DEFAULT NULL,
    ->     ItemID INT DEFAULT NULL,
    ->     Cost INT DEFAULT NULL,
    ->     PRIMARY KEY (OrderID)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> CREATE TABLE item (
    ->     ItemID INT NOT NULL,
    ->     Name VARCHAR(150) DEFAULT NULL,
    ->     Cost INT DEFAULT NULL,
    ->     PRIMARY KEY (ItemID)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> CREATE TABLE mg_orders (
    ->     OrderID INT NOT NULL,
    ->     ItemID INT DEFAULT NULL,
    ->     Quantity INT DEFAULT NULL,
    ->     Cost INT DEFAULT NULL,
    ->     OrderDate DATE DEFAULT NULL,
    ->     DeliveryDate DATE DEFAULT NULL,
    ->     OrderStatus VARCHAR(50) DEFAULT NULL,
    ->     PRIMARY KEY (OrderID)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO clients (ClientID, ClientName, Address, ContactNo) VALUES
    -> (1, 'Kishan Hughes', '223 Golden Hills, North Austin, TX', '387986345'),
    -> (2, 'Indira Moncada', '119 Silver Street, Bouldin Creek, TX', '334567243'),
    -> (3, 'Mosha Setsile', '785 Bronze Lane, East Austin, TX', '315642597'),
    -> (4, 'Laura Mills', '908 Diamond Crescent, South Lamar, TX', '300842509'),
    -> (5, 'Henrik Kreida', '345, Golden Hills, North Austin, TX', '358208983'),
    -> (6, 'Millicent Blou', '812, Diamond Crescent, North Burnet, TX', '347898755');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO item (ItemID, Name, Cost) VALUES
    -> (1, 'Engagement ring', 2500),
    -> (2, 'Silver brooch', 400),
    -> (3, 'Earrings', 350),
    -> (4, 'Luxury watch', 1250),
    -> (5, 'Golden bracelet', 800),
    -> (6, 'Gemstone', 1500);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO client_orders (OrderID, ClientID, ItemID, Cost) VALUES
    -> (1, 1, 1, 2500),
    -> (2, 2, 2, 400),
    -> (3, 3, 3, 350),
    -> (4, 4, 4, 1250),
    -> (5, 5, 5, 800),
    -> (6, 6, 6, 1500),
    -> (7, 2, 4, 400),
    -> (8, 3, 4, 1250),
    -> (9, 4, 2, 400),
    -> (10, 1, 3, 350);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> INSERT INTO mg_orders (OrderID, ItemID, Quantity, Cost, OrderDate, DeliveryDate, OrderStatus) VALUES
    -> (1, 1, 50, 122000, '2022-04-05', '2022-05-25', 'Delivered'),
    -> (2, 2, 75, 28000, '2022-03-08', NULL, 'In progress'),
    -> (3, 3, 80, 25000, '2022-05-19', '2022-06-08', 'Delivered'),
    -> (4, 4, 45, 100000, '2022-01-10', NULL, 'In progress'),
    -> (5, 5, 70, 56000, '2022-05-19', NULL, 'In progress'),
    -> (6, 6, 60, 90000, '2022-06-10', '2022-06-18', 'Delivered');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT ClientID, OrderID, CEIL(Cost - (Cost * 5 / 100)) AS afterDiscount
    -> FROM client_orders
    -> WHERE ItemID = 4;
+----------+---------+---------------+
| ClientID | OrderID | afterDiscount |
+----------+---------+---------------+
|        4 |       4 |          1188 |
|        2 |       7 |           380 |
|        3 |       8 |          1188 |
+----------+---------+---------------+
3 rows in set (0.00 sec)

mysql> SELECT ClientID, OrderID, FORMAT(Cost - (Cost * 5 / 100), 2) AS afterDiscountFormatted
    -> FROM client_orders
    -> WHERE ItemID = 4;
+----------+---------+------------------------+
| ClientID | OrderID | afterDiscountFormatted |
+----------+---------+------------------------+
|        4 |       4 | 1,187.50               |
|        2 |       7 | 380.00                 |
|        3 |       8 | 1,187.50               |
+----------+---------+------------------------+
3 rows in set (0.00 sec)

mysql> SELECT OrderID, ADDDATE(OrderDate, INTERVAL 30 DAY) AS ExpectedDeliveryDate
    -> FROM mg_orders;
+---------+----------------------+
| OrderID | ExpectedDeliveryDate |
+---------+----------------------+
|       1 | 2022-05-05           |
|       2 | 2022-04-07           |
|       3 | 2022-06-18           |
|       4 | 2022-02-09           |
|       5 | 2022-06-18           |
|       6 | 2022-07-10           |
+---------+----------------------+
6 rows in set (0.01 sec)

mysql> SELECT OrderID, ItemID, Quantity, Cost, OrderDate, COALESCE(DeliveryDate, 'NOT DELIVERED') AS DeliveryStatus, OrderStatus
    -> FROM mg_orders;
+---------+--------+----------+--------+------------+----------------+-------------+
| OrderID | ItemID | Quantity | Cost   | OrderDate  | DeliveryStatus | OrderStatus |
+---------+--------+----------+--------+------------+----------------+-------------+
|       1 |      1 |       50 | 122000 | 2022-04-05 | 2022-05-25     | Delivered   |
|       2 |      2 |       75 |  28000 | 2022-03-08 | NOT DELIVERED  | In progress |
|       3 |      3 |       80 |  25000 | 2022-05-19 | 2022-06-08     | Delivered   |
|       4 |      4 |       45 | 100000 | 2022-01-10 | NOT DELIVERED  | In progress |
|       5 |      5 |       70 |  56000 | 2022-05-19 | NOT DELIVERED  | In progress |
|       6 |      6 |       60 |  90000 | 2022-06-10 | 2022-06-18     | Delivered   |
+---------+--------+----------+--------+------------+----------------+-------------+
6 rows in set (0.00 sec)

mysql> SELECT OrderID, ItemID, Quantity, Cost, OrderDate, DeliveryDate, OrderStatus
    -> FROM mg_orders
    -> WHERE NULLIF(DeliveryDate, NULL) IS NULL AND OrderStatus = 'In progress';
+---------+--------+----------+--------+------------+--------------+-------------+
| OrderID | ItemID | Quantity | Cost   | OrderDate  | DeliveryDate | OrderStatus |
+---------+--------+----------+--------+------------+--------------+-------------+
|       2 |      2 |       75 |  28000 | 2022-03-08 | NULL         | In progress |
|       4 |      4 |       45 | 100000 | 2022-01-10 | NULL         | In progress |
|       5 |      5 |       70 |  56000 | 2022-05-19 | NULL         | In progress |
+---------+--------+----------+--------+------------+--------------+-------------+
3 rows in set (0.00 sec)


mysql> SELECT OrderID, NULLIF(OrderStatus,'In Progress') AS status 
    -> FROM mg_orders;
+---------+-----------+
| OrderID | status    |
+---------+-----------+
|       1 | Delivered |
|       2 | NULL      |
|       3 | Delivered |
|       4 | NULL      |
|       5 | NULL      |
|       6 | Delivered |
+---------+-----------+
6 rows in set (0.00 sec)

mysql> */