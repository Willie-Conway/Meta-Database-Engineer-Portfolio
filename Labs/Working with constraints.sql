/*coder@225c4aeb0c91:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Mangata_Gallo;
Query OK, 1 row affected (0.03 sec)

mysql> USE Mangata_Gallo;
Database changed
mysql> CREATE TABLE Clients (
    ->     ClientID INT NOT NULL AUTO_INCREMENT,
    ->     FullName VARCHAR(100) NOT NULL,
    ->     PhoneNumber INT NOT NULL UNIQUE,
    ->     PRIMARY KEY (ClientID)
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> CREATE TABLE Items (
    ->     ItemID INT NOT NULL AUTO_INCREMENT,
    ->     ItemName VARCHAR(100) NOT NULL,
    ->     Price DECIMAL(5,2) NOT NULL,
    ->     PRIMARY KEY (ItemID)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID INT NOT NULL AUTO_INCREMENT,
    ->     ClientID INT NOT NULL,
    ->     ItemID INT NOT NULL,
    ->     Quantity INT NOT NULL CHECK (Quantity <= 3),
    ->     Cost DECIMAL(6,2) NOT NULL,
    ->     PRIMARY KEY (OrderID),
    ->     FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    ->     FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> SHOW TABLES;
+-------------------------+
| Tables_in_Mangata_Gallo |
+-------------------------+
| Clients                 |
| Items                   |
| Orders                  |
+-------------------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE Clients;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| ClientID    | int          | NO   | PRI | NULL    | auto_increment |
| FullName    | varchar(100) | NO   |     | NULL    |                |
| PhoneNumber | int          | NO   | UNI | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> SHOW TABLES;
+-------------------------+
| Tables_in_Mangata_Gallo |
+-------------------------+
| Clients                 |
| Items                   |
| Orders                  |
+-------------------------+
3 rows in set (0.00 sec)

mysql> */