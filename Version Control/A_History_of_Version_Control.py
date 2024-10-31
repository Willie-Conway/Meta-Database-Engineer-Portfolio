import mysql.connector
from mysql.connector import Error

def create_version_control_db():
    """Create a Version Control database with information about various systems."""
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

            # Create the version_control database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS version_control;")
            cursor.execute("USE version_control;")  # Switch to the new database

            # Create the VersionControl table
            cursor.execute("""
            CREATE TABLE IF NOT EXISTS VersionControl (
                VCSystemID INT NOT NULL AUTO_INCREMENT,  -- Unique ID for each version control system
                VCName VARCHAR(50) NOT NULL,  -- Name of the version control system
                ReleaseYear INT NOT NULL,  -- Year of release
                KeyFeatures TEXT,  -- Key features of the system
                PRIMARY KEY (VCSystemID)  -- Primary key for the table
            );
            """)

            # Insert data for various version control systems
            cursor.execute("""
            INSERT INTO VersionControl (VCName, ReleaseYear, KeyFeatures)
            VALUES
            ('CVS', 1986, 'First significant VCS, lacks integrity checks, primarily for text files'),
            ('Subversion (SVN)', 2000, 'Improved data integrity, better binary file support, centralized model'),
            ('Mercurial', 2005, 'High-performance distributed VCS, easy transition from SVN'),
            ('Git', 2005, 'Distributed VCS, popularized by GitHub, ideal for open-source projects');
            """)

            connection.commit()  # Commit changes to the database

            print("Version Control database and table created successfully with initial data.")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_version_control_db()
