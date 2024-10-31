/*coder@fa133b56c33e:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
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
    ->     Cost DECIMAL(6,2),
    ->     Date DATE
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO Orders(OrderID, ClientID, ProductID, Quantity, Cost, Date) VALUES
    -> (1, "Cl1", "P1", 10, 500, "2020-09-01"),  
    -> (2, "Cl2", "P2", 5, 100, "2020-09-05"),  
    -> (3, "Cl3", "P3", 20, 800, "2020-09-03"),  
    -> (4, "Cl4", "P4", 15, 150, "2020-09-07"),  
    -> (5, "Cl3", "P3", 10, 450, "2020-09-08"),  
    -> (6, "Cl2", "P2", 5, 800, "2020-09-09"),  
    -> (7, "Cl1", "P4", 22, 1200, "2020-09-10"),  
    -> (8, "Cl3", "P1", 15, 150, "2020-09-10"),  
    -> (9, "Cl1", "P1", 10, 500, "2020-09-12"),  
    -> (10, "Cl2", "P2", 5, 100, "2020-09-13"),  
    -> (11, "Cl4", "P5", 5, 100, "2020-09-15"), 
    -> (12, "Cl1", "P1", 10, 500, "2022-09-01"),  
    -> (13, "Cl2", "P2", 5, 100, "2022-09-05"),  
    -> (14, "Cl3", "P3", 20, 800, "2022-09-03"),  
    -> (15, "Cl4", "P4", 15, 150, "2022-09-07"),  
    -> (16, "Cl3", "P3", 10, 450, "2022-09-08"),  
    -> (17, "Cl2", "P2", 5, 800, "2022-09-09"),  
    -> (18, "Cl1", "P4", 22, 1200, "2022-09-10"),  
    -> (19, "Cl3", "P1", 15, 150, "2022-09-10"),  
    -> (20, "Cl1", "P1", 10, 500, "2022-09-12"),  
    -> (21, "Cl2", "P2", 5, 100, "2022-09-13"),   
    -> (22, "Cl2", "P1", 10, 500, "2021-09-01"),  
    -> (23, "Cl2", "P2", 5, 100, "2021-09-05"),  
    -> (24, "Cl3", "P3", 20, 800, "2021-09-03"),  
    -> (25, "Cl4", "P4", 15, 150, "2021-09-07"),  
    -> (26, "Cl1", "P3", 10, 450, "2021-09-08"),  
    -> (27, "Cl2", "P1", 20, 1000, "2022-09-01"),  
    -> (28, "Cl2", "P2", 10, 200, "2022-09-05"),  
    -> (29, "Cl3", "P3", 20, 800, "2021-09-03"),  
    -> (30, "Cl1", "P1", 10, 500, "2022-09-01");
Query OK, 30 rows affected (0.02 sec)
Records: 30  Duplicates: 0  Warnings: 0

mysql> DELIMITER //
mysql> 
mysql> CREATE FUNCTION GetOrderCost(order_id INT)
    -> RETURNS DECIMAL(6,2)
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE order_cost DECIMAL(6,2);
    -> 
    ->     -- Fetch the cost of the specific order
    ->     SELECT Cost INTO order_cost
    ->     FROM Orders
    ->     WHERE OrderID = order_id;
    -> 
    ->     RETURN order_cost;
    -> END //
;
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> DELIMITER ;
mysql> SELECT GetOrderCost(5);
+-----------------+
| GetOrderCost(5) |
+-----------------+
|          450.00 |
+-----------------+
1 row in set (0.00 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetDiscount(IN order_id INT)
    -> BEGIN
    ->     DECLARE order_quantity INT;
    ->     DECLARE order_cost DECIMAL(6,2);
    ->     DECLARE final_cost DECIMAL(6,2);
    -> 
    ->     -- Fetch the order quantity and cost
    ->     SELECT Quantity, Cost INTO order_quantity, order_cost
    ->     FROM Orders
    ->     WHERE OrderID = order_id;
    -> 
    ->     -- Apply discount based on the quantity
    ->     IF order_quantity >= 20 THEN
    ->         SET final_cost = order_cost * 0.80; -- 20% discount
    ->     ELSEIF order_quantity >= 10 THEN
    ->         SET final_cost = order_cost * 0.90; -- 10% discount
    ->     ELSE
    ->         SET final_cost = order_cost; -- No discount
    ->     END IF;
    -> 
    ->     -- Return the final cost
    ->     SELECT final_cost AS DiscountedCost;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELIMITER ;
mysql> CALL GetDiscount(5);
+----------------+
| DiscountedCost |
+----------------+
|         405.00 |
+----------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM Orders;
+---------+----------+-----------+----------+---------+------------+
| OrderID | ClientID | ProductID | Quantity | Cost    | Date       |
+---------+----------+-----------+----------+---------+------------+
|       1 | Cl1      | P1        |       10 |  500.00 | 2020-09-01 |
|       2 | Cl2      | P2        |        5 |  100.00 | 2020-09-05 |
|       3 | Cl3      | P3        |       20 |  800.00 | 2020-09-03 |
|       4 | Cl4      | P4        |       15 |  150.00 | 2020-09-07 |
|       5 | Cl3      | P3        |       10 |  450.00 | 2020-09-08 |
|       6 | Cl2      | P2        |        5 |  800.00 | 2020-09-09 |
|       7 | Cl1      | P4        |       22 | 1200.00 | 2020-09-10 |
|       8 | Cl3      | P1        |       15 |  150.00 | 2020-09-10 |
|       9 | Cl1      | P1        |       10 |  500.00 | 2020-09-12 |
|      10 | Cl2      | P2        |        5 |  100.00 | 2020-09-13 |
|      11 | Cl4      | P5        |        5 |  100.00 | 2020-09-15 |
|      12 | Cl1      | P1        |       10 |  500.00 | 2022-09-01 |
|      13 | Cl2      | P2        |        5 |  100.00 | 2022-09-05 |
|      14 | Cl3      | P3        |       20 |  800.00 | 2022-09-03 |
|      15 | Cl4      | P4        |       15 |  150.00 | 2022-09-07 |
|      16 | Cl3      | P3        |       10 |  450.00 | 2022-09-08 |
|      17 | Cl2      | P2        |        5 |  800.00 | 2022-09-09 |
|      18 | Cl1      | P4        |       22 | 1200.00 | 2022-09-10 |
|      19 | Cl3      | P1        |       15 |  150.00 | 2022-09-10 |
|      20 | Cl1      | P1        |       10 |  500.00 | 2022-09-12 |
|      21 | Cl2      | P2        |        5 |  100.00 | 2022-09-13 |
|      22 | Cl2      | P1        |       10 |  500.00 | 2021-09-01 |
|      23 | Cl2      | P2        |        5 |  100.00 | 2021-09-05 |
|      24 | Cl3      | P3        |       20 |  800.00 | 2021-09-03 |
|      25 | Cl4      | P4        |       15 |  150.00 | 2021-09-07 |
|      26 | Cl1      | P3        |       10 |  450.00 | 2021-09-08 |
|      27 | Cl2      | P1        |       20 | 1000.00 | 2022-09-01 |
|      28 | Cl2      | P2        |       10 |  200.00 | 2022-09-05 |
|      29 | Cl3      | P3        |       20 |  800.00 | 2021-09-03 |
|      30 | Cl1      | P1        |       10 |  500.00 | 2022-09-01 |
+---------+----------+-----------+----------+---------+------------+
30 rows in set (0.00 sec)


mysql> CREATE FUNCTION FindCost(order_id INT) 
    -> RETURNS DECIMAL (5,2) DETERMINISTIC 
    -> RETURN (SELECT Cost FROM Orders WHERE OrderID = order_id);
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER // 
mysql> 
mysql> CREATE Procedure GetDiscount(OrderIDInput INT) 
    ->      BEGIN 
    ->          DECLARE cost_after_discount DECIMAL(7,2); 
    ->          DECLARE current_cost DECIMAL(7,2); 
    ->          DECLARE order_quantity INT; 
    ->          SELECT Quantity INTO order_quantity FROM Orders WHERE OrderID = OrderIDInput; 
    ->          SELECT Cost INTO current_cost FROM Orders WHERE OrderID = OrderIDInput; 
    ->         IF order_quantity >= 20 THEN
    ->           SET cost_after_discount = current_cost - (current_cost * 0.2);              
    ->         ELSEIF order_quantity >= 10 THEN
    ->           SET cost_after_discount = current_cost - (current_cost * 0.1); 
    ->         ELSE SET cost_after_discount = current_cost;
    ->         END IF;
    ->     SELECT cost_after_discount; 
    -> END//
ERROR 1304 (42000): PROCEDURE GetDiscount already exists
mysql> 
mysql> DELIMITER ; 
mysql> CALL GetDiscount(5);
+----------------+
| DiscountedCost |
+----------------+
|         405.00 |
+----------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> */