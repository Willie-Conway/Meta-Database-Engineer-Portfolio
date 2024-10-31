/*coder@e8b26ae49a6d:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE luckyshrub_db; 
;

CREATE TABLE employees (
  EmployeeID int NOT NULL,
  EmployeeName varchar(150) DEFAULT NULL,
  Department varchar(150) DEFAULT NULL,
  ContactNo vQuery OK, 1 row affected (0.02 sec)

mysql> 
mysql> USE luckyshrub_db;
archar(12) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  AnnualSalary int DEFAULT NULL,
  PRIMADatabase changed
mysql> 
mysql> CREATE TABLE employees (
    ->   EmployeeID int NOT NULL,
    ->   EmployeeName varchar(150) DEFAULT NULL,
    ->   Department varchar(150) DEFAULT NULL,
    ->   ContactNo varchar(12) DEFAULT NULL,
    ->   Email varchar(100) DEFAULT NULL,
    ->   AnnualSalary int DEFAULT NULL,
    ->   PRIMARY KEY (EmployeeID)
    -> );
ES 
(1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
(2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@ luckyshrub.com',75000), 
(3,'Simon Tolo', 'Marketing', '351930582','Simon.t@ luckyshrub.com',40000), 
(4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@ luckyshrub.com',45000), 
(5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@ luckyshrub.com',35000), 
(6,'Maria Carter', 'Human Resources', '351022508','Maria.c@ luckyshrub.com',55000),
(7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);Query OK, 0 rows affected (0.12 sec)

mysql> 
mysql> INSERT INTO employees VALUES 
    -> (1,'Seamus Hogan', 'Recruitment', '351478025', 'Seamus.h@luckyshrub.com',50000), 
    -> (2,'Thomas Eriksson', 'Legal', '351475058', 'Thomas.e@ luckyshrub.com',75000), 
    -> (3,'Simon Tolo', 'Marketing', '351930582','Simon.t@ luckyshrub.com',40000), 
    -> (4,'Francesca Soffia', 'Finance', '351258569','Francesca.s@ luckyshrub.com',45000), 
    -> (5,'Emily Sierra', 'Customer Service', '351083098','Emily.s@ luckyshrub.com',35000), 
    -> (6,'Maria Carter', 'Human Resources', '351022508','Maria.c@ luckyshrub.com',55000),
    -> (7,'Rick Griffin', 'Marketing', '351478458','Rick.G@luckyshrub.com',50000);
Query OK, 7 rows affected (0.03 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employees WHERE AnnualSalary >= 50000 AND Department = 'Marketing';
+------------+--------------+------------+-----------+-----------------------+--------------+
| EmployeeID | EmployeeName | Department | ContactNo | Email                 | AnnualSalary |
+------------+--------------+------------+-----------+-----------------------+--------------+
|          7 | Rick Griffin | Marketing  | 351478458 | Rick.G@luckyshrub.com |        50000 |
+------------+--------------+------------+-----------+-----------------------+--------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM employees WHERE NOT AnnualSalary > 50000;
+------------+------------------+------------------+-----------+-----------------------------+--------------+
| EmployeeID | EmployeeName     | Department       | ContactNo | Email                       | AnnualSalary |
+------------+------------------+------------------+-----------+-----------------------------+--------------+
|          1 | Seamus Hogan     | Recruitment      | 351478025 | Seamus.h@luckyshrub.com     |        50000 |
|          3 | Simon Tolo       | Marketing        | 351930582 | Simon.t@ luckyshrub.com     |        40000 |
|          4 | Francesca Soffia | Finance          | 351258569 | Francesca.s@ luckyshrub.com |        45000 |
|          5 | Emily Sierra     | Customer Service | 351083098 | Emily.s@ luckyshrub.com     |        35000 |
|          7 | Rick Griffin     | Marketing        | 351478458 | Rick.G@luckyshrub.com       |        50000 |
+------------+------------------+------------------+-----------+-----------------------------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM employees WHERE AnnualSalary < 50000 AND Department IN('Marketing', 'Finance', 'Legal');
+------------+------------------+------------+-----------+-----------------------------+--------------+
| EmployeeID | EmployeeName     | Department | ContactNo | Email                       | AnnualSalary |
+------------+------------------+------------+-----------+-----------------------------+--------------+
|          3 | Simon Tolo       | Marketing  | 351930582 | Simon.t@ luckyshrub.com     |        40000 |
|          4 | Francesca Soffia | Finance    | 351258569 | Francesca.s@ luckyshrub.com |        45000 |
+------------+------------------+------------+-----------+-----------------------------+--------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM employees WHERE AnnualSalary BETWEEN 10000 AND 50000; 
+------------+------------------+------------------+-----------+-----------------------------+--------------+
| EmployeeID | EmployeeName     | Department       | ContactNo | Email                       | AnnualSalary |
+------------+------------------+------------------+-----------+-----------------------------+--------------+
|          1 | Seamus Hogan     | Recruitment      | 351478025 | Seamus.h@luckyshrub.com     |        50000 |
|          3 | Simon Tolo       | Marketing        | 351930582 | Simon.t@ luckyshrub.com     |        40000 |
|          4 | Francesca Soffia | Finance          | 351258569 | Francesca.s@ luckyshrub.com |        45000 |
|          5 | Emily Sierra     | Customer Service | 351083098 | Emily.s@ luckyshrub.com     |        35000 |
|          7 | Rick Griffin     | Marketing        | 351478458 | Rick.G@luckyshrub.com       |        50000 |
+------------+------------------+------------------+-----------+-----------------------------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM employees WHERE EmployeeName LIKE 'S___%';
+------------+--------------+-------------+-----------+-------------------------+--------------+
| EmployeeID | EmployeeName | Department  | ContactNo | Email                   | AnnualSalary |
+------------+--------------+-------------+-----------+-------------------------+--------------+
|          1 | Seamus Hogan | Recruitment | 351478025 | Seamus.h@luckyshrub.com |        50000 |
|          3 | Simon Tolo   | Marketing   | 351930582 | Simon.t@ luckyshrub.com |        40000 |
+------------+--------------+-------------+-----------+-------------------------+--------------+
2 rows in set (0.00 sec)

mysql> */