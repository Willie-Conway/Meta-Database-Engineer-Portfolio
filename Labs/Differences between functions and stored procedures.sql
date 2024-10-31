/*coder@fa133b56c33e:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
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
mysql> CREATE TABLE Clients (
    ->     ClientID INT AUTO_INCREMENT PRIMARY KEY,
    ->     FirstName VARCHAR(50),
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100),
    ->     Phone VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID INT AUTO_INCREMENT PRIMARY KEY,
    ->     ClientID INT,
    ->     OrderDate DATE,
    ->     Cost DECIMAL(10,2),
    ->     FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
    -> );
Query OK, 0 rows affected (0.18 sec)

mysql> INSERT INTO Clients (FirstName, LastName, Email, Phone) VALUES
    -> ('John', 'Doe', 'john.doe@example.com', '555-1234'),
    -> ('Jane', 'Smith', 'jane.smith@example.com', '555-5678');
Query OK, 2 rows affected (0.01 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Orders (ClientID, OrderDate, Cost) VALUES
    -> (1, '2024-09-01', 100.00),
    -> (1, '2024-09-15', 150.00),
    -> (2, '2024-09-10', 200.00);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> DELIMITER //
mysql> 
mysql> CREATE PROCEDURE GetAllClients()
    -> BEGIN
    ->     SELECT * FROM Clients;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELIMITER ;
mysql> DELIMITER //
mysql> 
mysql> CREATE FUNCTION GetCostAverage() RETURNS DECIMAL(10,2) DETERMINISTIC
    -> BEGIN
    ->     RETURN (SELECT AVG(Cost) FROM Orders);
    -> END //
;
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> DELIMITER ;
mysql> CALL GetAllClients();
+----------+-----------+----------+------------------------+----------+
| ClientID | FirstName | LastName | Email                  | Phone    |
+----------+-----------+----------+------------------------+----------+
|        1 | John      | Doe      | john.doe@example.com   | 555-1234 |
|        2 | Jane      | Smith    | jane.smith@example.com | 555-5678 |
+----------+-----------+----------+------------------------+----------+
2 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> SELECT GetCostAverage();
+------------------+
| GetCostAverage() |
+------------------+
|           150.00 |
+------------------+
1 row in set (0.01 sec)
*/