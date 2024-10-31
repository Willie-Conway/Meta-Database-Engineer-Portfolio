/*coder@ca2f689ece00:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS little_lemon;
Query OK, 1 row affected (0.02 sec)

mysql> USE little_lemon;
Database changed
mysql> CREATE TABLE Starters (
    ->     StarterName VARCHAR(100) NOT NULL PRIMARY KEY,
    ->     Cost DECIMAL(3,2),
    ->     StarterType VARCHAR(100) DEFAULT 'Mediterranean'
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> REPLACE INTO Starters (StarterName, Cost, StarterType)
    -> VALUES ('Cheese bread', 9.50, 'Indian');
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM Starters WHERE StarterName = 'Cheese bread';
+--------------+------+-------------+
| StarterName  | Cost | StarterType |
+--------------+------+-------------+
| Cheese bread | 9.50 | Indian      |
+--------------+------+-------------+
1 row in set (0.00 sec)

mysql> REPLACE INTO Starters (StarterName, Cost, StarterType)
    -> VALUES ('Cheese bread', 9.75, 'Indian');
Query OK, 2 rows affected (0.01 sec)

mysql> SELECT * FROM Starters WHERE StarterName = 'Cheese bread';
+--------------+------+-------------+
| StarterName  | Cost | StarterType |
+--------------+------+-------------+
| Cheese bread | 9.75 | Indian      |
+--------------+------+-------------+
1 row in set (0.00 sec)

mysql> */