/*coder@fed716eb68e6:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Mangata_Gallo;
Query OK, 1 row affected (0.02 sec)

mysql> USE Mangata_Gallo;
Database changed
mysql> CREATE TABLE Staff (
    ->     StaffID INT,
    ->     FullName VARCHAR(100),
    ->     PhoneNumber VARCHAR(10)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> ALTER TABLE Staff
    ->     MODIFY StaffID INT NOT NULL PRIMARY KEY,
    ->     MODIFY FullName VARCHAR(100) NOT NULL,
    ->     MODIFY PhoneNumber VARCHAR(10) NOT NULL;
Query OK, 0 rows affected (0.29 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Staff
    ->     ADD Role VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Staff
    ->     DROP COLUMN PhoneNumber;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW TABLES;
+-------------------------+
| Tables_in_Mangata_Gallo |
+-------------------------+
| Staff                   |
+-------------------------+
1 row in set (0.00 sec)


mysql> DESCRIBE Staff;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| StaffID  | int          | NO   | PRI | NULL    |       |
| FullName | varchar(100) | NO   |     | NULL    |       |
| Role     | varchar(50)  | NO   |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM Staff;
+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| StaffID  | int          | NO   | PRI | NULL    |       |
| FullName | varchar(100) | NO   |     | NULL    |       |
| Role     | varchar(50)  | NO   |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> */