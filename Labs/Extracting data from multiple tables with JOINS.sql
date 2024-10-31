/*coder@62aef63cd489:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.30 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> USE Lucky_Shrub;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
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

mysql> SELECT * FROM Clients;
+----------+----------------+---------------+
| ClientID | FullName       | ContactNumber |
+----------+----------------+---------------+
| Cl1      | Alice Johnson  | 123-456-7890  |
| Cl2      | Bob Smith      | 234-567-8901  |
| Cl3      | Carol Williams | 345-678-9012  |
| Cl4      | David Brown    | 456-789-0123  |
| Cl5      | Eve Davis      | 567-890-1234  |
+----------+----------------+---------------+
5 rows in set (0.00 sec)

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

mysql> SELECT Clients.ClientID, Clients.ContactNumber, 
    -> Orders.OrderID, Orders.Quantity, Orders.Date,
    -> Products.NumberOfItems AS 'Items in stock' FROM 
    -> Clients INNER JOIN Orders INNER JOIN Products
    -> ON(Clients.ClientID = Orders.ClientID AND Orders.ProductID = Products.ProductID)
    -> WHERE(Orders.Quantity >= 10 AND Date > '2020-09-05' AND Products.NumberOfItems >= 50);
+----------+---------------+---------+----------+------------+----------------+
| ClientID | ContactNumber | OrderID | Quantity | Date       | Items in stock |
+----------+---------------+---------+----------+------------+----------------+
| Cl4      | 456-789-0123  |       4 |       15 | 2020-09-07 |             50 |
| Cl3      | 345-678-9012  |       5 |       10 | 2020-09-08 |             60 |
| Cl1      | 123-456-7890  |       7 |       22 | 2020-09-10 |             50 |
| Cl3      | 345-678-9012  |       8 |       15 | 2020-09-10 |            100 |
| Cl1      | 123-456-7890  |       9 |       10 | 2020-09-12 |            100 |
| Cl1      | 123-456-7890  |      12 |       10 | 2022-09-01 |            100 |
| Cl3      | 345-678-9012  |      14 |       20 | 2022-09-03 |             60 |
| Cl4      | 456-789-0123  |      15 |       15 | 2022-09-07 |             50 |
| Cl3      | 345-678-9012  |      16 |       10 | 2022-09-08 |             60 |
| Cl1      | 123-456-7890  |      18 |       22 | 2022-09-10 |             50 |
| Cl3      | 345-678-9012  |      19 |       15 | 2022-09-10 |            100 |
| Cl1      | 123-456-7890  |      20 |       10 | 2022-09-12 |            100 |
| Cl2      | 234-567-8901  |      22 |       10 | 2021-09-01 |            100 |
| Cl3      | 345-678-9012  |      24 |       20 | 2021-09-03 |             60 |
| Cl4      | 456-789-0123  |      25 |       15 | 2021-09-07 |             50 |
| Cl1      | 123-456-7890  |      26 |       10 | 2021-09-08 |             60 |
| Cl2      | 234-567-8901  |      27 |       20 | 2022-09-01 |            100 |
| Cl2      | 234-567-8901  |      28 |       10 | 2022-09-05 |            250 |
| Cl3      | 345-678-9012  |      29 |       20 | 2021-09-03 |             60 |
| Cl1      | 123-456-7890  |      30 |       10 | 2022-09-01 |            100 |
+----------+---------------+---------+----------+------------+----------------+
20 rows in set (0.00 sec)

mysql> */