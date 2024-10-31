/*coder@41b8ce24e1e3:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE football_club;
Query OK, 1 row affected (0.02 sec)

mysql> USE football_club;
Database changed
mysql> CREATE TABLE players (
    ->     playerID INT,
    ->     playerName VARCHAR(50),
    ->     age INT
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> SHOW tables;
+-------------------------+
| Tables_in_football_club |
+-------------------------+
| players                 |
+-------------------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE games (
    ->     gameID INT,
    ->     gameDate DATE,
    ->     score INT
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> */