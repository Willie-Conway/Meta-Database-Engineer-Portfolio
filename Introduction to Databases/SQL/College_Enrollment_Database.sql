-- Create the college_enrollment database
CREATE DATABASE IF NOT EXISTS college_enrollment;

-- Switch to the college_enrollment database
USE college_enrollment;

-- Create the department table
CREATE TABLE IF NOT EXISTS department (
    department_number INT PRIMARY KEY,  -- Primary key for the department table
    department_name VARCHAR(100),  -- Name of the department
    head_of_department VARCHAR(100)  -- Head of the department
);

-- Create the course table
CREATE TABLE IF NOT EXISTS course (
    course_id INT PRIMARY KEY,  -- Primary key for the course table
    course_name VARCHAR(100),  -- Name of the course
    course_credits INT,  -- Number of credits for the course
    department_number INT,  -- Foreign key referencing the department
    FOREIGN KEY (department_number) REFERENCES department(department_number)  -- Define foreign key
);

-- Create the student table
CREATE TABLE IF NOT EXISTS student (
    student_id INT PRIMARY KEY,  -- Primary key for the student table
    name VARCHAR(100),  -- Student's name
    date_of_birth DATE,  -- Student's date of birth
    course_id INT,  -- Foreign key referencing the course
    FOREIGN KEY (course_id) REFERENCES course(course_id)  -- Define foreign key
);
