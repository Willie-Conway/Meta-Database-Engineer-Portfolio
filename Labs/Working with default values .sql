/*coder@d73177622cb3:~/project$ mysql
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
mysql> DROP TABLE IF EXISTS address;
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> CREATE TABLE address (
    ->     id INT NOT NULL,
    ->     street VARCHAR(255),
    ->     postcode VARCHAR(10) DEFAULT "HA97DE",
    ->     town VARCHAR(30) DEFAULT "Harrow"
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> SHOW TABLES;
+----------------------+
| Tables_in_cm_devices |
+----------------------+
| address              |
+----------------------+
1 row in set (0.01 sec)

mysql> SHOW COLUMNS FROM address;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id       | int          | NO   |     | NULL    |       |
| street   | varchar(255) | YES  |     | NULL    |       |
| postcode | varchar(10)  | YES  |     | HA97DE  |       |
| town     | varchar(30)  | YES  |     | Harrow  |       |
+----------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> */