import mysql.connector
from mysql.connector import Error

def create_medical_group_database():
    """Create a Medical Group Surgery database with normalized tables."""
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

            # Create the medical_group database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS medical_group;")
            cursor.execute("USE medical_group;")  # Switch to the new database

            # Create the Doctor table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Doctor (
                DoctorID VARCHAR(10) PRIMARY KEY,  -- Primary key for Doctor table
                DoctorName VARCHAR(50)  -- Name of the doctor
            );
            """)

            # Create the Patient table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Patient (
                PatientID VARCHAR(10) NOT NULL,  -- Primary key for Patient table
                PatientName VARCHAR(50),
                PRIMARY KEY (PatientID)
            );
            """)

            # Create the Appointment table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Appointments (
                AppointmentID INT NOT NULL AUTO_INCREMENT,  -- Unique ID for each appointment
                PatientID VARCHAR(10) NOT NULL,  -- Foreign key referencing Patient
                SlotID VARCHAR(10),
                TotalCost DECIMAL,
                PRIMARY KEY (AppointmentID),
                FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)  -- Define foreign key
            );
            """)

            # Create the Council table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Council (
                Council VARCHAR(20) NOT NULL,  -- Primary key for Council table
                Region VARCHAR(20),  -- Associated region
                PRIMARY KEY (Council)
            );
            """)

            # Create the Location table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Location (
                SurgeryNumber INT NOT NULL,  -- Primary key for Location table
                Postcode VARCHAR(10),
                PRIMARY KEY (SurgeryNumber)
            );
            """)

            # Create the Surgery table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS Surgery (
                SurgeryNumber INT NOT NULL,  -- Primary key for Surgery table
                Region VARCHAR(20),  -- Region for the surgery
                Council VARCHAR(20),  -- Council for the surgery
                PRIMARY KEY (SurgeryNumber),
                FOREIGN KEY (Council) REFERENCES Council(Council)  -- Define foreign key
            );
            """)

            print("Medical Group Surgery database and normalized tables created successfully.")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_medical_group_database()
