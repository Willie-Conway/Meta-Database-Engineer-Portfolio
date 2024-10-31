/*
Here's how you can create the tables and relationships 
in SQL for the college enrollment system:

coder@c67d8b140408:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE college;
Query OK, 1 row affected (0.01 sec)

mysql> USE college;
Database changed
mysql> CREATE TABLE Student (
    ->     StudentID VARCHAR(10) PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     DateOfBirth DATE
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> CREATE TABLE Department (
    ->     DepartmentNumber VARCHAR(10) PRIMARY KEY,
    ->     DepartmentName VARCHAR(100),
    ->     HeadOfDepartment VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> CREATE TABLE Course (
    ->     CourseID VARCHAR(10) PRIMARY KEY,
    ->     CourseName VARCHAR(100),
    ->     Credits INT,
    ->     DepartmentNumber VARCHAR(10),
    ->     FOREIGN KEY (DepartmentNumber) REFERENCES Department(DepartmentNumber)
    -> );
Query OK, 0 rows affected (0.16 sec)

mysql> CREATE TABLE Enrollment (
    ->     StudentID VARCHAR(10),
    ->     CourseID VARCHAR(10),
    ->     PRIMARY KEY (StudentID, CourseID),
    ->     FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    ->     FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
    -> );
Query OK, 0 rows affected (0.19 sec)

mysql> SHOW TABLES;
+-------------------+
| Tables_in_college |
+-------------------+
| Course            |
| Department        |
| Enrollment        |
| Student           |
+-------------------+
4 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM Student;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| StudentID   | varchar(10)  | NO   | PRI | NULL    |       |
| Name        | varchar(100) | YES  |     | NULL    |       |
| DateOfBirth | date         | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM Course;
+------------------+--------------+------+-----+---------+-------+
| Field            | Type         | Null | Key | Default | Extra |
+------------------+--------------+------+-----+---------+-------+
| CourseID         | varchar(10)  | NO   | PRI | NULL    |       |
| CourseName       | varchar(100) | YES  |     | NULL    |       |
| Credits          | int          | YES  |     | NULL    |       |
| DepartmentNumber | varchar(10)  | YES  | MUL | NULL    |       |
+------------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM Department;
+------------------+--------------+------+-----+---------+-------+
| Field            | Type         | Null | Key | Default | Extra |
+------------------+--------------+------+-----+---------+-------+
| DepartmentNumber | varchar(10)  | NO   | PRI | NULL    |       |
| DepartmentName   | varchar(100) | YES  |     | NULL    |       |
| HeadOfDepartment | varchar(100) | YES  |     | NULL    |       |
+------------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM Enrollment;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| StudentID | varchar(10) | NO   | PRI | NULL    |       |
| CourseID  | varchar(10) | NO   | PRI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> 

*/