import mysql.connector
from mysql.connector import Error

def create_college_enrollment_database():
    """Create a college enrollment database with tables for students, courses, and departments."""
    connection = None  # Initialize connection variable
    try:
        # Establish a connection to the MySQL server (without specifying a database)
        connection = mysql.connector.connect(
            host='localhost',
            user='mario',  # Replace with your MySQL username
            password='cuisine'  # Replace with your MySQL password
        )
        
        if connection.is_connected():
            cursor = connection.cursor()
            
            # Create the college_enrollment database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS college_enrollment;")
            cursor.execute("USE college_enrollment;")  # Switch to the new database
            
            # Create the department table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS department (
                department_number INT PRIMARY KEY,  -- Primary key for the department table
                department_name VARCHAR(100),  -- Name of the department
                head_of_department VARCHAR(100)  -- Head of the department
            );
            """)

            # Create the course table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS course (
                course_id INT PRIMARY KEY,  -- Primary key for the course table
                course_name VARCHAR(100),  -- Name of the course
                course_credits INT,  -- Number of credits for the course
                department_number INT,  -- Foreign key referencing the department
                FOREIGN KEY (department_number) REFERENCES department(department_number)  -- Define foreign key
            );
            """)

            # Create the student table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS student (
                student_id INT PRIMARY KEY,  -- Primary key for the student table
                name VARCHAR(100),  -- Student's name
                date_of_birth DATE,  -- Student's date of birth
                course_id INT,  -- Foreign key referencing the course
                FOREIGN KEY (course_id) REFERENCES course(course_id)  -- Define foreign key
            );
            """)

            print("College enrollment database and tables created successfully.")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_college_enrollment_database()
