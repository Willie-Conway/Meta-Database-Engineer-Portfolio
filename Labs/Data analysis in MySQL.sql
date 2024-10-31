/*coder@f0dec1544eb7:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS Lucky_Shrub;
Query OK, 1 row affected (0.03 sec)

mysql> USE Lucky_Shrub;
Database changed
mysql> CREATE TABLE Clients (
    ->     ClientID VARCHAR(10), 
    ->     FullName VARCHAR(100),  
    ->     ContactNumber INT, 
    ->     AddressID INT
    -> );
 OrderID INT NOT NULL PRIMARY KEY, 
    ClientID VARCHAR(10),  
    ProductID VARCHAR(10),  
    Quantity INT, 
    Cost DECIMAL(6,2), 
    Date DATE
);

CREATE TABLE Products (
    ProductID VARCHAR(10), 
    ProductName VARCHAR(100),  
    BuyPrice DECIMAL(6,2), 
    SellPrice DECIMAL(6,2), 
    NumberOfItems INT
);

CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY, 
    Street VARCHAR(255), 
    County VARCHAR(100)
);
Query OK, 0 rows affected (0.19 sec)

mysql> 
mysql> CREATE TABLE Orders (
    ->     OrderID INT NOT NULL PRIMARY KEY, 
    ->     ClientID VARCHAR(10),  
    ->     ProductID VARCHAR(10),  
    ->     Quantity INT, 
    ->     Cost DECIMAL(6,2), 
    ->     Date DATE
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> 
mysql> CREATE TABLE Products (
    ->     ProductID VARCHAR(10), 
    ->     ProductName VARCHAR(100),  
    ->     BuyPrice DECIMAL(6,2), 
    ->     SellPrice DECIMAL(6,2), 
    ->     NumberOfItems INT
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> 
mysql> CREATE TABLE Addresses (
    ->     AddressID INT PRIMARY KEY, 
    ->     Street VARCHAR(255), 
    ->     County VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> INSERT INTO Clients (ClientID, FullName, ContactNumber, AddressID) VALUES 
    -> ('Cl1', 'Takashi Ito', 351786345, 1), 
    -> ('Cl2', 'Jane Murphy', 351567243, 2), 
    -> ('Cl3', 'Laurina Delgado', 351342597, 3), 
    -> ('Cl4', 'Benjamin Clauss', 351342509, 4), 
    -> ('Cl5', 'Altay Ayhan', 351208983, 5), 
    -> ('Cl6', 'Greta Galkina', 351298755, 6);
Query OK, 6 rows affected (0.03 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date) VALUES 
    -> (1, 'Cl1', 'P1', 10, 500, '2020-09-01'), 
    -> (2, 'Cl2', 'P2', 5, 100, '2020-09-05'), 
    -> (3, 'Cl3', 'P3', 20, 800, '2020-09-03'), 
    -> (4, 'Cl4', 'P4', 15, 150, '2020-09-07'), 
    -> (5, 'Cl3', 'P3', 10, 450, '2020-09-08'), 
    -> (6, 'Cl2', 'P2', 5, 800, '2020-09-09'), 
    -> (7, 'Cl1', 'P4', 22, 1200, '2020-09-10'), 
    -> (8, 'Cl3', 'P1', 15, 150, '2020-09-10'), 
    -> (9, 'Cl1', 'P1', 10, 500, '2020-09-12'), 
    -> (10, 'Cl2', 'P2', 5, 100, '2020-09-13'), 
    -> (11, 'Cl4', 'P5', 5, 100, '2020-09-15'),
    -> (12, 'Cl1', 'P1', 10, 500, '2022-09-01'), 
    -> (13, 'Cl2', 'P2', 5, 100, '2022-09-05'), 
    -> (14, 'Cl3', 'P3', 20, 800, '2022-09-03'), 
    -> (15, 'Cl4', 'P4', 15, 150, '2022-09-07'), 
    -> (16, 'Cl3', 'P3', 10, 450, '2022-09-08'), 
    -> (17, 'Cl2', 'P2', 5, 800, '2022-09-09'), 
    -> (18, 'Cl1', 'P4', 22, 1200, '2022-09-10'), 
    -> (19, 'Cl3', 'P1', 15, 150, '2022-09-10'), 
    -> (20, 'Cl1', 'P1', 10, 500, '2022-09-12'), 
    -> (21, 'Cl2', 'P2', 5, 100, '2022-09-13'),  
    -> (22, 'Cl2', 'P1', 10, 500, '2021-09-01'), 
    -> (23, 'Cl2', 'P2', 5, 100, '2021-09-05'), 
    -> (24, 'Cl3', 'P3', 20, 800, '2021-09-03'), 
    -> (25, 'Cl4', 'P4', 15, 150, '2021-09-07'), 
    -> (26, 'Cl1', 'P3', 10, 450, '2021-09-08'), 
    -> (27, 'Cl2', 'P1', 20, 1000, '2022-09-01'), 
    -> (28, 'Cl2', 'P2', 10, 200, '2022-09-05'), 
    -> (29, 'Cl3', 'P3', 20, 800, '2021-09-03'), 
    -> (30, 'Cl1', 'P1', 10, 500, '2022-09-01');
Query OK, 30 rows affected (0.03 sec)
Records: 30  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems) VALUES 
    -> ('P1', 'Artificial grass bags', 40, 50, 100), 
    -> ('P2', 'Wood panels', 15, 20, 250), 
    -> ('P3', 'Patio slates', 35, 40, 60), 
    -> ('P4', 'Sycamore trees', 7, 10, 50), 
    -> ('P5', 'Trees and Shrubs', 35, 50, 75), 
    -> ('P6', 'Water fountain', 65, 80, 15);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Addresses (AddressID, Street, County) VALUES 
    -> (1, '291 Oak Wood Avenue', 'Graham County'), 
    -> (2, '724 Greenway Drive', 'Pinal County'), 
    -> (3, '102 Sycamore Lane', 'Santa Cruz County'), 
    -> (4, '125 Roselawn Close', 'Gila County'), 
    -> (5, '831 Beechwood Terrace', 'Cochise County'),
    -> (6, '755 Palm Tree Hills', 'Mohave County'), 
    -> (7, '751 Waterfall Hills', 'Tucson County'), 
    -> (8, '878 Riverside Lane', 'Tucson County'), 
    -> (9, '908 Seaview Hills', 'Tucson County'), 
    -> (10, '243 Waterview Terrace', 'Tucson County'), 
    -> (11, '148 Riverview Lane', 'Tucson County'),  
    -> (12, '178 Seaview Avenue', 'Tucson County');
Query OK, 12 rows affected (0.02 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> SELECT 
    ->     YEAR(Date) AS Year,
    ->     SUM(Quantity) AS TotalQuantity
    -> FROM 
    ->     Orders
    -> WHERE 
    ->     ProductID = 'P4'
    ->     AND YEAR(Date) IN (2020, 2021, 2022)
    -> GROUP BY 
    ->     YEAR(Date);
+------+---------------+
| Year | TotalQuantity |
+------+---------------+
| 2020 |            37 |
| 2022 |            37 |
| 2021 |            15 |
+------+---------------+
3 rows in set (0.00 sec)

mysql> SELECT 
    ->     c.ClientID,
    ->     c.ContactNumber,
    ->     a.Street,
    ->     a.County,
    ->     o.OrderID,
    ->     o.Cost,
    ->     o.Date AS OrderDate,
    ->     p.ProductName
    -> FROM 
    ->     Orders o
    -> JOIN 
    ->     Clients c ON o.ClientID = c.ClientID
    -> JOIN 
    ->     Addresses a ON c.AddressID = a.AddressID
    -> JOIN 
    ->     Products p ON o.ProductID = p.ProductID
    -> WHERE 
    ->     YEAR(o.Date) IN (2021, 2022)
    -> ORDER BY 
    ->     o.Date;
+----------+---------------+---------------------+-------------------+---------+---------+------------+-----------------------+
| ClientID | ContactNumber | Street              | County            | OrderID | Cost    | OrderDate  | ProductName           |
+----------+---------------+---------------------+-------------------+---------+---------+------------+-----------------------+
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      22 |  500.00 | 2021-09-01 | Artificial grass bags |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      24 |  800.00 | 2021-09-03 | Patio slates          |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      29 |  800.00 | 2021-09-03 | Patio slates          |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      23 |  100.00 | 2021-09-05 | Wood panels           |
| Cl4      |     351342509 | 125 Roselawn Close  | Gila County       |      25 |  150.00 | 2021-09-07 | Sycamore trees        |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      26 |  450.00 | 2021-09-08 | Patio slates          |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      27 | 1000.00 | 2022-09-01 | Artificial grass bags |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      30 |  500.00 | 2022-09-01 | Artificial grass bags |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      12 |  500.00 | 2022-09-01 | Artificial grass bags |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      14 |  800.00 | 2022-09-03 | Patio slates          |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      28 |  200.00 | 2022-09-05 | Wood panels           |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      13 |  100.00 | 2022-09-05 | Wood panels           |
| Cl4      |     351342509 | 125 Roselawn Close  | Gila County       |      15 |  150.00 | 2022-09-07 | Sycamore trees        |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      16 |  450.00 | 2022-09-08 | Patio slates          |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      17 |  800.00 | 2022-09-09 | Wood panels           |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      19 |  150.00 | 2022-09-10 | Artificial grass bags |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      18 | 1200.00 | 2022-09-10 | Sycamore trees        |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      20 |  500.00 | 2022-09-12 | Artificial grass bags |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      21 |  100.00 | 2022-09-13 | Wood panels           |
+----------+---------------+---------------------+-------------------+---------+---------+------------+-----------------------+
19 rows in set (0.00 sec)

mysql> DELIMITER //
mysql> 
mysql> CREATE FUNCTION FindSoldQuantity(productId VARCHAR(10), targetYear INT)
    -> RETURNS INT
    -> BEGIN
    ->     DECLARE totalQuantity INT;
    -> 
    ->     SELECT 
    ->         COALESCE(SUM(Quantity), 0) INTO totalQuantity
    ->     FROM 
    ->         Orders
    ->     WHERE 
    ->         ProductID = productId
    ->         AND YEAR(Date) = targetYear;
    -> 
    ->     RETURN totalQuantity;
    -> END //
;
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql> DELIMITER ;
mysql> SELECT FindSoldQuantity('P3', 2021) AS TotalQuantity;
+---------------+
| TotalQuantity |
+---------------+
|            80 |
+---------------+
1 row in set (0.01 sec)

mysql> SELECT * FROM Clients;
+----------+-----------------+---------------+-----------+
| ClientID | FullName        | ContactNumber | AddressID |
+----------+-----------------+---------------+-----------+
| Cl1      | Takashi Ito     |     351786345 |         1 |
| Cl2      | Jane Murphy     |     351567243 |         2 |
| Cl3      | Laurina Delgado |     351342597 |         3 |
| Cl4      | Benjamin Clauss |     351342509 |         4 |
| Cl5      | Altay Ayhan     |     351208983 |         5 |
| Cl6      | Greta Galkina   |     351298755 |         6 |
+----------+-----------------+---------------+-----------+
6 rows in set (0.00 sec)

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

mysql> SELECT * FROM Addresses;
+-----------+-----------------------+-------------------+
| AddressID | Street                | County            |
+-----------+-----------------------+-------------------+
|         1 | 291 Oak Wood Avenue   | Graham County     |
|         2 | 724 Greenway Drive    | Pinal County      |
|         3 | 102 Sycamore Lane     | Santa Cruz County |
|         4 | 125 Roselawn Close    | Gila County       |
|         5 | 831 Beechwood Terrace | Cochise County    |
|         6 | 755 Palm Tree Hills   | Mohave County     |
|         7 | 751 Waterfall Hills   | Tucson County     |
|         8 | 878 Riverside Lane    | Tucson County     |
|         9 | 908 Seaview Hills     | Tucson County     |
|        10 | 243 Waterview Terrace | Tucson County     |
|        11 | 148 Riverview Lane    | Tucson County     |
|        12 | 178 Seaview Avenue    | Tucson County     |
+-----------+-----------------------+-------------------+
12 rows in set (0.00 sec)

mysql> SELECT CONCAT (SUM(Quantity), "(2020)") AS "P4 product: Quantity sold" FROM Orders WHERE YEAR (Date) = 2020 AND ProductID = "P4"
    -> UNION 
    -> SELECT CONCAT (SUM(Quantity), "(2021)") FROM Orders WHERE YEAR (Date) = 2021 AND ProductID = "P4"
    -> UNION 
    -> SELECT CONCAT (SUM(Quantity), "(2022)") FROM Orders WHERE YEAR (Date) = 2022 AND ProductID = "P4"; 
+---------------------------+
| P4 product: Quantity sold |
+---------------------------+
| 37(2020)                  |
| 15(2021)                  |
| 37(2022)                  |
+---------------------------+
3 rows in set (0.00 sec)

mysql> SELECT Clients.ClientID, Clients.ContactNumber, Addresses.Street, Addresses.County,  Orders.OrderID, Orders.ProductID, Products.ProductName, Orders.Cost, Orders.Date 
    -> FROM Clients 
    -> INNER JOIN Addresses ON Clients.AddressID = Addresses.AddressID 
    -> INNER JOIN Orders ON Clients.ClientID = Orders.ClientID 
    -> INNER JOIN Products ON Orders.ProductID = Products.ProductID 
    -> WHERE YEAR (Orders.Date) = 2021 OR YEAR (Orders.Date) = 2022 ORDER BY Orders.Date;
+----------+---------------+---------------------+-------------------+---------+-----------+-----------------------+---------+------------+
| ClientID | ContactNumber | Street              | County            | OrderID | ProductID | ProductName           | Cost    | Date       |
+----------+---------------+---------------------+-------------------+---------+-----------+-----------------------+---------+------------+
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      22 | P1        | Artificial grass bags |  500.00 | 2021-09-01 |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      24 | P3        | Patio slates          |  800.00 | 2021-09-03 |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      29 | P3        | Patio slates          |  800.00 | 2021-09-03 |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      23 | P2        | Wood panels           |  100.00 | 2021-09-05 |
| Cl4      |     351342509 | 125 Roselawn Close  | Gila County       |      25 | P4        | Sycamore trees        |  150.00 | 2021-09-07 |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      26 | P3        | Patio slates          |  450.00 | 2021-09-08 |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      27 | P1        | Artificial grass bags | 1000.00 | 2022-09-01 |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      30 | P1        | Artificial grass bags |  500.00 | 2022-09-01 |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      12 | P1        | Artificial grass bags |  500.00 | 2022-09-01 |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      14 | P3        | Patio slates          |  800.00 | 2022-09-03 |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      28 | P2        | Wood panels           |  200.00 | 2022-09-05 |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      13 | P2        | Wood panels           |  100.00 | 2022-09-05 |
| Cl4      |     351342509 | 125 Roselawn Close  | Gila County       |      15 | P4        | Sycamore trees        |  150.00 | 2022-09-07 |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      16 | P3        | Patio slates          |  450.00 | 2022-09-08 |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      17 | P2        | Wood panels           |  800.00 | 2022-09-09 |
| Cl3      |     351342597 | 102 Sycamore Lane   | Santa Cruz County |      19 | P1        | Artificial grass bags |  150.00 | 2022-09-10 |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      18 | P4        | Sycamore trees        | 1200.00 | 2022-09-10 |
| Cl1      |     351786345 | 291 Oak Wood Avenue | Graham County     |      20 | P1        | Artificial grass bags |  500.00 | 2022-09-12 |
| Cl2      |     351567243 | 724 Greenway Drive  | Pinal County      |      21 | P2        | Wood panels           |  100.00 | 2022-09-13 |
+----------+---------------+---------------------+-------------------+---------+-----------+-----------------------+---------+------------+
19 rows in set (0.00 sec)

mysql> CREATE FUNCTION FindSoldQuantity (product_id VARCHAR(10), YearInput INT) returns INT DETERMINISTIC RETURN (SELECT SUM(Quantity) FROM Orders WHERE ProductID = product_id AND YEAR (Date) = YearInput);
ERROR 1304 (42000): FUNCTION FindSoldQuantity already exists
mysql> SELECT FindSoldQuantity ("P3", 2021);
+-------------------------------+
| FindSoldQuantity ("P3", 2021) |
+-------------------------------+
|                            80 |
+-------------------------------+
1 row in set (0.00 sec)

mysql> */