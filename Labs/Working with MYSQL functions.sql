/*coder@a38a3cf3c3ad:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE Lucky_Shrub;
Query OK, 1 row affected (0.01 sec)

mysql> USE Lucky_Shrub;
Database changed
mysql> CREATE TABLE Orders (
    ->     OrderID INT NOT NULL PRIMARY KEY,
    ->     ClientID VARCHAR(10),
    ->     ProductID VARCHAR(10),
    ->     Quantity INT,
    ->     Cost DECIMAL(6, 2)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost) VALUES 
    -> (1, 'Cl1', 'P1', 10, 500),
    -> (2, 'Cl2', 'P2', 5, 100),
    -> (3, 'Cl3', 'P3', 20, 800),
    -> (4, 'Cl4', 'P4', 15, 150),
    -> (5, 'Cl3', 'P3', 10, 450),
    -> (6, 'Cl2', 'P2', 5, 800),
    -> (7, 'Cl1', 'P4', 22, 1200),
    -> (8, 'Cl1', 'P1', 15, 150);
Query OK, 8 rows affected (0.03 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> CREATE VIEW OrdersView AS
    -> SELECT OrderID, Quantity, Cost
    -> FROM Orders;
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost
FROM Orders;
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE VIEW OrdersView AS
    -> SELECT OrderID, Quantity, Cost
    -> FROM Orders;
ERROR 1050 (42S01): Table 'OrdersView' already exists
mysql> SELECT * FROM OrdersView;
+---------+----------+---------+
| OrderID | Quantity | Cost    |
+---------+----------+---------+
|       1 |       10 |  500.00 |
|       2 |        5 |  100.00 |
|       3 |       20 |  800.00 |
|       4 |       15 |  150.00 |
|       5 |       10 |  450.00 |
|       6 |        5 |  800.00 |
|       7 |       22 | 1200.00 |
|       8 |       15 |  150.00 |
+---------+----------+---------+
8 rows in set (0.00 sec)

mysql> UPDATE OrdersView
    -> SET Cost = 200
    -> WHERE OrderID = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM OrdersView;
+---------+----------+---------+
| OrderID | Quantity | Cost    |
+---------+----------+---------+
|       1 |       10 |  500.00 |
|       2 |        5 |  200.00 |
|       3 |       20 |  800.00 |
|       4 |       15 |  150.00 |
|       5 |       10 |  450.00 |
|       6 |        5 |  800.00 |
|       7 |       22 | 1200.00 |
|       8 |       15 |  150.00 |
+---------+----------+---------+
8 rows in set (0.00 sec)

mysql> DROP VIEW OrdersView;
ew AS
SELECT OrderID, Quantity, Cost
FROM Orders;
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> CREATE VIEW ClientsOrdersView AS
    -> SELECT OrderID, Quantity, Cost
    -> FROM Orders;
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT * FROM ClientsOrdersView;
+---------+----------+---------+
| OrderID | Quantity | Cost    |
+---------+----------+---------+
|       1 |       10 |  500.00 |
|       2 |        5 |  200.00 |
|       3 |       20 |  800.00 |
|       4 |       15 |  150.00 |
|       5 |       10 |  450.00 |
|       6 |        5 |  800.00 |
|       7 |       22 | 1200.00 |
|       8 |       15 |  150.00 |
+---------+----------+---------+
8 rows in set (0.01 sec)

mysql> DROP VIEW ClientsOrdersView;
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT CONCAT(LCASE(Name),'-',Quantity,'-', UCASE(OrderStatus)) 
    -> FROM item,mg_orders 
    -> WHERE item.ItemID = mg_orders.ItemID;
ERROR 1146 (42S02): Table 'Lucky_Shrub.item' doesn't exist
mysql> SHOW TABLES;
+-----------------------+
| Tables_in_Lucky_Shrub |
+-----------------------+
| Orders                |
+-----------------------+
1 row in set (0.00 sec)

mysql> SELECT CONCAT(LCASE(ClientID), '-', Quantity, '-', UCASE(Cost))
    -> FROM Orders;
+----------------------------------------------------------+
| CONCAT(LCASE(ClientID), '-', Quantity, '-', UCASE(Cost)) |
+----------------------------------------------------------+
| cl1-10-500.00                                            |
| cl2-5-200.00                                             |
| cl3-20-800.00                                            |
| cl4-15-150.00                                            |
| cl3-10-450.00                                            |
| cl2-5-800.00                                             |
| cl1-22-1200.00                                           |
| cl1-15-150.00                                            |
+----------------------------------------------------------+
8 rows in set (0.00 sec)

mysql> CREATE TABLE item (
    ->     ItemID INT NOT NULL PRIMARY KEY,
    ->     Name VARCHAR(100)
    -> );
rders (
    OrderID INT NOT NULL PRIMARY KEY,
    ItemID INT,
    Quantity INT,
    OrderStatus VARCHAR(50),
    FOREIGN KEY (ItemID) REFERENCES item(ItemID)
);
Query OK, 0 rows affected (0.12 sec)

mysql> 
mysql> CREATE TABLE mg_orders (
    ->     OrderID INT NOT NULL PRIMARY KEY,
    ->     ItemID INT,
    ->     Quantity INT,
    ->     OrderStatus VARCHAR(50),
    ->     FOREIGN KEY (ItemID) REFERENCES item(ItemID)
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> INSERT INTO item (ItemID, Name) VALUES
    -> (1, 'Plant1'),
    -> (2, 'Plant2');
, ItemID, Quantity, OrderStatus) VALUES
(1, 1, 10, 'Pending'),
(2, 2, 5, 'Completed');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO mg_orders (OrderID, ItemID, Quantity, OrderStatus) VALUES
    -> (1, 1, 10, 'Pending'),
    -> (2, 2, 5, 'Completed');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT CONCAT(LCASE(Name),'-',Quantity,'-', UCASE(OrderStatus)) 
    -> FROM item,mg_orders 
    -> WHERE item.ItemID = mg_orders.ItemID;
+----------------------------------------------------------+
| CONCAT(LCASE(Name),'-',Quantity,'-', UCASE(OrderStatus)) |
+----------------------------------------------------------+
| plant1-10-PENDING                                        |
| plant2-5-COMPLETED                                       |
+----------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> SELECT DATE_FORMAT(DeliveryDate,'%W') FROM mg_orders; 
ERROR 1054 (42S22): Unknown column 'DeliveryDate' in 'field list'
mysql> DESCRIBE mg_orders;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| OrderID     | int         | NO   | PRI | NULL    |       |
| ItemID      | int         | YES  | MUL | NULL    |       |
| Quantity    | int         | YES  |     | NULL    |       |
| OrderStatus | varchar(50) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)


mysql> ALTER TABLE mg_orders ADD COLUMN DeliveryDate DATE;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO mg_orders (OrderID, ItemID, Quantity, OrderStatus, DeliveryDate) VALUES
    -> (1, 1, 10, 'Pending', '2024-09-08'),
    -> (2, 2, 5, 'Completed', '2024-09-09');
ERROR 1062 (23000): Duplicate entry '1' for key 'mg_orders.PRIMARY'
mysql> UPDATE mg_orders SET DeliveryDate = '2024-09-08' WHERE OrderID = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT DATE_FORMAT(DeliveryDate, '%W') FROM mg_orders;
+---------------------------------+
| DATE_FORMAT(DeliveryDate, '%W') |
+---------------------------------+
| Sunday                          |
| NULL                            |
+---------------------------------+
2 rows in set (0.00 sec)


mysql> SELECT OrderID, ROUND((Quantity * 5 / 100), 2) AS HandlingCost
    -> FROM mg_orders;
+---------+--------------+
| OrderID | HandlingCost |
+---------+--------------+
|       1 |         0.50 |
|       2 |         0.25 |
+---------+--------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE mg_orders ADD COLUMN Cost DECIMAL(10, 2);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> UPDATE mg_orders SET Cost = 100.00 WHERE OrderID = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> INSERT INTO mg_orders (OrderID, ItemID, Quantity, OrderStatus, Cost) VALUES
    -> (1, 1, 10, 'Pending', 50.00),
    -> (2, 2, 5, 'Completed', 30.00);
ERROR 1062 (23000): Duplicate entry '1' for key 'mg_orders.PRIMARY'
mysql> SELECT OrderID, ROUND((Cost * 5 / 100), 2) AS HandlingCost
    -> FROM mg_orders;
+---------+--------------+
| OrderID | HandlingCost |
+---------+--------------+
|       1 |         5.00 |
|       2 |         NULL |
+---------+--------------+
2 rows in set (0.00 sec)

mysql> SELECT DATE_FORMAT(DeliveryDate,'%W') FROM mg_orders WHERE !ISNULL(DeliveryDate);
+--------------------------------+
| DATE_FORMAT(DeliveryDate,'%W') |
+--------------------------------+
| Sunday                         |
+--------------------------------+
1 row in set, 1 warning (0.00 sec)

mysql> */