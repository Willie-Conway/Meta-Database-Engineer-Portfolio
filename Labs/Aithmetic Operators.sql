/*coder@69e0b242a94a:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE company;
Query OK, 1 row affected (0.02 sec)

mysql> USE company;
Database changed
mysql> CREATE TABLE employee (
    ->     employee_ID INT PRIMARY KEY,
    ->     employee_name VARCHAR(100),
    ->     salary DECIMAL(10, 2),
    ->     allowance DECIMAL(10, 2),
    ->     tax DECIMAL(10, 2),
    ->     hours INT
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> INSERT INTO employee (employee_ID, employee_name, salary, allowance, tax, hours) VALUES
    -> (1, 'Alex', 24000, 1000, 1000, 10),
    -> (2, 'John', 55000, 3000, 2000, 11),
    -> (3, 'James', 52000, 3000, 2000, 7),
    -> (4, 'Sam', 24000, 1000, 1000, 11);
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM employee;
+-------------+---------------+----------+-----------+---------+-------+
| employee_ID | employee_name | salary   | allowance | tax     | hours |
+-------------+---------------+----------+-----------+---------+-------+
|           1 | Alex          | 24000.00 |   1000.00 | 1000.00 |    10 |
|           2 | John          | 55000.00 |   3000.00 | 2000.00 |    11 |
|           3 | James         | 52000.00 |   3000.00 | 2000.00 |     7 |
|           4 | Sam           | 24000.00 |   1000.00 | 1000.00 |    11 |
+-------------+---------------+----------+-----------+---------+-------+
4 rows in set (0.00 sec)

mysql> SELECT employee_ID + employee_name FROM employee;
+-----------------------------+
| employee_ID + employee_name |
+-----------------------------+
|                           1 |
|                           2 |
|                           3 |
|                           4 |
+-----------------------------+
4 rows in set, 2 warnings (0.00 sec)

mysql> SELECT salary + allowance AS total_salary FROM employee;
+--------------+
| total_salary |
+--------------+
|     25000.00 |
|     58000.00 |
|     55000.00 |
|     25000.00 |
+--------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM employee WHERE salary + allowance = 25000;
+-------------+---------------+----------+-----------+---------+-------+
| employee_ID | employee_name | salary   | allowance | tax     | hours |
+-------------+---------------+----------+-----------+---------+-------+
|           1 | Alex          | 24000.00 |   1000.00 | 1000.00 |    10 |
|           4 | Sam           | 24000.00 |   1000.00 | 1000.00 |    11 |
+-------------+---------------+----------+-----------+---------+-------+
2 rows in set (0.00 sec)

mysql> SELECT employee_ID - employee_name FROM employee;
+-----------------------------+
| employee_ID - employee_name |
+-----------------------------+
|                           1 |
|                           2 |
|                           3 |
|                           4 |
+-----------------------------+
4 rows in set, 2 warnings (0.00 sec)

mysql> SELECT salary - tax AS net_salary FROM employee;
+------------+
| net_salary |
+------------+
|   23000.00 |
|   53000.00 |
|   50000.00 |
|   23000.00 |
+------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM employee WHERE salary - tax = 50000;
+-------------+---------------+----------+-----------+---------+-------+
| employee_ID | employee_name | salary   | allowance | tax     | hours |
+-------------+---------------+----------+-----------+---------+-------+
|           3 | James         | 52000.00 |   3000.00 | 2000.00 |     7 |
+-------------+---------------+----------+-----------+---------+-------+
1 row in set (0.00 sec)

mysql> SELECT tax * 2 AS doubled_tax FROM employee;
+-------------+
| doubled_tax |
+-------------+
|     2000.00 |
|     4000.00 |
|     4000.00 |
|     2000.00 |
+-------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM employee WHERE tax * 2 = 4000;
+-------------+---------------+----------+-----------+---------+-------+
| employee_ID | employee_name | salary   | allowance | tax     | hours |
+-------------+---------------+----------+-----------+---------+-------+
|           2 | John          | 55000.00 |   3000.00 | 2000.00 |    11 |
|           3 | James         | 52000.00 |   3000.00 | 2000.00 |     7 |
+-------------+---------------+----------+-----------+---------+-------+
2 rows in set (0.00 sec)

mysql> SELECT allowance / salary * 100 AS allowance_percentage FROM employee;
+----------------------+
| allowance_percentage |
+----------------------+
|             4.166667 |
|             5.454545 |
|             5.769231 |
|             4.166667 |
+----------------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM employee WHERE allowance / salary * 100 >= 5;
+-------------+---------------+----------+-----------+---------+-------+
| employee_ID | employee_name | salary   | allowance | tax     | hours |
+-------------+---------------+----------+-----------+---------+-------+
|           2 | John          | 55000.00 |   3000.00 | 2000.00 |    11 |
|           3 | James         | 52000.00 |   3000.00 | 2000.00 |     7 |
+-------------+---------------+----------+-----------+---------+-------+
2 rows in set (0.00 sec)

mysql> SELECT hours % 2 AS remainder FROM employee;
+-----------+
| remainder |
+-----------+
|         0 |
|         1 |
|         1 |
|         1 |
+-----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM employee WHERE hours % 2 = 0;
+-------------+---------------+----------+-----------+---------+-------+
| employee_ID | employee_name | salary   | allowance | tax     | hours |
+-------------+---------------+----------+-----------+---------+-------+
|           1 | Alex          | 24000.00 |   1000.00 | 1000.00 |    10 |
+-------------+---------------+----------+-----------+---------+-------+
1 row in set (0.00 sec)

mysql> */