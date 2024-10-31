/*coder@5400e2a78453:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE bookshop;
Query OK, 1 row affected (0.02 sec)

mysql> USE bookshop;
Database changed
mysql> CREATE TABLE customers (
    ->     customerID INT,
    ->     customerName VARCHAR(50),
    ->     customerAddress VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> INSERT INTO customers (customerID, customerName, customerAddress)
    -> VALUES (1, 'Jack', '115 Old Street Belfast');
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM customers;
+------------+--------------+------------------------+
| customerID | customerName | customerAddress        |
+------------+--------------+------------------------+
|          1 | Jack         | 115 Old Street Belfast |
+------------+--------------+------------------------+
1 row in set (0.00 sec)

mysql> INSERT INTO customers (customerID, customerName, customerAddress)
    -> VALUES (2, 'James', '24 Carlson Road London');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM customers;
+------------+--------------+------------------------+
| customerID | customerName | customerAddress        |
+------------+--------------+------------------------+
|          1 | Jack         | 115 Old Street Belfast |
|          2 | James        | 24 Carlson Road London |
+------------+--------------+------------------------+
2 rows in set (0.00 sec)

mysql> */