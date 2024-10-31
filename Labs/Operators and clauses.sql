/*coder@c4d78d406d83:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE luckyshrub_db; 
USE luckyshrub_db;
CREATE TABLE employees (
  EmployeeID int NOT NULL,
  EmployeeName varchar(150) DEFAULT NULL,
  Department varchar(150) DEFAULT NULL,
  ContactNo varchar(12) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  AnnualSalary int DEFAULT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE orders (
  OrderID int NOT NULL,
  Department varchar(100) DEFAULT NULL,
  OrderDate date DEFAULT NULL,
  OrderQty int DEFAULT NULL,
  OrderTotal int DEFAULT NULL,
  PRIMARY KEY (OrderID)
);

CREATE TABLE employee_orders (
 OrderID int NOT NULL,
 EmployeeID int NOT NULL,
 Status VARCHAR(150),
 HandlingCost int DEFAULT NULL,
 PRIMARY KEY (EmployeeID,OrderID),
 FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
 FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);

INSERT INTO employees VALUES 
(1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
(2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@luckyshrub.com',75000), 
(3,'Simon Tolo', 'Marketing', '351930582','Simon.t@luckyshrub.com',40000), 
(4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@luckyshrub.com',45000), 
(5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@luckyshrub.com',35000), 
(6,'Maria Carter', 'Human Resources', '351022508','Maria.c@luckyshrub.com',55000),
(7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);

INSERT INTO orders VALUES(1,'Lawn Care','2022-05-05',12,500),
(2,'Decking','2022-05-22',150,1450),
(3,'Compost and Stones','2022-05-27',20,780),
ERROR 1007 (HY000): Can't create database 'luckyshrub_db'; database exists
mysql> USE luckyshrub_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> CREATE TABLE employees (
    ->   EmployeeID int NOT NULL,
    ->   EmployeeName varchar(150) DEFAULT NULL,
    ->   Department varchar(150) DEFAULT NULL,
    ->   ContactNo varchar(12) DEFAULT NULL,
    ->   Email varchar(100) DEFAULT NULL,
    ->   AnnualSalary int DEFAULT NULL,
    ->   PRIMARY KEY (EmployeeID)
    -> );
rID int NOT NULL,
  Department varchar(100) DEFAULT NULL,
  OrderDate date DEFAULT NULL,
  OrderQty int DEFAULT NULL,
  OrderTotal int DEFAULT NULL,
  PRIMARY KEY (OrderID)
);

CREATE TABLE employee_orders (
 OrderID int NOT NULL,
 EmployeeID int NOT NULL,
 Status VARCHAR(150),
 HandlingCost int DEFAULT NULL,
 PRIMARY KEY (EmployeeID,OrderID),
 FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
 FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);

INSERT INTO employees VALUES 
(1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
(2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@luckyshrub.com',75000), 
(3,'Simon Tolo', 'Marketing', '351930582','Simon.t@luckyshrub.com',40000), 
(4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@luckyshrub.com',45000), 
(5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@luckyshrub.com',35000), 
(6,'Maria Carter', 'Human Resources', '351022508','Maria.c@luckyshrub.com',55000),
(7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);

INSERT INTO orders VALUES(1,'Lawn Care','2022-05-05',12,500),
(2,'Decking','2022-05-22',150,1450),
(3,'Compost and Stones','2022-05-27',20,780),
(4,'Trees and Shrubs','2022-06-01',15,400),
(5,'Garden Decor','2022-06-10',2,1250),
(6,'Lawn Care','2022-06-10',12,500),
(7,'Decking','2022-06-25',150,1450),
(8,'Compost and Stones','2022-05-29',20,7Query OK, 0 rows affected (0.14 sec)

mysql> 
mysql> CREATE TABLE orders (
    ->   OrderID int NOT NULL,
    ->   Department varchar(100) DEFAULT NULL,
    ->   OrderDate date DEFAULT NULL,
    ->   OrderQty int DEFAULT NULL,
    ->   OrderTotal int DEFAULT NULL,
    ->   PRIMARY KEY (OrderID)
    -> );
80),
(9,'Trees and Shrubs','2022-06-10',15,400),
(10,'Garden Decor','2022-06-10',2,1250),
(11,'Lawn Care','2022-06-25',10,400), 
(12,'Decking','2022-06-25',100,1400),
(13,'Compost and Stones','2022-05-30',15,700), 
(14,'Trees and Shrubs','2022-06-15',10,300), 
(15,'Garden Decor','2022-06-11',2,1250),
(16,'Lawn Care','2022-06-10',12,500), 
(17,'Decking','2022-06-25',150,1450), 
(18,'Trees and Shrubs','2022-06-10',15,400), 
(19,'Lawn Care','2022-06-10',12,500), 
(20,'Decking','2022-06-25',150,1450), 
(21,'Decking','2022-06-25',150,1450); 

INSERT INTO employee_orders 
VALUES(1,3,"In Progress",200), 
(1,5,"Not Recieved",300), 
(1,4,"Not Recieved",250), 
(2,3,"Completed",200), 
(2,5,"Completed",300), 
(2,4,"In Progress",250), 
(3,3,"In Progress",200), 
(3,5,"Not Recieved",300), 
(3,4,"Not Recieved",250), 
(4,3,"Completed",200), 
(4,5,"In Progress",300), 
(4,4,"In Progress",250), 
(5,3,"Completed",200), 
(5,5,"In Progress",300), 
(5,4,"Not Recieved",250), 
(11,3,"Completed",200), 
(11,5,"Completed",300), 
(11,4,"Not Recieved",250), 
(14,3,"Completed",200), 
(14,5,"Not Recieved",300), 
(14,4,"Not Recieved",250); Query OK, 0 rows affected (0.15 sec)

mysql> 
mysql> CREATE TABLE employee_orders (
    ->  OrderID int NOT NULL,
    ->  EmployeeID int NOT NULL,
    ->  Status VARCHAR(150),
    ->  HandlingCost int DEFAULT NULL,
    ->  PRIMARY KEY (EmployeeID,OrderID),
    ->  FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    ->  FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
    -> );
Query OK, 0 rows affected (0.18 sec)

mysql> 
mysql> INSERT INTO employees VALUES 
    -> (1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
    -> (2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@luckyshrub.com',75000), 
    -> (3,'Simon Tolo', 'Marketing', '351930582','Simon.t@luckyshrub.com',40000), 
    -> (4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@luckyshrub.com',45000), 
    -> (5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@luckyshrub.com',35000), 
    -> (6,'Maria Carter', 'Human Resources', '351022508','Maria.c@luckyshrub.com',55000),
    -> (7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);
Query OK, 7 rows affected (0.02 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO orders VALUES(1,'Lawn Care','2022-05-05',12,500),
    -> (2,'Decking','2022-05-22',150,1450),
    -> (3,'Compost and Stones','2022-05-27',20,780),
    -> (4,'Trees and Shrubs','2022-06-01',15,400),
    -> (5,'Garden Decor','2022-06-10',2,1250),
    -> (6,'Lawn Care','2022-06-10',12,500),
    -> (7,'Decking','2022-06-25',150,1450),
    -> (8,'Compost and Stones','2022-05-29',20,780),
    -> (9,'Trees and Shrubs','2022-06-10',15,400),
    -> (10,'Garden Decor','2022-06-10',2,1250),
    -> (11,'Lawn Care','2022-06-25',10,400), 
    -> (12,'Decking','2022-06-25',100,1400),
    -> (13,'Compost and Stones','2022-05-30',15,700), 
    -> (14,'Trees and Shrubs','2022-06-15',10,300), 
    -> (15,'Garden Decor','2022-06-11',2,1250),
    -> (16,'Lawn Care','2022-06-10',12,500), 
    -> (17,'Decking','2022-06-25',150,1450), 
    -> (18,'Trees and Shrubs','2022-06-10',15,400), 
    -> (19,'Lawn Care','2022-06-10',12,500), 
    -> (20,'Decking','2022-06-25',150,1450), 
    -> (21,'Decking','2022-06-25',150,1450); 
Query OK, 21 rows affected (0.03 sec)
Records: 21  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO employee_orders 
    -> VALUES(1,3,"In Progress",200), 
    -> (1,5,"Not Recieved",300), 
    -> (1,4,"Not Recieved",250), 
    -> (2,3,"Completed",200), 
    -> (2,5,"Completed",300), 
    -> (2,4,"In Progress",250), 
    -> (3,3,"In Progress",200), 
    -> (3,5,"Not Recieved",300), 
    -> (3,4,"Not Recieved",250), 
    -> (4,3,"Completed",200), 
    -> (4,5,"In Progress",300), 
    -> (4,4,"In Progress",250), 
    -> (5,3,"Completed",200), 
    -> (5,5,"In Progress",300), 
    -> (5,4,"Not Recieved",250), 
    -> (11,3,"Completed",200), 
    -> (11,5,"Completed",300), 
    -> (11,4,"Not Recieved",250), 
    -> (14,3,"Completed",200), 
    -> (14,5,"Not Recieved",300), 
    -> (14,4,"Not Recieved",250); 
Query OK, 21 rows affected (0.02 sec)
Records: 21  Duplicates: 0  Warnings: 0

mysql> SELECT EmployeeId, EmployeeName  
    -> FROM employees  
    -> WHERE EmployeeID = ANY (SELECT EmployeeID FROM employee_orders WHERE Status='Completed'); 
ERROR 1146 (42S02): Table 'luckyshrub_db.employees ' doesn't exist
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| luckyshrub_db      |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> USE luckyshrub_db;
Database changed
mysql> SHOW TABLES;
+-------------------------+
| Tables_in_luckyshrub_db |
+-------------------------+
| Orders                  |
| employee_orders         |
| employees               |
| orders                  |
+-------------------------+
4 rows in set (0.01 sec)

mysql> DROP TABLE IF EXISTS employee_orders;
F EXISTS orders;
DROP TABLE IF EXISTS employees;
Query OK, 0 rows affected (0.10 sec)

mysql> DROP TABLE IF EXISTS orders;
Query OK, 0 rows affected (0.14 sec)

mysql> DROP TABLE IF EXISTS employees;
Query OK, 0 rows affected (0.07 sec)

mysql> CREATE TABLE employees (
    ->     EmployeeID INT NOT NULL,
    ->     EmployeeName VARCHAR(150) DEFAULT NULL,
    ->     Department VARCHAR(150) DEFAULT NULL,
    ->     ContactNo VARCHAR(12) DEFAULT NULL,
    ->     Email VARCHAR(100) DEFAULT NULL,
    ->     AnnualSalary INT DEFAULT NULL,
    ->     PRIMARY KEY (EmployeeID)
    -> );
ders (
    OrderID INT NOT NULL,
    Department VARCHAR(100) DEFAULT NULL,
    OrderDate DATE DEFAULT NULL,
    OrderQty INT DEFAULT NULL,
    OrderTotal INT DEFAULT NULL,
    PRIMARY KEY (OrderID)
);

CREATE TABLE employee_orders (
    OrderID INT NOT NULL,
    EmployeeID INT NOT NULL,
    Status VARCHAR(150),
    HandlingCost INT DEFAULT NULL,
    PRIMARY KEY (EmployeeID, OrderID),
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);
Query OK, 0 rows affected (0.15 sec)

mysql> 
mysql> CREATE TABLE orders (
    ->     OrderID INT NOT NULL,
    ->     Department VARCHAR(100) DEFAULT NULL,
    ->     OrderDate DATE DEFAULT NULL,
    ->     OrderQty INT DEFAULT NULL,
    ->     OrderTotal INT DEFAULT NULL,
    ->     PRIMARY KEY (OrderID)
    -> );
Query OK, 0 rows affected (0.15 sec)

mysql> 
mysql> CREATE TABLE employee_orders (
    ->     OrderID INT NOT NULL,
    ->     EmployeeID INT NOT NULL,
    ->     Status VARCHAR(150),
    ->     HandlingCost INT DEFAULT NULL,
    ->     PRIMARY KEY (EmployeeID, OrderID),
    ->     FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    ->     FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> INSERT INTO employees (EmployeeID, EmployeeName, Department, ContactNo, Email, AnnualSalary) VALUES 
    -> (1, 'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com', 50000),
    -> (2, 'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@luckyshrub.com', 75000),
    -> (3, 'Simon Tolo', 'Marketing', '351930582', 'Simon.t@luckyshrub.com', 40000),
    -> (4, 'Francesca Soffia', 'Finance', '351258569', 'Francesca.s@luckyshrub.com', 45000),
    -> (5, 'Emily Sierra', 'Customer Service', '351083098', 'Emily.s@luckyshrub.com', 35000),
    -> (6, 'Maria Carter', 'Human Resources', '351022508', 'Maria.c@luckyshrub.com', 55000),
    -> (7, 'Rick Griffin', 'Marketing', '351478458', 'Rick.G@luckyshrub.com', 50000);
(OrderID, Department, OrderDate, OrderQty, OrderTotal) VALUES
(1, 'Lawn Care', '2022-05-05', 12, 500),
(2, 'Decking', '2022-05-22', 150, 1450),
(3, 'Compost and Stones', '2022-05-27', 20, 780),
(4, 'TQuery OK, 7 rows affected (0.02 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO orders (OrderID, Department, OrderDate, OrderQty, OrderTotal) VALUES
    -> (1, 'Lawn Care', '2022-05-05', 12, 500),
    -> (2, 'Decking', '2022-05-22', 150, 1450),
    -> (3, 'Compost and Stones', '2022-05-27', 20, 780),
    -> (4, 'Trees and Shrubs', '2022-06-01', 15, 400),
    -> (5, 'Garden Decor', '2022-06-10', 2, 1250),
    -> (6, 'Lawn Care', '2022-06-10', 12, 500),
    -> (7, 'Decking', '2022-06-25', 150, 1450),
    -> (8, 'Compost and Stones', '2022-05-29', 20, 780),
    -> (9, 'Trees and Shrubs', '2022-06-10', 15, 400),
    -> (10, 'Garden Decor', '2022-06-10', 2, 1250),
    -> (11, 'Lawn Care', '2022-06-25', 10, 400),
    -> (12, 'Decking', '2022-06-25', 100, 1400),
    -> (13, 'Compost and Stones', '2022-05-30', 15, 700),
    -> (14, 'Trees and Shrubs', '2022-06-15', 10, 300),
    -> (15, 'Garden Decor', '2022-06-11', 2, 1250),
    -> (16, 'Lawn Care', '2022-06-10', 12, 500),
    -> (17, 'Decking', '2022-06-25', 150, 1450),
    -> (18, 'Trees and Shrubs', '2022-06-10', 15, 400),
    -> (19, 'Lawn Care', '2022-06-10', 12, 500),
    -> (20, 'Decking', '2022-06-25', 150, 1450),
    -> (21, 'Decking', '2022-06-25', 150, 1450);
INSERT INTO employee_orders (OrderID, EmployeeID, Status, HandlingCost) VALUES
(1, 3, 'In Progress', 200),
(1, 5, 'Not Received', 300),
(1, 4, 'Not Received', 250),
(2, 3, 'Completed', 200),
(2, 5, 'Completed', 300),
(2, 4, 'In Progress', 250),
(3, 3Query OK, 21 rows affected (0.03 sec)
Records: 21  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO employee_orders (OrderID, EmployeeID, Status, HandlingCost) VALUES
    -> (1, 3, 'In Progress', 200),
    -> (1, 5, 'Not Received', 300),
    -> (1, 4, 'Not Received', 250),
    -> (2, 3, 'Completed', 200),
    -> (2, 5, 'Completed', 300),
    -> (2, 4, 'In Progress', 250),
    -> (3, 3, 'In Progress', 200),
    -> (3, 5, 'Not Received', 300),
    -> (3, 4, 'Not Received', 250),
    -> (4, 3, 'Completed', 200),
    -> (4, 5, 'In Progress', 300),
    -> (4, 4, 'In Progress', 250),
    -> (5, 3, 'Completed', 200),
    -> (5, 5, 'In Progress', 300),
    -> (5, 4, 'Not Received', 250),
    -> (11, 3, 'Completed', 200),
    -> (11, 5, 'Completed', 300),
    -> (11, 4, 'Not Received', 250),
    -> (14, 3, 'Completed', 200),
    -> (14, 5, 'Not Received', 300),
    -> (14, 4, 'Not Received', 250);
Query OK, 21 rows affected (0.01 sec)
Records: 21  Duplicates: 0  Warnings: 0

mysql> SELECT EmployeeID, EmployeeName  
    -> FROM employees  
    -> WHERE EmployeeID IN (SELECT EmployeeID FROM employee_orders WHERE Status='Completed');
+------------+--------------+
| EmployeeID | EmployeeName |
+------------+--------------+
|          3 | Simon Tolo   |
|          5 | Emily Sierra |
+------------+--------------+
2 rows in set (0.00 sec)

mysql> SELECT EmployeeID,HandlingCost 
    -> FROM employee_orders  
    -> WHERE HandlingCost > ALL(SELECT ROUND(OrderTotal/100 * 20) FROM orders); 
ERROR 1146 (42S02): Table 'luckyshrub_db.employee_orders ' doesn't exist
mysql> SHOW TABLES;
+-------------------------+
| Tables_in_luckyshrub_db |
+-------------------------+
| Orders                  |
| employee_orders         |
| employees               |
| orders                  |
+-------------------------+
4 rows in set (0.01 sec)

mysql> DESCRIBE employee_orders;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| OrderID      | int          | NO   | PRI | NULL    |       |
| EmployeeID   | int          | NO   | PRI | NULL    |       |
| Status       | varchar(150) | YES  |     | NULL    |       |
| HandlingCost | int          | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> DROP TABLE IF EXISTS employee_orders;
E employee_orders (
    OrderID INT NOT NULL,
    EmployeeID INT NOT NULL,
    Status VARCHAR(150),
    HandlingCost INT DEFAULT NULL,
    PRIMARY KEY (EmployeeID, OrderID),
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);
Query OK, 0 rows affected (0.09 sec)

mysql> 
mysql> CREATE TABLE employee_orders (
    ->     OrderID INT NOT NULL,
    ->     EmployeeID INT NOT NULL,
    ->     Status VARCHAR(150),
    ->     HandlingCost INT DEFAULT NULL,
    ->     PRIMARY KEY (EmployeeID, OrderID),
    ->     FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    ->     FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> INSERT INTO employee_orders (OrderID, EmployeeID, Status, HandlingCost) VALUES
    -> (1, 3, 'In Progress', 200),
    -> (1, 5, 'Not Received', 300),
    -> (1, 4, 'Not Received', 250),
    -> (2, 3, 'Completed', 200),
    -> (2, 5, 'Completed', 300),
    -> (2, 4, 'In Progress', 250),
    -> (3, 3, 'In Progress', 200),
    -> (3, 5, 'Not Received', 300),
    -> (3, 4, 'Not Received', 250),
    -> (4, 3, 'Completed', 200),
    -> (4, 5, 'In Progress', 300),
    -> (4, 4, 'In Progress', 250),
    -> (5, 3, 'Completed', 200),
    -> (5, 5, 'In Progress', 300),
    -> (5, 4, 'Not Received', 250),
    -> (11, 3, 'Completed', 200),
    -> (11, 5, 'Completed', 300),
    -> (11, 4, 'Not Received', 250),
    -> (14, 3, 'Completed', 200),
    -> (14, 5, 'Not Received', 300),
    -> (14, 4, 'Not Received', 250);
Query OK, 21 rows affected (0.01 sec)
Records: 21  Duplicates: 0  Warnings: 0

mysql> SELECT EmployeeID, HandlingCost 
    -> FROM employee_orders  
    -> WHERE HandlingCost > ALL (SELECT ROUND(OrderTotal / 100 * 20) FROM orders);
+------------+--------------+
| EmployeeID | HandlingCost |
+------------+--------------+
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
+------------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT EmployeeID,HandlingCost   
    -> FROM employee_orders   
    -> WHERE HandlingCost > ALL(SELECT ROUND(OrderTotal/100 * 20) FROM orders) GROUP BY EmployeeID,HandlingCost;
ERROR 1146 (42S02): Table 'luckyshrub_db.employee_orders  ' doesn't exist
mysql> SHOW TABLES;
+-------------------------+
| Tables_in_luckyshrub_db |
+-------------------------+
| Orders                  |
| employee_orders         |
| employees               |
| orders                  |
+-------------------------+
4 rows in set (0.00 sec)

mysql> DESCRIBE employee_orders;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| OrderID      | int          | NO   | PRI | NULL    |       |
| EmployeeID   | int          | NO   | PRI | NULL    |       |
| Status       | varchar(150) | YES  |     | NULL    |       |
| HandlingCost | int          | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> DROP TABLE IF EXISTS employee_orders;
E employee_orders (
    OrderID INT NOT NULL,
    EmployeeID INT NOT NULL,
    Status VARCHAR(150),
    HandlingCost INT DEFAULT NULL,
    PRIMARY KEY (EmployeeID, OrderID),
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);
Query OK, 0 rows affected (0.10 sec)

mysql> 
mysql> CREATE TABLE employee_orders (
    ->     OrderID INT NOT NULL,
    ->     EmployeeID INT NOT NULL,
    ->     Status VARCHAR(150),
    ->     HandlingCost INT DEFAULT NULL,
    ->     PRIMARY KEY (EmployeeID, OrderID),
    ->     FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    ->     FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
    -> );
Query OK, 0 rows affected (0.23 sec)

mysql> INSERT INTO employee_orders (OrderID, EmployeeID, Status, HandlingCost) VALUES
    -> (1, 3, 'In Progress', 200),
    -> (1, 5, 'Not Received', 300),
    -> (1, 4, 'Not Received', 250),
    -> (2, 3, 'Completed', 200),
    -> (2, 5, 'Completed', 300),
    -> (2, 4, 'In Progress', 250),
    -> (3, 3, 'In Progress', 200),
    -> (3, 5, 'Not Received', 300),
    -> (3, 4, 'Not Received', 250),
    -> (4, 3, 'Completed', 200),
    -> (4, 5, 'In Progress', 300),
    -> (4, 4, 'In Progress', 250),
    -> (5, 3, 'Completed', 200),
    -> (5, 5, 'In Progress', 300),
    -> (5, 4, 'Not Received', 250),
    -> (11, 3, 'Completed', 200),
    -> (11, 5, 'Completed', 300),
    -> (11, 4, 'Not Received', 250),
    -> (14, 3, 'Completed', 200),
    -> (14, 5, 'Not Received', 300),
    -> (14, 4, 'Not Received', 250);
Query OK, 21 rows affected (0.02 sec)
Records: 21  Duplicates: 0  Warnings: 0

mysql> SELECT EmployeeID, HandlingCost 
    -> FROM employee_orders  
    -> WHERE HandlingCost > ALL (SELECT ROUND(OrderTotal / 100 * 20) FROM orders);
+------------+--------------+
| EmployeeID | HandlingCost |
+------------+--------------+
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
+------------+--------------+
7 rows in set (0.00 sec)

mysql> USE luckyshrub_db;
Database changed
mysql> SELECT EmployeeID,HandlingCost 
    -> FROM employee_orders  
    -> WHERE HandlingCost > ALL(SELECT ROUND(OrderTotal/100 * 20) AS twentyPercent FROM orders  GROUP BY OrderTotal  
    -> HAVING twentyPercent > 100)  GROUP BY EmployeeID,HandlingCost;     
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '  GROUP BY EmployeeID,HandlingCost' at line 4
mysql> SELECT EmployeeID, HandlingCost
    -> FROM employee_orders
    -> WHERE HandlingCost > ALL (
    ->     SELECT ROUND(OrderTotal / 100 * 20) 
    ->     FROM orders
    -> );
+------------+--------------+
| EmployeeID | HandlingCost |
+------------+--------------+
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
+------------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT EmployeeID, HandlingCost
    -> FROM employee_orders
    -> WHERE HandlingCost > ALL (
    ->     SELECT ROUND(OrderTotal / 100 * 20) AS twentyPercent
    ->     FROM orders
    ->     GROUP BY OrderTotal
    -> );
+------------+--------------+
| EmployeeID | HandlingCost |
+------------+--------------+
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
|          5 |          300 |
+------------+--------------+
7 rows in set (0.00 sec)

mysql> */