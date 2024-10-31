/*
Creating the Restaurant Database Schema

To build the physical database schema based 
on the logical design, follow these steps to 
create the necessary tables and define their 
relationships.


coder@c67d8b140408:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE restaurant;
Query OK, 1 row affected (0.02 sec)

mysql> USE restaurant;
Database changed
mysql> CREATE TABLE tbl (
    ->     table_id INT AUTO_INCREMENT,
    ->     location VARCHAR(255),
    ->     PRIMARY KEY (table_id)
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE TABLE waiter (
    ->     waiter_id INT AUTO_INCREMENT,
    ->     name VARCHAR(150),
    ->     contact_no VARCHAR(10),
    ->     shift VARCHAR(10),
    ->     PRIMARY KEY (waiter_id)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE table_order (
    ->     order_id INT AUTO_INCREMENT,
    ->     date_time DATETIME,
    ->     table_id INT,
    ->     waiter_id INT,
    ->     PRIMARY KEY (order_id),
    ->     FOREIGN KEY (table_id) REFERENCES tbl(table_id),
    ->     FOREIGN KEY (waiter_id) REFERENCES waiter(waiter_id)
    -> );
Query OK, 0 rows affected (0.22 sec)

mysql> CREATE TABLE customer (
    ->     customer_id INT AUTO_INCREMENT,
    ->     name VARCHAR(100),
    ->     NIC_no VARCHAR(12),
    ->     contact_no VARCHAR(10),
    ->     PRIMARY KEY (customer_id)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> CREATE TABLE reservation (
    ->     reservation_id INT AUTO_INCREMENT,
    ->     date_time DATETIME,
    ->     no_of_pax INT,
    ->     order_id INT,
    ->     table_id INT,
    ->     customer_id INT,
    ->     PRIMARY KEY (reservation_id),
    ->     FOREIGN KEY (order_id) REFERENCES table_order(order_id),
    ->     FOREIGN KEY (table_id) REFERENCES tbl(table_id),
    ->     FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
    -> );
Query OK, 0 rows affected (0.21 sec)

mysql> CREATE TABLE menu (
    ->     menu_id INT AUTO_INCREMENT,
    ->     description VARCHAR(255),
    ->     availability INT,
    ->     PRIMARY KEY (menu_id)
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> CREATE TABLE menu_item (
    ->     menu_item_id INT AUTO_INCREMENT,
    ->     description VARCHAR(255),
    ->     price FLOAT,
    ->     availability INT,
    ->     menu_id INT,
    ->     PRIMARY KEY (menu_item_id),
    ->     FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> CREATE TABLE order_menu_item (
    ->     order_id INT,
    ->     menu_item_id INT,
    ->     quantity INT,
    ->     PRIMARY KEY (order_id, menu_item_id),
    ->     FOREIGN KEY (order_id) REFERENCES table_order(order_id),
    ->     FOREIGN KEY (menu_item_id) REFERENCES menu_item(menu_item_id)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| Chinook            |
| ExampleDB          |
| information_schema |
| mysql              |
| performance_schema |
| restaurant         |
| shopping_cart_db   |
| sys                |
+--------------------+
8 rows in set (0.00 sec)

mysql> USE restaurant;
Database changed
mysql> SHOW tables;
+----------------------+
| Tables_in_restaurant |
+----------------------+
| customer             |
| menu                 |
| menu_item            |
| order_menu_item      |
| reservation          |
| table_order          |
| tbl                  |
| waiter               |
+----------------------+
8 rows in set (0.00 sec)

mysql> 


Summary

Database: restaurant

Tables:

tbl: Holds information about 
restaurant tables.

waiter: Contains data 
on waiters.

table_order: Tracks orders, linking 
tables and waiters.

customer: Stores customer 
information.

reservation: Manages reservations, 
linking to orders, tables, and customers.

menu: Details available menus.

menu_item: Lists items available 
in each menu.

order_menu_item: Links orders with 
specific menu items and their quantities.


*/