-- Create the medical_group database
CREATE DATABASE IF NOT EXISTS medical_group;

-- Switch to the medical_group database
USE medical_group;

-- Create the Doctor table
CREATE TABLE IF NOT EXISTS Doctor (
    DoctorID VARCHAR(10) PRIMARY KEY,  -- Primary key for Doctor table
    DoctorName VARCHAR(50)  -- Name of the doctor
);

-- Create the Patient table
CREATE TABLE IF NOT EXISTS Patient (
    PatientID VARCHAR(10) NOT NULL,  -- Primary key for Patient table
    PatientName VARCHAR(50),
    PRIMARY KEY (PatientID)
);

-- Create the Appointments table
CREATE TABLE IF NOT EXISTS Appointments (
    AppointmentID INT NOT NULL AUTO_INCREMENT,  -- Unique ID for each appointment
    PatientID VARCHAR(10) NOT NULL,  -- Foreign key referencing Patient
    SlotID VARCHAR(10),
    TotalCost DECIMAL,
    PRIMARY KEY (AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)  -- Define foreign key
);

-- Create the Council table
CREATE TABLE IF NOT EXISTS Council (
    Council VARCHAR(20) NOT NULL,  -- Primary key for Council table
    Region VARCHAR(20),  -- Associated region
    PRIMARY KEY (Council)
);

-- Create the Location table
CREATE TABLE IF NOT EXISTS Location (
    SurgeryNumber INT NOT NULL,  -- Primary key for Location table
    Postcode VARCHAR(10),
    PRIMARY KEY (SurgeryNumber)
);

-- Create the Surgery table
CREATE TABLE IF NOT EXISTS Surgery (
    SurgeryNumber INT NOT NULL,  -- Primary key for Surgery table
    Region VARCHAR(20),  -- Region for the surgery
    Council VARCHAR(20),  -- Council for the surgery
    PRIMARY KEY (SurgeryNumber),
    FOREIGN KEY (Council) REFERENCES Council(Council)  -- Define foreign key
);
