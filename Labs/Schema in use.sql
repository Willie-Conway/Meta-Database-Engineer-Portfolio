/*coder@c67d8b140408:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| Chinook            |
| ExampleDB          |
| information_schema |
| mysql              |
| performance_schema |
| shopping_cart_db   |
| sys                |
+--------------------+
7 rows in set (0.01 sec)

mysql> USE shopping_cart_db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW tables;
+----------------------------+
| Tables_in_shopping_cart_db |
+----------------------------+
| customer                   |
+----------------------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE product(product_id INT, name VARCHAR(100), price NUMERIC(8,2), description VARCHAR(255), PRIMARY KEY (product_id) );
Query OK, 0 rows affected (0.15 sec)

mysql> SHOW tables;+----------------------------+
| Tables_in_shopping_cart_db |
+----------------------------+
| customer                   |
| product                    |
+----------------------------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE cart_order(order_id INT, customer_id INT, product_id INT, quantity INT, order_date DATE, status VARCHAR(100), PRIMARY KEY (order_id), FOREIGN KEY (customer_id) REFERENCES customer(customer_id), FOREIGN KEY (product_id) REFERENCES product(product_id));
Query OK, 0 rows affected (0.24 sec)

mysql> SHOW tables;+----------------------------+| Tables_in_shopping_cart_db |
+----------------------------+
| cart_order                 |
| customer                   |
| product                    |
+----------------------------+
3 rows in set (0.00 sec)

mysql> */