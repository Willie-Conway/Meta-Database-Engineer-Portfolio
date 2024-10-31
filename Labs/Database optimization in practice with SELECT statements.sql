/*coder@81ce08e24181:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE LuckyShrubDB;
Query OK, 1 row affected (0.02 sec)

mysql> USE LuckyShrubDB;
Database changed
mysql> CREATE TABLE Clients (
    ->     ClientID INT AUTO_INCREMENT PRIMARY KEY,
    ->     FullName VARCHAR(100) NOT NULL,
    ->     ContactNumber VARCHAR(15) NOT NULL
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> INSERT INTO Clients (FullName, ContactNumber) VALUES
    -> ('Jane Delgado', '123-456-7890'),
    -> ('John Smith', '234-567-8901'),
    -> ('Emily Davis', '345-678-9012'),
    -> ('Michael Brown', '456-789-0123'),
    -> ('Sarah Wilson', '567-890-1234'),
    -> ('David Johnson', '678-901-2345'),
    -> ('Laura Martinez', '789-012-3456'),
    -> ('James Lee', '890-123-4567'),
    -> ('Maria Garcia', '901-234-5678'),
    -> ('William Anderson', '012-345-6789');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> EXPLAIN SELECT ContactNumber FROM Clients WHERE FullName = 'Jane Delgado';
+----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table   | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | Clients | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   10 |    10.00 | Using where |
+----+-------------+---------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

mysql> CREATE INDEX IdxFullName ON Clients(FullName);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> EXPLAIN SELECT ContactNumber FROM Clients WHERE FullName = 'Jane Delgado';
+----+-------------+---------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
| id | select_type | table   | partitions | type | possible_keys | key         | key_len | ref   | rows | filtered | Extra |
+----+-------------+---------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | Clients | NULL       | ref  | IdxFullName   | IdxFullName | 402     | const |    1 |   100.00 | NULL  |
+----+-------------+---------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> SELECT ContactNumber FROM Clients WHERE FullName = 'Jane Delgado';
+---------------+
| ContactNumber |
+---------------+
| 123-456-7890  |
+---------------+
1 row in set (0.00 sec)

mysql> */