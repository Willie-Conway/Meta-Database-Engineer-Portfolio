/*coder@5b022f6588b2:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE littlelemon_db;
Query OK, 1 row affected (0.02 sec)

mysql> USE littlelemon_db;
Database changed
mysql> CREATE TABLE MenuItems (
    ->   ItemID INT PRIMARY KEY,
    ->   Name VARCHAR(200),
    ->   Type VARCHAR(100),
    ->   Price INT
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE Menus (
    ->   MenuID INT,
    ->   ItemID INT,
    ->   Cuisine VARCHAR(100),
    ->   PRIMARY KEY (MenuID, ItemID)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE Bookings (
    ->   BookingID INT PRIMARY KEY,
    ->   TableNo INT,
    ->   GuestFirstName VARCHAR(100),
    ->   GuestLastName VARCHAR(100),
    ->   BookingSlot TIME,
    ->   EmployeeID INT
    -> );
Query OK, 0 rows affected (0.10 sec)

mysql> CREATE TABLE TableOrders (
    ->   OrderID INT,
    ->   TableNo INT,
    ->   MenuID INT,
    ->   BookingID INT,
    ->   BillAmount INT,
    ->   Quantity INT,
    ->   PRIMARY KEY (OrderID, TableNo)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO MenuItems VALUES
    -> (1, 'Olives', 'Starters', 5),
    -> (2, 'Flatbread', 'Starters', 5),
    -> (3, 'Minestrone', 'Starters', 8),
    -> (4, 'Tomato bread', 'Starters', 8),
    -> (5, 'Falafel', 'Starters', 7),
    -> (6, 'Hummus', 'Starters', 5),
    -> (7, 'Greek salad', 'Main Courses', 15),
    -> (8, 'Bean soup', 'Main Courses', 12),
    -> (9, 'Pizza', 'Main Courses', 15),
    -> (10, 'Greek yoghurt', 'Desserts', 7),
    -> (11, 'Ice cream', 'Desserts', 6),
    -> (12, 'Cheesecake', 'Desserts', 4),
    -> (13, 'Athens White wine', 'Drinks', 25),
    -> (14, 'Corfu Red Wine', 'Drinks', 30),
    -> (15, 'Turkish Coffee', 'Drinks', 10),
    -> (16, 'Turkish Coffee', 'Drinks', 10),
    -> (17, 'Kabasa', 'Main Courses', 17);
Query OK, 17 rows affected (0.03 sec)
Records: 17  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Menus VALUES
    -> (1, 1, 'Greek'),
    -> (1, 7, 'Greek'),
    -> (1, 10, 'Greek'),
    -> (1, 13, 'Greek'),
    -> (2, 3, 'Italian'),
    -> (2, 9, 'Italian'),
    -> (2, 12, 'Italian'),
    -> (2, 15, 'Italian'),
    -> (3, 5, 'Turkish'),
    -> (3, 17, 'Turkish'),
    -> (3, 11, 'Turkish'),
    -> (3, 16, 'Turkish');
Query OK, 12 rows affected (0.02 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Bookings VALUES
    -> (1, 12, 'Anna', 'Iversen', '19:00:00', 1),
    -> (2, 12, 'Joakim', 'Iversen', '19:00:00', 1),
    -> (3, 19, 'Vanessa', 'McCarthy', '15:00:00', 3),
    -> (4, 15, 'Marcos', 'Romero', '17:30:00', 4),
    -> (5, 5, 'Hiroki', 'Yamane', '18:30:00', 2),
    -> (6, 8, 'Diana', 'Pinto', '20:00:00', 5);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO TableOrders VALUES
    -> (1, 12, 1, 1, 86, 2),
    -> (2, 19, 2, 2, 37, 1),
    -> (3, 15, 2, 3, 37, 1),
    -> (4, 5, 3, 4, 40, 1),
    -> (5, 8, 1, 5, 43, 1);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SHOW TABLES;
+--------------------------+
| Tables_in_littlelemon_db |
+--------------------------+
| Bookings                 |
| MenuItems                |
| Menus                    |
| TableOrders              |
+--------------------------+
4 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM MenuItems;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| ItemID | int          | NO   | PRI | NULL    |       |
| Name   | varchar(200) | YES  |     | NULL    |       |
| Type   | varchar(100) | YES  |     | NULL    |       |
| Price  | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM Menus;
+---------+--------------+------+-----+---------+-------+
| Field   | Type         | Null | Key | Default | Extra |
+---------+--------------+------+-----+---------+-------+
| MenuID  | int          | NO   | PRI | NULL    |       |
| ItemID  | int          | NO   | PRI | NULL    |       |
| Cuisine | varchar(100) | YES  |     | NULL    |       |
+---------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM Bookings;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| BookingID      | int          | NO   | PRI | NULL    |       |
| TableNo        | int          | YES  |     | NULL    |       |
| GuestFirstName | varchar(100) | YES  |     | NULL    |       |
| GuestLastName  | varchar(100) | YES  |     | NULL    |       |
| BookingSlot    | time         | YES  |     | NULL    |       |
| EmployeeID     | int          | YES  |     | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM TableOrders;
+------------+------+------+-----+---------+-------+
| Field      | Type | Null | Key | Default | Extra |
+------------+------+------+-----+---------+-------+
| OrderID    | int  | NO   | PRI | NULL    |       |
| TableNo    | int  | NO   | PRI | NULL    |       |
| MenuID     | int  | YES  |     | NULL    |       |
| BookingID  | int  | YES  |     | NULL    |       |
| BillAmount | int  | YES  |     | NULL    |       |
| Quantity   | int  | YES  |     | NULL    |       |
+------------+------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> ELECT * FROM Bookings WHERE BookingSlot > (SELECT BookingSlot FROM Bookings WHERE GuestFirstName = 'Vanessa' AND GuestLastName = 'McCarthy');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ELECT * FROM Bookings WHERE BookingSlot > (SELECT BookingSlot FROM Bookings WHER' at line 1
mysql> SELECT *
    -> FROM Bookings
    -> WHERE BookingSlot > (
    ->     SELECT BookingSlot
    ->     FROM Bookings
    ->     WHERE GuestFirstName = 'Vanessa' AND GuestLastName = 'McCarthy'
    -> );
+-----------+---------+----------------+---------------+-------------+------------+
| BookingID | TableNo | GuestFirstName | GuestLastName | BookingSlot | EmployeeID |
+-----------+---------+----------------+---------------+-------------+------------+
|         1 |      12 | Anna           | Iversen       | 19:00:00    |          1 |
|         2 |      12 | Joakim         | Iversen       | 19:00:00    |          1 |
|         4 |      15 | Marcos         | Romero        | 17:30:00    |          4 |
|         5 |       5 | Hiroki         | Yamane        | 18:30:00    |          2 |
|         6 |       8 | Diana          | Pinto         | 20:00:00    |          5 |
+-----------+---------+----------------+---------------+-------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM MenuItems WHERE Price > ALL (SELECT Price FROM MenuItems WHERE Type IN ('Starters', 'Desserts')); 
+--------+-------------------+--------------+-------+
| ItemID | Name              | Type         | Price |
+--------+-------------------+--------------+-------+
|      7 | Greek salad       | Main Courses |    15 |
|      8 | Bean soup         | Main Courses |    12 |
|      9 | Pizza             | Main Courses |    15 |
|     13 | Athens White wine | Drinks       |    25 |
|     14 | Corfu Red Wine    | Drinks       |    30 |
|     15 | Turkish Coffee    | Drinks       |    10 |
|     16 | Turkish Coffee    | Drinks       |    10 |
|     17 | Kabasa            | Main Courses |    17 |
+--------+-------------------+--------------+-------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM MenuItems WHERE Price = (SELECT Price FROM Menus, MenuItems WHERE Menus.ItemID = MenuItems.ItemID AND MenuItems.Type = 'Starters' AND Cuisine = 'Italian'); 
+--------+--------------+----------+-------+
| ItemID | Name         | Type     | Price |
+--------+--------------+----------+-------+
|      3 | Minestrone   | Starters |     8 |
|      4 | Tomato bread | Starters |     8 |
+--------+--------------+----------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM MenuItems 
    -> WHERE NOT EXISTS (SELECT * FROM TableOrders, Menus WHERE TableOrders.MenuID = Menus.MenuID AND Menus.ItemID = MenuItems.ItemID); 
+--------+----------------+--------------+-------+
| ItemID | Name           | Type         | Price |
+--------+----------------+--------------+-------+
|      2 | Flatbread      | Starters     |     5 |
|      4 | Tomato bread   | Starters     |     8 |
|      6 | Hummus         | Starters     |     5 |
|      8 | Bean soup      | Main Courses |    12 |
|     14 | Corfu Red Wine | Drinks       |    30 |
+--------+----------------+--------------+-------+
5 rows in set (0.00 sec)

mysql> */