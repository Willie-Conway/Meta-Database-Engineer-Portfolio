/*coder@887915d57422:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE cm_devices;
Query OK, 1 row affected (0.02 sec)

mysql> USE cm_devices;
Database changed
mysql> CREATE TABLE invoice (
    ->     customerName VARCHAR(50),
    ->     orderDate DATE,
    ->     quantity INT,
    ->     price DECIMAL(10, 2)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> SHOW TABLES;
+----------------------+
| Tables_in_cm_devices |
+----------------------+
| invoice              |
+----------------------+
1 row in set (0.00 sec)

mysql> SHOW COLUMNS FROM invoice;
+--------------+---------------+------+-----+---------+-------+
| Field        | Type          | Null | Key | Default | Extra |
+--------------+---------------+------+-----+---------+-------+
| customerName | varchar(50)   | YES  |     | NULL    |       |
| orderDate    | date          | YES  |     | NULL    |       |
| quantity     | int           | YES  |     | NULL    |       |
| price        | decimal(10,2) | YES  |     | NULL    |       |
+--------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> CREATE TABLE customer_contact (
    ->     accountNumber INT,
    ->     phoneNumber VARCHAR(15),
    ->     email VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> */