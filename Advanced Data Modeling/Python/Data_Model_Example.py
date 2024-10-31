# Import necessary modules
import mysql.connector
from mysql.connector import Error

# Define database configuration
dbconfig = {
    "database": "surgery_booking_db",
    "user": "your_username",  # Replace with your MySQL username
    "password": "your_password"  # Replace with your MySQL password
}

# Function to create database and tables
def create_database_and_tables():
    """Creates the database and the required tables for the surgery appointment system."""
    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host='localhost',  # Adjust if your MySQL server is on a different host
            user=dbconfig["user"],
            password=dbconfig["password"]
        )
        
        cursor = connection.cursor()
        
        # Create the database
        cursor.execute("CREATE DATABASE IF NOT EXISTS surgery_booking_db;")
        cursor.execute("USE surgery_booking_db;")
        
        # Create Doctor table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Doctors (
            DoctorID INT AUTO_INCREMENT PRIMARY KEY,
            Name VARCHAR(100) NOT NULL,
            Specialization VARCHAR(100) NOT NULL
        );
        """)
        
        # Create Patient table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Patients (
            PatientID INT AUTO_INCREMENT PRIMARY KEY,
            FirstName VARCHAR(100) NOT NULL,
            LastName VARCHAR(100) NOT NULL,
            DateOfBirth DATE NOT NULL
        );
        """)
        
        # Create Appointments table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Appointments (
            AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
            AppointmentTime DATETIME NOT NULL,
            DoctorID INT,
            PatientID INT,
            FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
            FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
        );
        """)
        
        # Create Surgery table
        cursor.execute("""
        CREATE TABLE IF NOT EXISTS Surgeries (
            SurgeryID INT AUTO_INCREMENT PRIMARY KEY,
            SurgeryName VARCHAR(100) NOT NULL,
            Location VARCHAR(100) NOT NULL
        );
        """)

        print("Database and tables created successfully.")
        
    except Error as e:
        print(f"The error '{e}' occurred")
    finally:
        cursor.close()
        connection.close()

# Function to insert sample data into tables
def insert_sample_data():
    """Inserts sample data into Doctors, Patients, Appointments, and Surgeries tables."""
    try:
        connection = mysql.connector.connect(**dbconfig)
        cursor = connection.cursor()

        # Insert sample doctors
        doctors = [
            ('Dr. Smith', 'Cardiology'),
            ('Dr. Jones', 'Neurology'),
            ('Dr. Brown', 'Orthopedics')
        ]
        cursor.executemany("INSERT INTO Doctors (Name, Specialization) VALUES (%s, %s);", doctors)

        # Insert sample patients
        patients = [
            ('John', 'Doe', '1985-05-15'),
            ('Jane', 'Doe', '1990-08-22'),
            ('Alice', 'Johnson', '1975-11-30')
        ]
        cursor.executemany("INSERT INTO Patients (FirstName, LastName, DateOfBirth) VALUES (%s, %s, %s);", patients)

        # Insert sample surgeries
        surgeries = [
            ('Heart Bypass', 'Surgery Room A'),
            ('Knee Replacement', 'Surgery Room B')
        ]
        cursor.executemany("INSERT INTO Surgeries (SurgeryName, Location) VALUES (%s, %s);", surgeries)

        # Insert sample appointments
        appointments = [
            ('2024-10-31 09:00:00', 1, 1),
            ('2024-10-31 10:30:00', 2, 2),
            ('2024-10-31 14:00:00', 3, 3)
        ]
        cursor.executemany("INSERT INTO Appointments (AppointmentTime, DoctorID, PatientID) VALUES (%s, %s, %s);", appointments)

        connection.commit()
        print("Sample data inserted successfully.")
        
    except Error as e:
        print(f"The error '{e}' occurred")
    finally:
        cursor.close()
        connection.close()

# Main function to execute the script
def main():
    create_database_and_tables()
    insert_sample_data()

if __name__ == "__main__":
    main()
