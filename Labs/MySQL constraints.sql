/*coder@225c4aeb0c91:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS Mangata_Gallo;
Query OK, 1 row affected, 1 warning (0.00 sec)

mysql> USE Mangata_Gallo;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> CREATE TABLE IF NOT EXISTS Staff (
    ->     StaffID INT NOT NULL,
    ->     FullName VARCHAR(100) NOT NULL,
    ->     PhoneNumber INT NOT NULL UNIQUE,
    ->     PRIMARY KEY (StaffID)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> CREATE TABLE IF NOT EXISTS ContractInfo (
    ->     ContractID INT NOT NULL,
    ->     StaffID INT NOT NULL,
    ->     Salary DECIMAL(7,2) NOT NULL,
    ->     Location VARCHAR(50) NOT NULL DEFAULT 'Texas',
    ->     StaffType VARCHAR(20) NOT NULL CHECK (StaffType IN ('Junior', 'Senior')),
    ->     PRIMARY KEY (ContractID)
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> ALTER TABLE ContractInfo
    -> ADD CONSTRAINT FK_Staff
    -> FOREIGN KEY (StaffID) REFERENCES Staff(StaffID);
Query OK, 0 rows affected (0.34 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS FROM Staff;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| StaffID     | int          | NO   | PRI | NULL    |       |
| FullName    | varchar(100) | NO   |     | NULL    |       |
| PhoneNumber | int          | NO   | UNI | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> SHOW COLUMNS FROM ContractInfo;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| ContractID | int          | NO   | PRI | NULL    |       |
| StaffID    | int          | NO   | MUL | NULL    |       |
| Salary     | decimal(7,2) | NO   |     | NULL    |       |
| Location   | varchar(50)  | NO   |     | Texas   |       |
| StaffType  | varchar(20)  | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> SHOW TABLES;
+-------------------------+
| Tables_in_Mangata_Gallo |
+-------------------------+
| Clients                 |
| ContractInfo            |
| Items                   |
| Orders                  |
| Staff                   |
+-------------------------+
5 rows in set (0.01 sec)

mysql>  */