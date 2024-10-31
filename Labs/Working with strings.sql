
/* coder@2d90e27f81a8:~/project$ mysql
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
mysql> CREATE TABLE customers (
    ->     username CHAR(9),
    ->     fullName VARCHAR(100),
    ->     email VARCHAR(255)
    -> );
Query OK, 0 rows affected (0.18 sec)

mysql> SHOW TABLES;
+----------------------+
| Tables_in_cm_devices |
+----------------------+
| customers            |
+----------------------+
1 row in set (0.00 sec)

mysql> SHOW COLUMNS FROM customers;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| username | char(9)      | YES  |     | NULL    |       |
| fullName | varchar(100) | YES  |     | NULL    |       |
| email    | varchar(255) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> CREATE TABLE feedback (
    ->     feedbackID CHAR(8),
    ->     feedbackType VARCHAR(100),
    ->     comment TEXT
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> SHOW TABLES;
+----------------------+
| Tables_in_cm_devices |
+----------------------+
| customers            |
| feedback             |
+----------------------+
2 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM feedback;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| feedbackID   | char(8)      | YES  |     | NULL    |       |
| feedbackType | varchar(100) | YES  |     | NULL    |       |
| comment      | text         | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> */