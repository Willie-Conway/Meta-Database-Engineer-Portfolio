/*coder@fed716eb68e6:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE IF NOT EXISTS little_lemon;
ttle_lemon;
Query OK, 1 row affected (0.02 sec)

mysql> USE little_lemon;
Database changed
mysql> -- Create Customers table
mysql> CREATE TABLE Customers (
    ->     CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    ->     FullName VARCHAR(100),
    ->     PhoneNumber VARCHAR(15)
    -> );
ngs (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingDate DATE,
    TableNumber INT,
    NumberOfGuests INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
Query OK, 0 rows affected (0.14 sec)

mysql> 
mysql> -- Create Bookings table
mysql> CREATE TABLE Bookings (
    ->     BookingID INT AUTO_INCREMENT PRIMARY KEY,
    ->     BookingDate DATE,
    ->     TableNumber INT,
    ->     NumberOfGuests INT,
    ->     CustomerID INT,
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> CREATE TABLE FoodOrders (
    ->     OrderID INT,
    ->     Quantity INT,
    ->     Order_Status VARCHAR(15),
    ->     Cost DECIMAL(4,2)
    -> );
Query OK, 0 rows affected (0.14 sec)

mysql> ALTER TABLE FoodOrders
    -> MODIFY OrderID INT PRIMARY KEY;
Query OK, 0 rows affected (0.30 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE FoodOrders
    -> MODIFY Quantity INT NOT NULL,
    -> MODIFY Cost DECIMAL(4,2) NOT NULL;
Query OK, 0 rows affected (0.29 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE FoodOrders
    -> ADD OrderDate DATE NOT NULL,
    -> ADD CustomerID INT NOT NULL,
    -> ADD CONSTRAINT fk_CustomerID
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
Query OK, 0 rows affected (0.48 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE FoodOrders
    -> DROP COLUMN OrderDate;
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE FoodOrders
    -> CHANGE COLUMN Order_Status DeliveryStatus VARCHAR(15);
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE FoodOrders
    -> RENAME TO OrderDeliveryStatus;
Query OK, 0 rows affected (0.12 sec)

mysql> SHOW TABLES;
+------------------------+
| Tables_in_little_lemon |
+------------------------+
| Bookings               |
| Customers              |
| OrderDeliveryStatus    |
+------------------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE Customers;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| CustomerID  | int          | NO   | PRI | NULL    | auto_increment |
| FullName    | varchar(100) | YES  |     | NULL    |                |
| PhoneNumber | varchar(15)  | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> DESCRIBE Bookings;;
+----------------+------+------+-----+---------+----------------+
| Field          | Type | Null | Key | Default | Extra          |
+----------------+------+------+-----+---------+----------------+
| BookingID      | int  | NO   | PRI | NULL    | auto_increment |
| BookingDate    | date | YES  |     | NULL    |                |
| TableNumber    | int  | YES  |     | NULL    |                |
| NumberOfGuests | int  | YES  |     | NULL    |                |
| CustomerID     | int  | YES  | MUL | NULL    |                |
+----------------+------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

ERROR: 
No query specified

mysql> DESCRIBE OrderDeliveryStatus;
+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| OrderID        | int          | NO   | PRI | NULL    |       |
| Quantity       | int          | NO   |     | NULL    |       |
| DeliveryStatus | varchar(15)  | YES  |     | NULL    |       |
| Cost           | decimal(4,2) | NO   |     | NULL    |       |
| CustomerID     | int          | NO   | MUL | NULL    |       |
+----------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> */