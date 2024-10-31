/*mysql> SELECT * FROM employee;
+-------------+---------------+----------+-----------+---------+-------+
| employee_ID | employee_name | salary   | allowance | tax     | hours |
+-------------+---------------+----------+-----------+---------+-------+
|           1 | Alex          | 24000.00 |   1000.00 | 1000.00 |    10 |
|           2 | John          | 55000.00 |   3000.00 | 2000.00 |    11 |
|           3 | James         | 52000.00 |   3000.00 | 2000.00 |     7 |
|           4 | Sam           | 24000.00 |   1000.00 | 1000.00 |    11 |
+-------------+---------------+----------+-----------+---------+-------+
4 rows in set (0.00 sec)

mysql> SELECT salary + 500 FROM employee;
+--------------+
| salary + 500 |
+--------------+
|     24500.00 |
|     55500.00 |
|     52500.00 |
|     24500.00 |
+--------------+
4 rows in set (0.00 sec)

mysql> SELECT salary - 500 FROM employee;
+--------------+
| salary - 500 |
+--------------+
|     23500.00 |
|     54500.00 |
|     51500.00 |
|     23500.00 |
+--------------+
4 rows in set (0.00 sec)

mysql> SELECT salary * 2 FROM employee;
+------------+
| salary * 2 |
+------------+
|   48000.00 |
|  110000.00 |
|  104000.00 |
|   48000.00 |
+------------+
4 rows in set (0.00 sec)

mysql> SELECT salary / 12 FROM employee;
+-------------+
| salary / 12 |
+-------------+
| 2000.000000 |
| 4583.333333 |
| 4333.333333 |
| 2000.000000 |
+-------------+
4 rows in set (0.00 sec)

mysql> SELECT id % 2 FROM employee;
ERROR 1054 (42S22): Unknown column 'id' in 'field list'
mysql> SELECT employee_ID % 2 FROM employee;
+-----------------+
| employee_ID % 2 |
+-----------------+
|               1 |
|               0 |
|               1 |
|               0 |
+-----------------+
4 rows in set (0.00 sec)

mysql> */