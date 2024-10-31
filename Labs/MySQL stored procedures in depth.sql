/*coder@52150c0871b4:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE LuckyShrub;
Query OK, 1 row affected (0.02 sec)

mysql> USE LuckyShrub;
Database changed
mysql> CREATE TABLE Products (
    ->     ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ->     ItemName VARCHAR(100),
    ->     Price DECIMAL(10, 2)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO Products (ItemName, Price) VALUES ('Rose', 10.00);
) VALUES ('Tulip', 15.00);
INSERT INTO Products (ItemName, Price) VALUES ('Daisy', 7.50);
INSERT INTQuery OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Products (ItemName, Price) VALUES ('Tulip', 15.00);
);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Products (ItemName, Price) VALUES ('Daisy', 7.50);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Products (ItemName, Price) VALUES ('Lily', 12.00);
Query OK, 1 row affected (0.01 sec)

mysql> DELIMITER $$
mysql> 
mysql> CREATE PROCEDURE GetProductsDetails()
    -> BEGIN
    ->     SELECT * FROM Products;
    -> END$$
ER ;
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> 
mysql> CREATE PROCEDURE GetProductsBasedOnPrice(IN inputPrice DECIMAL(10, 2))
    -> BEGIN
    ->     SELECT * FROM Products WHERE Price <= inputPrice;
    -> END$$
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> 
mysql> CREATE PROCEDURE GetProductsByCriteria(IN minPrice DECIMAL(10, 2), IN maxPrice DECIMAL(10, 2))
    -> BEGIN
    ->     SELECT * FROM Products WHERE Price BETWEEN minPrice AND maxPrice;
    -> END$$
R ;
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> DELIMITER ;
mysql> CALL GetProductsDetails();
+-----------+----------+-------+
| ProductID | ItemName | Price |
+-----------+----------+-------+
|         1 | Rose     | 10.00 |
|         2 | Tulip    | 15.00 |
|         3 | Daisy    |  7.50 |
|         4 | Lily     | 12.00 |
+-----------+----------+-------+
4 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> CALL GetProductsBasedOnPrice(12.00);
+-----------+----------+-------+
| ProductID | ItemName | Price |
+-----------+----------+-------+
|         1 | Rose     | 10.00 |
|         3 | Daisy    |  7.50 |
|         4 | Lily     | 12.00 |
+-----------+----------+-------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> CALL GetProductsByCriteria(8.00, 15.00);
+-----------+----------+-------+
| ProductID | ItemName | Price |
+-----------+----------+-------+
|         1 | Rose     | 10.00 |
|         2 | Tulip    | 15.00 |
|         4 | Lily     | 12.00 |
+-----------+----------+-------+
3 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> */