# Import necessary libraries
import sqlite3

# Function to create a database and tables
def create_database():
    # Connect to SQLite database (or create it)
    connection = sqlite3.connect('student_info.db')
    cursor = connection.cursor()

    # Create a Student table with appropriate data types
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS Student (
        student_id INTEGER PRIMARY KEY,   -- Primary key
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        date_of_birth DATE,
        home_address VARCHAR(100),
        faculty VARCHAR(50)
    );
    ''')

    # Create a Department table
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS Department (
        department_id INTEGER PRIMARY KEY, -- Primary key
        department_name VARCHAR(50)
    );
    ''')

    # Create a Enrollment table with a foreign key
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS Enrollment (
        enrollment_id INTEGER PRIMARY KEY,
        student_id INTEGER,                 -- Foreign key
        department_id INTEGER,              -- Foreign key
        FOREIGN KEY (student_id) REFERENCES Student(student_id),
        FOREIGN KEY (department_id) REFERENCES Department(department_id)
    );
    ''')

    # Commit changes and close the connection
    connection.commit()
    connection.close()
    print("Database and tables created successfully.")

# Function to insert sample data into tables
def insert_sample_data():
    connection = sqlite3.connect('student_info.db')
    cursor = connection.cursor()

    # Insert sample departments
    cursor.execute("INSERT INTO Department (department_name) VALUES ('Computer Science')")
    cursor.execute("INSERT INTO Department (department_name) VALUES ('Mathematics')")
    
    # Insert sample students
    cursor.execute("INSERT INTO Student (first_name, last_name, date_of_birth, home_address, faculty) VALUES ('Emily', 'Williams', '2000-05-21', '123 Elm St', 'Computer Science')")
    cursor.execute("INSERT INTO Student (first_name, last_name, date_of_birth, home_address, faculty) VALUES ('John', 'Doe', '1999-08-15', '456 Maple Ave', 'Mathematics')")

    # Insert sample enrollments
    cursor.execute("INSERT INTO Enrollment (student_id, department_id) VALUES (1, 1)")
    cursor.execute("INSERT INTO Enrollment (student_id, department_id) VALUES (2, 2)")

    # Commit changes and close the connection
    connection.commit()
    connection.close()
    print("Sample data inserted successfully.")

# Function to display data from the Student table
def display_students():
    connection = sqlite3.connect('student_info.db')
    cursor = connection.cursor()

    # Retrieve and display all records from the Student table
    cursor.execute("SELECT * FROM Student;")
    students = cursor.fetchall()

    print("\nStudent Records:")
    for student in students:
        print(student)

    connection.close()

# Function to display data from the Enrollment table
def display_enrollments():
    connection = sqlite3.connect('student_info.db')
    cursor = connection.cursor()

    # Retrieve and display all records from the Enrollment table
    cursor.execute('''
    SELECT Enrollment.enrollment_id, Student.first_name, Student.last_name, Department.department_name 
    FROM Enrollment
    JOIN Student ON Enrollment.student_id = Student.student_id
    JOIN Department ON Enrollment.department_id = Department.department_id;
    ''')
    
    enrollments = cursor.fetchall()

    print("\nEnrollment Records:")
    for enrollment in enrollments:
        print(enrollment)

    connection.close()

# Main function to execute the script
def main():
    create_database()         # Create database and tables
    insert_sample_data()      # Insert sample data
    display_students()        # Display student records
    display_enrollments()     # Display enrollment records

# Run the main function
if __name__ == "__main__":
    main()
