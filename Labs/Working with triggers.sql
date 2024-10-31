/*coder@81ce08e24181:~/project$ mysql
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
mysql> CREATE TABLE Products (
    ->     ProductID VARCHAR(10),
    ->     ProductName VARCHAR(100),
    ->     BuyPrice DECIMAL(6,2),
    ->     SellPrice DECIMAL(6,2),
    ->     NumberOfItems INT
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems) 
    -> VALUES 
    ->     ("P1", "Artificial grass bags", 40, 50, 100), 
    ->     ("P2", "Wood panels", 15, 20, 250), 
    ->     ("P3", "Patio slates", 35, 40, 60), 
    ->     ("P4", "Sycamore trees", 7, 10, 50), 
    ->     ("P5", "Trees and Shrubs", 35, 50, 75), 
    ->     ("P6", "Water fountain", 65, 80, 15);
Query OK, 6 rows affected (0.03 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Notifications (
    ->     NotificationID INT AUTO_INCREMENT,
    ->     Notification VARCHAR(255),
    ->     DateTime TIMESTAMP NOT NULL,
    ->     PRIMARY KEY (NotificationID)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE TRIGGER ProductSellPriceInsertCheck
    -> AFTER INSERT ON Products
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.SellPrice < NEW.BuyPrice THEN
    ->         INSERT INTO Notifications (Notification, DateTime)
    ->         VALUES (CONCAT('A SellPrice less than the BuyPrice was inserted for ProductID ', NEW.ProductID), NOW());
    ->     END IF;
    -> END//
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> DELIMITER ;
mysql> DELIMITER //
mysql> 
mysql> CREATE TRIGGER ProductSellPriceUpdateCheck
    -> AFTER UPDATE ON Products
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.SellPrice <= NEW.BuyPrice THEN
    ->         INSERT INTO Notifications (Notification, DateTime)
    ->         VALUES (CONCAT(NEW.ProductID, ' was updated with a SellPrice of ', NEW.SellPrice, ' which is the same or less than the BuyPrice'), NOW());
    ->     END IF;
    -> END//
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELIMITER ;
mysql> DELIMITER //
mysql> 
mysql> CREATE TRIGGER NotifyProductDelete
    -> AFTER DELETE ON Products
    -> FOR EACH ROW
    -> BEGIN
    ->     INSERT INTO Notifications (Notification, DateTime)
    ->     VALUES (CONCAT('The product with a ProductID ', OLD.ProductID, ' was deleted'), NOW());
    -> END//
IMITER ;
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> DELIMITER ;
mysql> DESCRIBE Products;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| ProductID     | varchar(10)  | YES  |     | NULL    |       |
| ProductName   | varchar(100) | YES  |     | NULL    |       |
| BuyPrice      | decimal(6,2) | YES  |     | NULL    |       |
| SellPrice     | decimal(6,2) | YES  |     | NULL    |       |
| NumberOfItems | int          | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> SHOW COLUMNS FROM Products;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| ProductID     | varchar(10)  | YES  |     | NULL    |       |
| ProductName   | varchar(100) | YES  |     | NULL    |       |
| BuyPrice      | decimal(6,2) | YES  |     | NULL    |       |
| SellPrice     | decimal(6,2) | YES  |     | NULL    |       |
| NumberOfItems | int          | YES  |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> DESCRIBE Notifications;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| NotificationID | int          | NO   | PRI | NULL    | auto_increment |
| Notification   | varchar(255) | YES  |     | NULL    |                |
| DateTime       | timestamp    | NO   |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM Notifications;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| NotificationID | int          | NO   | PRI | NULL    | auto_increment |
| Notification   | varchar(255) | YES  |     | NULL    |                |
| DateTime       | timestamp    | NO   |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Products;
+-----------+-----------------------+----------+-----------+---------------+
| ProductID | ProductName           | BuyPrice | SellPrice | NumberOfItems |
+-----------+-----------------------+----------+-----------+---------------+
| P1        | Artificial grass bags |    40.00 |     50.00 |           100 |
| P2        | Wood panels           |    15.00 |     20.00 |           250 |
| P3        | Patio slates          |    35.00 |     40.00 |            60 |
| P4        | Sycamore trees        |     7.00 |     10.00 |            50 |
| P5        | Trees and Shrubs      |    35.00 |     50.00 |            75 |
| P6        | Water fountain        |    65.00 |     80.00 |            15 |
+-----------+-----------------------+----------+-----------+---------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Notifications;
Empty set (0.00 sec)

mysql> SHOW TRIGGERS;
+-----------------------------+--------+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+---------+----------------------+----------------------+--------------------+
| Trigger                     | Event  | Table    | Statement                                                                                                                                                                                                                                                                     | Timing | Created                | sql_mode                                                                                                              | Definer | character_set_client | collation_connection | Database Collation |
+-----------------------------+--------+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+---------+----------------------+----------------------+--------------------+
| ProductSellPriceInsertCheck | INSERT | Products | BEGIN
    IF NEW.SellPrice < NEW.BuyPrice THEN
        INSERT INTO Notifications (Notification, DateTime)
        VALUES (CONCAT('A SellPrice less than the BuyPrice was inserted for ProductID ', NEW.ProductID), NOW());
    END IF;
END                                    | AFTER  | 2024-09-10 03:43:56.45 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | coder@% | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
| ProductSellPriceUpdateCheck | UPDATE | Products | BEGIN
    IF NEW.SellPrice <= NEW.BuyPrice THEN
        INSERT INTO Notifications (Notification, DateTime)
        VALUES (CONCAT(NEW.ProductID, ' was updated with a SellPrice of ', NEW.SellPrice, ' which is the same or less than the BuyPrice'), NOW());
    END IF;
END | AFTER  | 2024-09-10 03:44:03.74 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | coder@% | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
| NotifyProductDelete         | DELETE | Products | BEGIN
    INSERT INTO Notifications (Notification, DateTime)
    VALUES (CONCAT('The product with a ProductID ', OLD.ProductID, ' was deleted'), NOW());
END                                                                                                                  | AFTER  | 2024-09-10 03:44:09.65 | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | coder@% | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
+-----------------------------+--------+----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+------------------------+-----------------------------------------------------------------------------------------------------------------------+---------+----------------------+----------------------+--------------------+
3 rows in set (0.00 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE TRIGGER ProductSellPriceInsertCheck
    -> AFTER INSERT ON Products
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.SellPrice < NEW.BuyPrice THEN
    ->         INSERT INTO Notifications (Notification, DateTime)
    ->         VALUES (CONCAT('A SellPrice less than the BuyPrice was inserted for ProductID ', NEW.ProductID), NOW());
    ->     END IF;
    -> END//
ERROR 1359 (HY000): Trigger already exists
mysql> 
mysql> DELIMITER ;
mysql> DELIMITER //
mysql> 
mysql> CREATE TRIGGER ProductSellPriceUpdateCheck
    -> AFTER UPDATE ON Products
    -> FOR EACH ROW
    -> BEGIN
    ->     IF NEW.SellPrice <= NEW.BuyPrice THEN
    ->         INSERT INTO Notifications (Notification, DateTime)
    ->         VALUES (CONCAT(NEW.ProductID, ' was updated with a SellPrice of ', NEW.SellPrice, ' which is the same or less than the BuyPrice'), NOW());
    ->     END IF;
    -> END//
ERROR 1359 (HY000): Trigger already exists
mysql> 
mysql> DELIMITER ;
mysql> DELIMITER //
mysql> 
mysql> CREATE TRIGGER NotifyProductDelete
    -> AFTER DELETE ON Products
    -> FOR EACH ROW
    -> BEGIN
    ->     INSERT INTO Notifications (Notification, DateTime)
    ->     VALUES (CONCAT('The product with a ProductID ', OLD.ProductID, ' was deleted'), NOW());
    -> END//
ERROR 1359 (HY000): Trigger already exists
mysql> 
mysql> DELIMITER ;
mysql> INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems) 
    -> VALUES ("P7", "Test Product", 50, 40, 10);
Query OK, 1 row affected (0.01 sec)

mysql> UPDATE Products
    -> SET SellPrice = 30
    -> WHERE ProductID = "P6";
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM Products
    -> WHERE ProductID = "P5";
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM Notifications;
+----------------+--------------------------------------------------------------------------------------+---------------------+
| NotificationID | Notification                                                                         | DateTime            |
+----------------+--------------------------------------------------------------------------------------+---------------------+
|              1 | A SellPrice less than the BuyPrice was inserted for ProductID P7                     | 2024-09-10 03:47:44 |
|              2 | P6 was updated with a SellPrice of 30.00 which is the same or less than the BuyPrice | 2024-09-10 03:47:49 |
|              3 | The product with a ProductID P5 was deleted                                          | 2024-09-10 03:47:54 |
+----------------+--------------------------------------------------------------------------------------+---------------------+
3 rows in set (0.00 sec)

mysql> */