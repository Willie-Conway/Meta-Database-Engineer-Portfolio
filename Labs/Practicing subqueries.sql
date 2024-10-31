/*coder@5b022f6588b2:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE littlelemon_db;
ERROR 1007 (HY000): Can't create database 'littlelemon_db'; database exists
mysql> USE littlelemon_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> CREATE TABLE MenuItems (
    ->     ItemID int NOT NULL,
    ->     Name varchar(200) DEFAULT NULL,
    ->     Type varchar(100) DEFAULT NULL,
    ->     Price int DEFAULT NULL,
    ->     PRIMARY KEY (ItemID)
    -> );
ERROR 1050 (42S01): Table 'MenuItems' already exists
mysql> 
mysql> INSERT INTO MenuItems (ItemID, Name, Type, Price) VALUES
    -> (1,'Olives','Starters',5),
    -> (2,'Flatbread','Starters',5),
    -> (3,'Minestrone','Starters',8),
    -> (4,'Tomato bread','Starters',8),
    -> (5,'Falafel','Starters',7),
    -> (6,'Hummus','Starters',5),
    -> (7,'Greek salad','Main Courses',15),
    -> (8,'Bean soup','Main Courses',12),
    -> (9,'Pizza','Main Courses',15),
    -> (10,'Greek yoghurt','Desserts',7),
    -> (11,'Ice cream','Desserts',6),
    -> (12,'Cheesecake','Desserts',4),
    -> (13,'Athens White wine','Drinks',25),
    -> (14,'Corfu Red Wine','Drinks',30),
    -> (15,'Turkish Coffee','Drinks',10),
    -> (16,'Turkish Coffee','Drinks',10),
    -> (17,'Kabasa','Main Courses',17);
ERROR 1062 (23000): Duplicate entry '1' for key 'MenuItems.PRIMARY'
mysql> CREATE TABLE LowCostMenuItems (
    ->     ItemID INT,
    ->     Name VARCHAR(200),
    ->     Price INT,
    ->     PRIMARY KEY(ItemID)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> SELECT MIN(avg_price) AS MinAvgPrice, MAX(avg_price) AS MaxAvgPrice
    -> FROM (
    ->     SELECT Type, AVG(Price) AS avg_price
    ->     FROM MenuItems
    ->     GROUP BY Type
    -> ) AS AvgPrices;
+-------------+-------------+
| MinAvgPrice | MaxAvgPrice |
+-------------+-------------+
|      5.6667 |     18.7500 |
+-------------+-------------+
1 row in set (0.01 sec)

mysql> INSERT INTO LowCostMenuItems (ItemID, Name, Price)
    -> SELECT ItemID, Name, Price
    -> FROM MenuItems
    -> WHERE (Type, Price) IN (
    ->     SELECT Type, MIN(Price)
    ->     FROM MenuItems
    ->     GROUP BY Type
    -> );
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> DELETE FROM LowCostMenuItems
    -> WHERE Price > (
    ->     SELECT MIN(Price)
    ->     FROM MenuItems
    ->     WHERE Price BETWEEN 5 AND 10
    -> );
Query OK, 3 rows affected (0.01 sec)

mysql> SHOW TABLES;
+--------------------------+
| Tables_in_littlelemon_db |
+--------------------------+
| Bookings                 |
| LowCostMenuItems         |
| MenuItems                |
| Menus                    |
| TableOrders              |
+--------------------------+
5 rows in set (0.00 sec)

mysql> SELECT Type, AVG(Price) AS avgPrice 
    -> FROM MenuItems 
    -> GROUP BY Type;
+--------------+----------+
| Type         | avgPrice |
+--------------+----------+
| Starters     |   6.3333 |
| Main Courses |  14.7500 |
| Desserts     |   5.6667 |
| Drinks       |  18.7500 |
+--------------+----------+
4 rows in set (0.00 sec)

mysql> SELECT ROUND(MIN(avgPrice),2), ROUND(MAX(avgPrice),2) 
    -> FROM (SELECT Type,AVG(Price) AS avgPrice
    -> FROM MenuItems 
    -> GROUP BY Type) AS aPrice;
+------------------------+------------------------+
| ROUND(MIN(avgPrice),2) | ROUND(MAX(avgPrice),2) |
+------------------------+------------------------+
|                   5.67 |                  18.75 |
+------------------------+------------------------+
1 row in set (0.00 sec)

mysql> INSERT INTO LowCostMenuItems 
    -> SELECT ItemID,Name,Price 
    -> FROM MenuItems 
    -> WHERE Price =ANY(SELECT MIN(Price) FROM MenuItems GROUP BY Type);
ERROR 1062 (23000): Duplicate entry '1' for key 'LowCostMenuItems.PRIMARY'
mysql> INSERT IGNORE INTO LowCostMenuItems (ItemID, Name, Price)
    -> SELECT ItemID, Name, Price
    -> FROM MenuItems
    -> WHERE Price = ANY (
    ->     SELECT MIN(Price)
    ->     FROM MenuItems
    ->     GROUP BY Type
    -> );
Query OK, 3 rows affected, 4 warnings (0.02 sec)
Records: 7  Duplicates: 4  Warnings: 4

mysql> DELETE FROM LowCostMenuItems;
Query OK, 7 rows affected (0.01 sec)

mysql> INSERT INTO LowCostMenuItems (ItemID, Name, Price)
    -> SELECT ItemID, Name, Price
    -> FROM MenuItems
    -> WHERE (Type, Price) IN (
    ->     SELECT Type, MIN(Price)
    ->     FROM MenuItems
    ->     GROUP BY Type
    -> );
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> INSERT INTO LowCostMenuItems 
    -> SELECT ItemID,Name,Price 
    -> FROM MenuItems 
    -> WHERE Price =ANY(SELECT MIN(Price) FROM MenuItems GROUP BY Type);
ERROR 1062 (23000): Duplicate entry '1' for key 'LowCostMenuItems.PRIMARY'
mysql> 
mysql> DELETE FROM LowCostMenuItems 
    -> WHERE Price > ALL(SELECT MIN(Price) as p 
    -> FROM MenuItems 
    -> GROUP BY Type 
    -> HAVING p BETWEEN 5 AND 10);
Query OK, 1 row affected (0.02 sec)

mysql> DESCRIBE LowCostMenuItems;
+--------+--------------+------+-----+---------+-------+
| Field  | Type         | Null | Key | Default | Extra |
+--------+--------------+------+-----+---------+-------+
| ItemID | int          | NO   | PRI | NULL    |       |
| Name   | varchar(200) | YES  |     | NULL    |       |
| Price  | int          | YES  |     | NULL    |       |
+--------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> */