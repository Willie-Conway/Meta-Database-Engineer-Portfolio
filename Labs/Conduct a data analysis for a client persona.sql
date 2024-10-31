/*coder@692d71927451:~/project$ mysql
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
    ClientID VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(100),
    ContactNumber INT,
    AddressID INT
);

CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    BuyPrice DECIMAL(6,2),
    SellPrice DECIMAL(6,2),
    NumberOfItems INT
);

    ->     ClientID VARCHAR(10) PRIMARY KEY,
    ->     FullName VARCHAR(100),
    ->     ContactNumber INT,
    ->     AddressID INT
    -> );
ucts (
    ProductID VARCHAR(10) PRIMARY KEY,
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

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    JobTitle VARCHAR(50),
    Department VARCHAR(200),
    AddressID INT
);

CREATE TABLE Activity (
    ActivityID INT PRIMARY KEY,
    Properties JSON
);

CREATE TABLE Audit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDateTime TIMESTAMP NOT NULL
);

CREATE TABLE Orders (
    OrderID INT NOT NULL PRIMARY KEY,
    ClientID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    Cost DECIMAL(6,2),
    Date DATE,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Notifications (
    NotificationID INT AUTO_INCREMENT PRIMARY KEY,
    Notification VARCHAR(256),
    DateTime TIMESTAMP NOT NULL
);
Query OK, 0 rows affected (0.15 sec)

mysql> 
mysql> CREATE TABLE Products (
    ->     ProductID VARCHAR(10) PRIMARY KEY,
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
Query OK, 0 rows affected (0.14 sec)

mysql> 
mysql> CREATE TABLE Employees (
    ->     EmployeeID INT PRIMARY KEY,
    ->     FullName VARCHAR(100),
    ->     JobTitle VARCHAR(50),
    ->     Department VARCHAR(200),
    ->     AddressID INT
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> 
mysql> CREATE TABLE Activity (
    ->     ActivityID INT PRIMARY KEY,
    ->     Properties JSON
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> 
mysql> CREATE TABLE Audit (
    ->     AuditID INT AUTO_INCREMENT PRIMARY KEY,
    ->     OrderDateTime TIMESTAMP NOT NULL
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> 
mysql> CREATE TABLE Orders (
    ->     OrderID INT NOT NULL PRIMARY KEY,
    ->     ClientID VARCHAR(10),
    ->     ProductID VARCHAR(10),
    ->     Quantity INT,
    ->     Cost DECIMAL(6,2),
    ->     Date DATE,
    ->     FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    ->     FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
    -> );
Query OK, 0 rows affected (0.22 sec)

mysql> 
mysql> CREATE TABLE Notifications (
    ->     NotificationID INT AUTO_INCREMENT PRIMARY KEY,
    ->     Notification VARCHAR(256),
    ->     DateTime TIMESTAMP NOT NULL
    -> );
Query OK, 0 rows affected (0.20 sec)

mysql> INSERT INTO Employees (EmployeeID, FullName, JobTitle, Department, AddressID) VALUES
    ->     (1, "Seamus Hogan", "Manager", "Management", 7),
    ->     (2, "Thomas Eriksson", "Assistant", "Sales", 8),
    ->     (3, "Simon Tolo", "Head Chef", "Management", 9),
    ->     (4, "Francesca Soffia", "Assistant", "Human Resources", 10),
    ->     (5, "Emily Sierra", "Accountant", "Finance", 11),
    ->     (6, "Greta Galkina", "Accountant", "Finance", 12);
D, Properties) VALUES
    (1, '{ "ClientID": "Cl1", "ProductID": "P1", "Order": "True" }'),
    (2, '{ "ClientID": "Cl2", "ProductID": "P4", "Order": Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Activity (ActivityID, Properties) VALUES
    ->     (1, '{ "ClientID": "Cl1", "ProductID": "P1", "Order": "True" }'),
    ->     (2, '{ "ClientID": "Cl2", "ProductID": "P4", "Order": "False" }'),
    ->     (3, '{ "ClientID": "Cl5", "ProductID": "P5", "Order": "True" }');
nts (ClientID, FullName, ContactNumber, AddressID) VALUES
    ("Cl1", "Takashi Ito", 351786345, 1),
    ("Cl2", "Jane Murphy", 351567243, 2),
    ("ClQuery OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Clients (ClientID, FullName, ContactNumber, AddressID) VALUES
    ->     ("Cl1", "Takashi Ito", 351786345, 1),
    ->     ("Cl2", "Jane Murphy", 351567243, 2),
    ->     ("Cl3", "Laurina Delgado", 351342597, 3),
    ->     ("Cl4", "Benjamin Clauss", 351342509, 4),
    ->     ("Cl5", "Altay Ayhan", 351208983, 5),
    ->     ("Cl6", "Greta Galkina", 351298755, 6);
ID, ProductName, BuyPrice, SellPrice, NumberOfItemQuery OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfItems) VALUES
    ->     ("P1", "Artificial grass bags", 40, 50, 100),
    ->     ("P2", "Wood panels", 15, 20, 250),
    ->     ("P3", "Patio slates", 35, 40, 60),
    ->     ("P4", "Sycamore trees", 7, 10, 50),
    ->     ("P5", "Trees and Shrubs", 35, 50, 75),
    ->     ("P6", "Water fountain", 65, 80, 15);
, Street, County) VALUES
    (1, "291 Oak Wood Avenue", "Graham County"),
    (2, "724 Greenway DrivQuery OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Addresses (AddressID, Street, County) VALUES
    ->     (1, "291 Oak Wood Avenue", "Graham County"),
    ->     (2, "724 Greenway Drive", "Pinal County"),
    ->     (3, "102 Sycamore Lane", "Santa Cruz County"),
    ->     (4, "125 Roselawn Close", "Gila County"),
    ->     (5, "831 Beechwood Terrace", "Cochise County"),
    ->     (6, "755 Palm Tree Hills", "Mohave County"),
    ->     (7, "751 Waterfall Hills", "Tuscon County"),
    ->     (8, "878 Riverside Lane", "Tuscon County"),
    ->     (9, "908 Seaview Hills", "Tuscon County"),
    ->     (10, "243 Waterview Terrace", "Tuscon County"),
    ->     (11, "148 Riverview Lane", "Tuscon County"),
    ->     (12, "178 Seaview Avenue", "Tuscon County");
D, ProductID, Quantity, Cost, Date) VALUES
    (1, "Cl1", "P1", 10, 500, "2020-09-01"),
    (2, "Cl2", "P2", 5, 100, "2020-09-05"),
    (3, "Cl3", "P3Query OK, 12 rows affected (0.02 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date) VALUES
    ->     (1, "Cl1", "P1", 10, 500, "2020-09-01"),
    ->     (2, "Cl2", "P2", 5, 100, "2020-09-05"),
    ->     (3, "Cl3", "P3", 20, 800, "2020-09-03"),
    ->     (4, "Cl4", "P4", 15, 150, "2020-09-07"),
    ->     (5, "Cl3", "P3", 10, 450, "2020-09-08"),
    ->     (6, "Cl2", "P2", 5, 800, "2020-09-09"),
    ->     (7, "Cl1", "P4", 22, 1200, "2020-09-10"),
    ->     (8, "Cl3", "P1", 15, 150, "2020-09-10"),
    ->     (9, "Cl1", "P1", 10, 500, "2020-09-12"),
    ->     (10, "Cl2", "P2", 5, 100, "2020-09-13"),
    ->     (11, "Cl4", "P5", 5, 100, "2020-09-15"),
    ->     (12, "Cl1", "P1", 10, 500, "2022-09-01"),
    ->     (13, "Cl2", "P2", 5, 100, "2022-09-05"),
    ->     (14, "Cl3", "P3", 20, 800, "2022-09-03"),
    ->     (15, "Cl4", "P4", 15, 150, "2022-09-07"),
    ->     (16, "Cl3", "P3", 10, 450, "2022-09-08"),
    ->     (17, "Cl2", "P2", 5, 800, "2022-09-09"),
    ->     (18, "Cl1", "P4", 22, 1200, "2022-09-10"),
    ->     (19, "Cl3", "P1", 15, 150, "2022-09-10"),
    ->     (20, "Cl1", "P1", 10, 500, "2022-09-12"),
    ->     (21, "Cl2", "P2", 5, 100, "2022-09-13"),
    ->     (22, "Cl2", "P1", 10, 500, "2021-09-01"),
    ->     (23, "Cl2", "P2", 5, 100, "2021-09-05"),
    ->     (24, "Cl3", "P3", 20, 800, "2021-09-03"),
    ->     (25, "Cl4", "P4", 15, 150, "2021-09-07"),
    ->     (26, "Cl1", "P3", 10, 450, "2021-09-08"),
    ->     (27, "Cl2", "P1", 20, 1000, "2022-09-01"),
    ->     (28, "Cl2", "P2", 10, 200, "2022-09-05"),
    ->     (29, "Cl3", "P3", 20, 800, "2021-09-03"),
    ->     (30, "Cl1", "P1", 10, 500, "2022-09-01");
Query OK, 30 rows affected (0.01 sec)
Records: 30  Duplicates: 0  Warnings: 0

mysql> -- Verify Clients
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

mysql> 
mysql> -- Verify Products
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

mysql> 
mysql> -- Verify Orders
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

mysql> 
mysql> -- Verify Addresses
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
|         7 | 751 Waterfall Hills   | Tuscon County     |
|         8 | 878 Riverside Lane    | Tuscon County     |
|         9 | 908 Seaview Hills     | Tuscon County     |
|        10 | 243 Waterview Terrace | Tuscon County     |
|        11 | 148 Riverview Lane    | Tuscon County     |
|        12 | 178 Seaview Avenue    | Tuscon County     |
+-----------+-----------------------+-------------------+
12 rows in set (0.00 sec)

mysql> 
mysql> -- Verify Employees
mysql> SELECT * FROM Employees;
+------------+------------------+------------+-----------------+-----------+
| EmployeeID | FullName         | JobTitle   | Department      | AddressID |
+------------+------------------+------------+-----------------+-----------+
|          1 | Seamus Hogan     | Manager    | Management      |         7 |
|          2 | Thomas Eriksson  | Assistant  | Sales           |         8 |
|          3 | Simon Tolo       | Head Chef  | Management      |         9 |
|          4 | Francesca Soffia | Assistant  | Human Resources |        10 |
|          5 | Emily Sierra     | Accountant | Finance         |        11 |
|          6 | Greta Galkina    | Accountant | Finance         |        12 |
+------------+------------------+------------+-----------------+-----------+
6 rows in set (0.00 sec)

mysql> 
mysql> -- Verify Activity
mysql> CALL EvaluateProduct('P1', @sold_items_2020, @sold_items_2021, @sold_items_2022);
ERROR 1305 (42000): PROCEDURE Lucky_Shrub.EvaluateProduct does not exist
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE EvaluateProduct(
    ->     IN product_id VARCHAR(10),
    ->     OUT sold_items_2020 INT,
    ->     OUT sold_items_2021 INT,
    ->     OUT sold_items_2022 INT
    -> )
    -> BEGIN
    ->     -- Initialize output variables
    ->     SET sold_items_2020 = 0;
    ->     SET sold_items_2021 = 0;
    ->     SET sold_items_2022 = 0;
    -> 
    ->     -- Calculate total items sold in 2020
    ->     SELECT COALESCE(SUM(Quantity), 0) INTO sold_items_2020
    ->     FROM Orders
    ->     WHERE ProductID = product_id AND YEAR(Date) = 2020;
    -> 
    ->     -- Calculate total items sold in 2021
    ->     SELECT COALESCE(SUM(Quantity), 0) INTO sold_items_2021
    ->     FROM Orders
    ->     WHERE ProductID = product_id AND YEAR(Date) = 2021;
    -> 
    ->     -- Calculate total items sold in 2022
    ->     SELECT COALESCE(SUM(Quantity), 0) INTO sold_items_2022
    ->     FROM Orders
    ->     WHERE ProductID = product_id AND YEAR(Date) = 2022;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELIMITER ;
mysql> -- Declare variables to hold the results
mysql> CALL EvaluateProduct('P1', @sold_items_2020, @sold_items_2021, @sold_items_2022);
Query OK, 1 row affected (0.00 sec)

mysql> 
mysql> -- Retrieve the results
mysql> SELECT @sold_items_2020 AS SoldItems2020,
    ->        @sold_items_2021 AS SoldItems2021,
    ->        @sold_items_2022 AS SoldItems2022;
+---------------+---------------+---------------+
| SoldItems2020 | SoldItems2021 | SoldItems2022 |
+---------------+---------------+---------------+
|            35 |            10 |            65 |
+---------------+---------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT @sold_items_2020, @sold_items_2021, @sold_items_2022;
+------------------+------------------+------------------+
| @sold_items_2020 | @sold_items_2021 | @sold_items_2022 |
+------------------+------------------+------------------+
|               35 |               10 |               65 |
+------------------+------------------+------------------+
1 row in set (0.00 sec)

mysql> SELECT Employees.FullName, Addresses.Street, Addresses.County 
    -> FROM Employees INNER JOIN Addresses 
    -> ON Employees.AddressID = Addresses.AddressID
    -> UNION
    -> SELECT Clients.FullName, Addresses.Street, Addresses.County 
    -> FROM Clients INNER JOIN Addresses ON Clients.AddressID = Addresses.AddressID 
    -> ORDER BY Street;
+------------------+-----------------------+-------------------+
| FullName         | Street                | County            |
+------------------+-----------------------+-------------------+
| Laurina Delgado  | 102 Sycamore Lane     | Santa Cruz County |
| Benjamin Clauss  | 125 Roselawn Close    | Gila County       |
| Emily Sierra     | 148 Riverview Lane    | Tuscon County     |
| Greta Galkina    | 178 Seaview Avenue    | Tuscon County     |
| Francesca Soffia | 243 Waterview Terrace | Tuscon County     |
| Takashi Ito      | 291 Oak Wood Avenue   | Graham County     |
| Jane Murphy      | 724 Greenway Drive    | Pinal County      |
| Seamus Hogan     | 751 Waterfall Hills   | Tuscon County     |
| Greta Galkina    | 755 Palm Tree Hills   | Mohave County     |
| Altay Ayhan      | 831 Beechwood Terrace | Cochise County    |
| Thomas Eriksson  | 878 Riverside Lane    | Tuscon County     |
| Simon Tolo       | 908 Seaview Hills     | Tuscon County     |
+------------------+-----------------------+-------------------+
12 rows in set (0.00 sec)

mysql> WITH
    -> P2_Sales_2020 AS (SELECT CONCAT(SUM(Cost), " (2020)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR(Date) = 2020 AND ProductID= "P2"),
    -> P2_Sales_2021 AS (SELECT CONCAT(SUM(Cost), " (2021)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR(Date) = 2021 AND ProductID= "P2"),
    -> P2_Sales_2022 AS (SELECT CONCAT(SUM(Cost), " (2022)") AS "Total sum of P2 Product" FROM Orders WHERE YEAR(Date) = 2022 AND ProductID= "P2")
    -> SELECT * FROM P2_Sales_2020
    -> UNION
    -> SELECT * FROM P2_Sales_2021
    -> UNION
    -> SELECT * FROM P2_Sales_2022;
+-------------------------+
| Total sum of P2 Product |
+-------------------------+
| 1000.00 (2020)          |
| 100.00 (2021)           |
| 1200.00 (2022)          |
+-------------------------+
3 rows in set (0.00 sec)

mysql> SELECT Activity.Properties ->>'$.ClientID' 
    -> AS ClientID, Activity.Properties ->>'$.ProductID' 
    -> AS ProductID, Clients.FullName, Clients.ContactNumber 
    -> FROM Clients RIGHT JOIN Activity 
    -> ON Clients.ClientID = Activity.Properties ->>'$.ClientID';
+----------+-----------+-------------+---------------+
| ClientID | ProductID | FullName    | ContactNumber |
+----------+-----------+-------------+---------------+
| Cl1      | P1        | Takashi Ito |     351786345 |
| Cl2      | P4        | Jane Murphy |     351567243 |
| Cl5      | P5        | Altay Ayhan |     351208983 |
+----------+-----------+-------------+---------------+
3 rows in set (0.00 sec)

mysql> CALL GetProfit('P1', 2020);
ERROR 1305 (42000): PROCEDURE Lucky_Shrub.GetProfit does not exist
mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetProfit(
    ->     IN product_id VARCHAR(10),
    ->     IN YearInput INT
    -> )
    -> BEGIN
    ->     DECLARE profit DECIMAL(7,2) DEFAULT 0.0;
    ->     DECLARE sold_quantity INT DEFAULT 0;
    ->     DECLARE buy_price DECIMAL(6,2) DEFAULT 0.0;
    ->     DECLARE sell_price DECIMAL(6,2) DEFAULT 0.0;
    -> 
    ->     -- Get the total quantity sold in the given year
    ->     SELECT SUM(Quantity) INTO sold_quantity
    ->     FROM Orders
    ->     WHERE ProductID = product_id AND YEAR(Date) = YearInput;
    -> 
    ->     -- Get the buy price of the product
    ->     SELECT BuyPrice INTO buy_price
    ->     FROM Products
    ->     WHERE ProductID = product_id;
    -> 
    ->     -- Get the sell price of the product
    ->     SELECT SellPrice INTO sell_price
    ->     FROM Products
    ->     WHERE ProductID = product_id;
    -> 
    ->     -- Calculate the profit
    ->     SET profit = (sell_price * sold_quantity) - (buy_price * sold_quantity);
    -> 
    ->     -- Output the profit
    ->     SELECT profit AS TotalProfit;
    -> END //
ER ;
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> DELIMITER ;
mysql> CALL GetProfit('P1', 2020);
+-------------+
| TotalProfit |
+-------------+
|      350.00 |
+-------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM Activity;
+------------+----------------------------------------------------------+
| ActivityID | Properties                                               |
+------------+----------------------------------------------------------+
|          1 | {"Order": "True", "ClientID": "Cl1", "ProductID": "P1"}  |
|          2 | {"Order": "False", "ClientID": "Cl2", "ProductID": "P4"} |
|          3 | {"Order": "True", "ClientID": "Cl5", "ProductID": "P5"}  |
+------------+----------------------------------------------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Audit;
Empty set (0.01 sec)

mysql> SELECT FindAverageCost(2022);
ERROR 1305 (42000): FUNCTION Lucky_Shrub.FindAverageCost does not exist
mysql> CREATE FUNCTION FindAverageCost(YearInput INT) 
    -> RETURNS DECIMAL(10,2) DETERMINISTIC 
    -> RETURN (SELECT AVG(Cost) FROM Orders WHERE YEAR(Date) = YearInput); 
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT FindAverageCost(2022);+-----------------------+
| FindAverageCost(2022) |
+-----------------------+
|                496.15 |
+-----------------------+
1 row in set, 1 warning (0.00 sec)

mysql> CREATE TRIGGER UpdateAudit AFTER INSERT 
    -> ON Orders 
    -> FOR EACH ROW 
    -> INSERT INTO Audit (OrderDateTime) 
    -> VALUES (Current_timestamp);
Query OK, 0 rows affected (0.02 sec)

mysql> SELECT * FROM Audit;Empty set (0.00 sec)

mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date)
    -> VALUES (31, 'Cl1', 'P2', 10, 200, '2023-09-10');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Audit;
+---------+---------------------+
| AuditID | OrderDateTime       |
+---------+---------------------+
|       1 | 2024-09-11 02:30:19 |
+---------+---------------------+
1 row in set (0.00 sec)

mysql> -- Insert three new records into Orders
mysql> INSERT INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost, Date)
    -> VALUES 
    -> (32, 'Cl2', 'P3', 5, 250, '2023-09-11'), 
    -> (33, 'Cl3', 'P4', 8, 320, '2023-09-12'), 
    -> (34, 'Cl4', 'P5', 7, 420, '2023-09-13');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> -- Retrieve all records from the Audit table
mysql> SELECT * FROM Audit;
+---------+---------------------+
| AuditID | OrderDateTime       |
+---------+---------------------+
|       1 | 2024-09-11 02:30:19 |
|       2 | 2024-09-11 02:31:29 |
|       3 | 2024-09-11 02:31:29 |
|       4 | 2024-09-11 02:31:29 |
+---------+---------------------+
4 rows in set (0.00 sec)

mysql> */