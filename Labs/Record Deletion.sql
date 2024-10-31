/*coder@69e0b242a94a:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> CREATE DATABASE bookshop;
Query OK, 1 row affected (0.01 sec)

mysql> USE bookshop;
Database changed
mysql> CREATE TABLE customers (
    ->     customerID INT PRIMARY KEY,
    ->     customerName VARCHAR(100),
    ->     customerAddress VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> INSERT INTO customers (customerID, customerName, customerAddress) VALUES
    -> (1, 'Jack', '115 Old street Belfast'),
    -> (2, 'James', '24 Carlson Rd London'),
    -> (4, 'Maria', '5 Fredrik Rd, Bedford'),
    -> (5, 'Jade', '10 Copland Ave Portsmouth'),
    -> (6, 'Yasmine', '15 Fredrik Rd, Bedford'),
    -> (3, 'Jimmy', '110 Copland Ave Portsmouth');
Query OK, 6 rows affected (0.03 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SHOW tables;
+--------------------+
| Tables_in_bookshop |
+--------------------+
| customers          |
+--------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM customers;
+------------+--------------+----------------------------+
| customerID | customerName | customerAddress            |
+------------+--------------+----------------------------+
|          1 | Jack         | 115 Old street Belfast     |
|          2 | James        | 24 Carlson Rd London       |
|          3 | Jimmy        | 110 Copland Ave Portsmouth |
|          4 | Maria        | 5 Fredrik Rd, Bedford      |
|          5 | Jade         | 10 Copland Ave Portsmouth  |
|          6 | Yasmine      | 15 Fredrik Rd, Bedford     |
+------------+--------------+----------------------------+
6 rows in set (0.00 sec)

mysql> DELETE FROM customers WHERE customerID = 3;
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM customers;
+------------+--------------+---------------------------+
| customerID | customerName | customerAddress           |
+------------+--------------+---------------------------+
|          1 | Jack         | 115 Old street Belfast    |
|          2 | James        | 24 Carlson Rd London      |
|          4 | Maria        | 5 Fredrik Rd, Bedford     |
|          5 | Jade         | 10 Copland Ave Portsmouth |
|          6 | Yasmine      | 15 Fredrik Rd, Bedford    |
+------------+--------------+---------------------------+
5 rows in set (0.00 sec)

mysql> */