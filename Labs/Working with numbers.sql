
/*Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE cm_devices;
Query OK, 1 row affected (0.01 sec)

mysql> USE cm_devices;
Database changed
mysql> CREATE TABLE devices(
    ->     deviceID int,
    ->     deviceName varchar(50),
    ->     price decimal(10, 2)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> SHOW TABLES;
+----------------------+
| Tables_in_cm_devices |
+----------------------+
| devices              |
+----------------------+
1 row in set (0.00 sec)

mysql> SHOW COLUMNS FROM devices;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| deviceID   | int           | YES  |     | NULL    |       |
| deviceName | varchar(50)   | YES  |     | NULL    |       |
| price      | decimal(10,2) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE stock(
    ->     deviceID int,
    ->     quantity int,
    ->     totalCost decimal(10, 2)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> */