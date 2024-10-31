/*coder@c67d8b140408:~/project$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.28 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE MedicalGroup;
Query OK, 1 row affected (0.02 sec)

mysql> USE MedicalGroup;
Database changed
mysql> CREATE TABLE Doctor (
    ->     DoctorID VARCHAR(10) PRIMARY KEY,
    ->     DoctorName VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE Patient (
    ->     PatientID VARCHAR(10) NOT NULL,
    ->     PatientName VARCHAR(50),
    ->     SlotID VARCHAR(10) NOT NULL,
    ->     TotalCost DECIMAL,
    ->     PRIMARY KEY (PatientID, SlotID)
    -> );
Query OK, 0 rows affected (0.12 sec)

mysql> CREATE TABLE Surgery (
    ->     SurgeryNumber INT NOT NULL PRIMARY KEY,
    ->     Council VARCHAR(20),
    ->     FOREIGN KEY (Council) REFERENCES Council(Council)
    -> );
ERROR 1824 (HY000): Failed to open the referenced table 'Council'
mysql> CREATE TABLE Location (
    ->     SurgeryNumber INT NOT NULL PRIMARY KEY,
    ->     Postcode VARCHAR(10),
    ->     FOREIGN KEY (SurgeryNumber) REFERENCES Surgery(SurgeryNumber)
    -> );
ERROR 1824 (HY000): Failed to open the referenced table 'Surgery'
mysql> CREATE TABLE Location (
    ->     SurgeryNumber INT NOT NULL PRIMARY KEY,
    ->     Postcode VARCHAR(10),
    ->     FOREIGN KEY (SurgeryNumber) REFERENCES Surgery(SurgeryNumber)
    -> );
ERROR 1824 (HY000): Failed to open the referenced table 'Surgery'
mysql> CREATE TABLE Council (
    ->     Council VARCHAR(20) PRIMARY KEY,
    ->     Region VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE TABLE Appointment (
    ->     AppointmentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->     PatientID VARCHAR(10),
    ->     SlotID VARCHAR(10),
    ->     TotalCost DECIMAL,
    ->     FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
    -> );
Query OK, 0 rows affected (0.17 sec)

mysql> INSERT INTO Doctor (DoctorID, DoctorName) VALUES ('D1', 'Karl');
rName) VALUES ('D2', 'Mark');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Doctor (DoctorID, DoctorName) VALUES ('D2', 'Mark');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Patient (PatientID, PatientName, SlotID, TotalCost) VALUES ('P1', 'Rami', 'A1', 1500);
NSERT INTO Patient (PatientID, PatientName, SlotID, TotalCost) VALUES ('P2', 'Kim', 'A2', 1200);
-- Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Patient (PatientID, PatientName, SlotID, TotalCost) VALUES ('P2', 'Kim', 'A2', 1200);
Add more patient records as needed
Query OK, 1 row affected (0.00 sec)

mysql> -- Add more patient records as needed
mysql> INSERT INTO Council (Council, Region) VALUES ('Harrow', 'West London');
, Region) VALUES ('Hackney', 'East London');
-- AdQuery OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Council (Council, Region) VALUES ('Hackney', 'East London');
Query OK, 1 row affected (0.01 sec)

mysql> -- Add more council records as needed
mysql> INSERT INTO Surgery (SurgeryNumber, Council) VALUES (3, 'Harrow');
ERROR 1146 (42S02): Table 'MedicalGroup.Surgery' doesn't exist
mysql> INSERT INTO Surgery (SurgeryNumber, Council) VALUES (4, 'Hackney');
ERROR 1146 (42S02): Table 'MedicalGroup.Surgery' doesn't exist
mysql> -- Add more surgery records as needed
mysql> INSERT INTO Location (SurgeryNumber, Postcode) VALUES (3, 'HA9SDE');
ERROR 1146 (42S02): Table 'MedicalGroup.Location' doesn't exist
mysql> INSERT INTO Location (SurgeryNumber, Postcode) VALUES (4, 'E1 6AW');
ERROR 1146 (42S02): Table 'MedicalGroup.Location' doesn't exist
mysql> -- Add more location records as needed
mysql> INSERT INTO Appointment (PatientID, SlotID, TotalCost) VALUES ('P1', 'A1', 1500);
tment (PatientID, SlotID, TotalCost) VALUES ('P2', 'A2', 1200);
-- Add more appointment records as nQuery OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Appointment (PatientID, SlotID, TotalCost) VALUES ('P2', 'A2', 1200);
eeded
Query OK, 1 row affected (0.02 sec)

mysql> -- Add more appointment records as needed
mysql> SHOW TABLES;
+------------------------+
| Tables_in_MedicalGroup |
+------------------------+
| Appointment            |
| Council                |
| Doctor                 |
| Patient                |
+------------------------+
4 rows in set (0.00 sec)

mysql> DESCRIBE Doctor;
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| DoctorID   | varchar(10) | NO   | PRI | NULL    |       |
| DoctorName | varchar(50) | YES  |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> DESCRIBE Patient;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| PatientID   | varchar(10)   | NO   | PRI | NULL    |       |
| PatientName | varchar(50)   | YES  |     | NULL    |       |
| SlotID      | varchar(10)   | NO   | PRI | NULL    |       |
| TotalCost   | decimal(10,0) | YES  |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> DESCRIBE Surgery;
ERROR 1146 (42S02): Table 'MedicalGroup.Surgery' doesn't exist
mysql> DESCRIBE Location;
ERROR 1146 (42S02): Table 'MedicalGroup.Location' doesn't exist
mysql> DESCRIBE Council;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Council | varchar(20) | NO   | PRI | NULL    |       |
| Region  | varchar(20) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> DESCRIBE Appointment;
+---------------+---------------+------+-----+---------+----------------+
| Field         | Type          | Null | Key | Default | Extra          |
+---------------+---------------+------+-----+---------+----------------+
| AppointmentID | int           | NO   | PRI | NULL    | auto_increment |
| PatientID     | varchar(10)   | YES  | MUL | NULL    |                |
| SlotID        | varchar(10)   | YES  |     | NULL    |                |
| TotalCost     | decimal(10,0) | YES  |     | NULL    |                |
+---------------+---------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM Patient;
+-----------+-------------+--------+-----------+
| PatientID | PatientName | SlotID | TotalCost |
+-----------+-------------+--------+-----------+
| P1        | Rami        | A1     |      1500 |
| P2        | Kim         | A2     |      1200 |
+-----------+-------------+--------+-----------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Appointment;
+---------------+-----------+--------+-----------+
| AppointmentID | PatientID | SlotID | TotalCost |
+---------------+-----------+--------+-----------+
|             1 | P1        | A1     |      1500 |
|             2 | P2        | A2     |      1200 |
+---------------+-----------+--------+-----------+
2 rows in set (0.00 sec)

mysql>



1. First Normal Form (1NF)
Objective: Ensure that each column contains atomic values (i.e., no repeating groups).


2. Second Normal Form (2NF)
Objective: Remove partial dependencies (i.e., non-key attributes should depend on the whole composite key).

Adjust tables:

Patient Table: Remove non-key attributes that depend on only part of the composite key.
Appointment Table: Ensure all non-key attributes depend on the entire composite key.


3. Third Normal Form (3NF)
Objective: Remove transitive dependencies (i.e., non-key attributes should not depend on other non-key attributes).

Adjust tables:

Move Postcode out of the Surgery table into a new Location table.
Move Council and Region out of the Surgery table into a new Council table.
*/


