/*coder@3a3c608aa622:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
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
    ->     City VARCHAR(50),
    ->     State VARCHAR(50),
    ->     DOB DATE,
    ->     LoyaltyPoints INT
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> INSERT INTO Clients (FullName, City, State, DOB, LoyaltyPoints) VALUES
    -> ('John Doe', 'Tucson', 'Arizona', '1985-06-15', 150),
    -> ('Jane Smith', 'Phoenix', 'Arizona', '1990-12-01', 200),
    -> ('Emily Johnson', 'Tucson', 'Arizona', '1992-03-23', 180),
    -> ('Michael Brown', 'Scottsdale', 'Arizona', '1988-07-30', 120),
    -> ('Linda Davis', 'Tucson', 'Arizona', '1984-05-25', 220),
    -> ('Sarah Wilson', 'Tempe', 'Arizona', '1987-09-12', 160);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_city ON Clients (City);
Query OK, 0 rows affected (0.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_state ON Clients (State);
Query OK, 0 rows affected (0.20 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_loyalty_points ON Clients (LoyaltyPoints);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_dob ON Clients (DOB);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SHOW INDEX FROM Clients;
+---------+------------+--------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name           | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+--------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Clients |          0 | PRIMARY            |            1 | ClientID      | A         |           6 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| Clients |          1 | idx_city           |            1 | City          | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| Clients |          1 | idx_state          |            1 | State         | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| Clients |          1 | idx_loyalty_points |            1 | LoyaltyPoints | A         |           6 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| Clients |          1 | idx_dob            |            1 | DOB           | A         |           6 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+--------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
5 rows in set (0.05 sec)

mysql> SELECT ClientID, FullName FROM Clients WHERE City = 'Tucson';
+----------+---------------+
| ClientID | FullName      |
+----------+---------------+
|        1 | John Doe      |
|        3 | Emily Johnson |
|        5 | Linda Davis   |
+----------+---------------+
3 rows in set (0.00 sec)

mysql> SELECT ClientID, FullName FROM Clients WHERE State = 'Arizona' AND City <> 'Tucson';
+----------+---------------+
| ClientID | FullName      |
+----------+---------------+
|        2 | Jane Smith    |
|        4 | Michael Brown |
|        6 | Sarah Wilson  |
+----------+---------------+
3 rows in set (0.00 sec)

mysql> SELECT ClientID, FullName FROM Clients WHERE LoyaltyPoints = (SELECT MAX(LoyaltyPoints) FROM Clients);
+----------+-------------+
| ClientID | FullName    |
+----------+-------------+
|        5 | Linda Davis |
+----------+-------------+
1 row in set (0.00 sec)

mysql> SELECT ClientID, FullName FROM Clients WHERE DOB = '1990-01-01';
Empty set (0.00 sec)

mysql> EXPLAIN SELECT ClientID, FullName FROM Clients WHERE City = 'Tucson';
+----+-------------+---------+------------+------+---------------+----------+---------+-------+------+----------+-------+
| id | select_type | table   | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra |
+----+-------------+---------+------------+------+---------------+----------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | Clients | NULL       | ref  | idx_city      | idx_city | 203     | const |    3 |   100.00 | NULL  |
+----+-------------+---------+------------+------+---------------+----------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> EXPLAIN SELECT ClientID, FullName FROM Clients WHERE State = 'Arizona' AND City <> 'Tucson';
+----+-------------+---------+------------+------+--------------------+-----------+---------+-------+------+----------+-------------+
| id | select_type | table   | partitions | type | possible_keys      | key       | key_len | ref   | rows | filtered | Extra       |
+----+-------------+---------+------------+------+--------------------+-----------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | Clients | NULL       | ref  | idx_city,idx_state | idx_state | 203     | const |    6 |    66.67 | Using where |
+----+-------------+---------+------------+------+--------------------+-----------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0.00 sec)

mysql> EXPLAIN SELECT ClientID, FullName FROM Clients WHERE LoyaltyPoints = (SELECT MAX(LoyaltyPoints) FROM Clients);
+----+-------------+---------+------------+------+--------------------+--------------------+---------+-------+------+----------+------------------------------+
| id | select_type | table   | partitions | type | possible_keys      | key                | key_len | ref   | rows | filtered | Extra                        |
+----+-------------+---------+------------+------+--------------------+--------------------+---------+-------+------+----------+------------------------------+
|  1 | PRIMARY     | Clients | NULL       | ref  | idx_loyalty_points | idx_loyalty_points | 5       | const |    1 |   100.00 | Using where                  |
|  2 | SUBQUERY    | NULL    | NULL       | NULL | NULL               | NULL               | NULL    | NULL  | NULL |     NULL | Select tables optimized away |
+----+-------------+---------+------------+------+--------------------+--------------------+---------+-------+------+----------+------------------------------+
2 rows in set, 1 warning (0.00 sec)

mysql> EXPLAIN SELECT ClientID, FullName FROM Clients WHERE DOB = '1990-01-01';
+----+-------------+---------+------------+------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table   | partitions | type | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+---------+------------+------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | Clients | NULL       | ref  | idx_dob       | idx_dob | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+---------+------------+------+---------------+---------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> SELECT ClientID, FullName FROM Clients WHERE DOB = '1990-12-01';+----------+------------+
| ClientID | FullName   |
+----------+------------+
|        2 | Jane Smith |
+----------+------------+
1 row in set (0.01 sec)

mysql> EXPLAIN SELECT ClientID, FullName FROM Clients WHERE DOB = '1990-12-01';
+----+-------------+---------+------------+------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table   | partitions | type | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+---------+------------+------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | Clients | NULL       | ref  | idx_dob       | idx_dob | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+---------+------------+------+---------------+---------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0.00 sec)

mysql> */