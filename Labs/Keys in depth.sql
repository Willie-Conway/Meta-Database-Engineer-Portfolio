/*
Creating and Managing Keys in SQL


coder@c67d8b140408:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE automobile;
Query OK, 1 row affected (0.02 sec)

mysql> USE automobile;
Database changed
mysql> CREATE TABLE vehicle (
    ->     vehicleID VARCHAR(10),
    ->     ownerID VARCHAR(10),
    ->     plateNumber VARCHAR(10),
    ->     phoneNumber VARCHAR(15),
    ->     PRIMARY KEY (vehicleID)
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE TABLE Owner (
    ->     ownerID VARCHAR(10),
    ->     ownerName VARCHAR(50),
    ->     ownerAddress VARCHAR(255),
    ->     PRIMARY KEY (ownerID)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> ALTER TABLE vehicle 
    -> ADD FOREIGN KEY (ownerID) REFERENCES Owner(ownerID);
Query OK, 0 rows affected (0.37 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW COLUMNS FROM vehicle;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| vehicleID   | varchar(10) | NO   | PRI | NULL    |       |
| ownerID     | varchar(10) | YES  | MUL | NULL    |       |
| plateNumber | varchar(10) | YES  |     | NULL    |       |
| phoneNumber | varchar(15) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> SHOW COLUMNS FROM Owner;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| ownerID      | varchar(10)  | NO   | PRI | NULL    |       |
| ownerName    | varchar(50)  | YES  |     | NULL    |       |
| ownerAddress | varchar(255) | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> 





Explanation of Key Types

Primary Key (PRI): Uniquely identifies each 
record in the table (e.g., vehicleID in vehicle 
table).

Unique Key (UNI): Ensures all values in the column 
are unique across the table.

Foreign Key (MUL): Allows the column to have 
duplicate values but enforces a relationship 
with another table’s primary key.

Summary

Primary Keys: vehicleID in the vehicle table and 
ownerID in the Owner table.

Foreign Key: ownerID in the vehicle table, which 
references the ownerID in the Owner table.

This setup ensures referential integrity between 
the vehicle and Owner tables.
*/