# Database Engineering Roles Overview

# This script describes various roles in database engineering and includes examples to illustrate their functions.

# Import necessary libraries for database connection (example with SQLite)
import sqlite3

# Example Database: Create a simple SQLite database for demonstration
def create_example_database():
    conn = sqlite3.connect('example.db')  # Create a database connection
    cursor = conn.cursor()
    
    # Create a sample table
    cursor.execute('''CREATE TABLE IF NOT EXISTS users (
                        id INTEGER PRIMARY KEY,
                        name TEXT NOT NULL,
                        age INTEGER NOT NULL)''')
    
    # Insert sample data
    cursor.execute("INSERT INTO users (name, age) VALUES ('Alice', 30)")
    cursor.execute("INSERT INTO users (name, age) VALUES ('Bob', 25)")
    
    conn.commit()  # Save changes
    conn.close()  # Close the connection

# Call the function to create an example database
create_example_database()


# Role 1: Database Administrator
class DatabaseAdministrator:
    """Responsible for optimizing data access and troubleshooting."""
    
    def __init__(self):
        self.sql_query = "SELECT * FROM users"  # Example SQL query
        
    def optimize_database(self):
        """Example function to optimize database queries."""
        print("Optimizing database for faster read/write operations.")
        
    def troubleshoot(self):
        """Example function for troubleshooting."""
        print("Working with departments to resolve data issues.")
        
    def execute_query(self):
        """Executing a sample SQL query."""
        conn = sqlite3.connect('example.db')
        cursor = conn.cursor()
        cursor.execute(self.sql_query)
        result = cursor.fetchall()
        conn.close()
        return result


# Role 2: Database Modeler
class DatabaseModeler:
    """Designs the schema and maintains documentation."""
    
    def __init__(self):
        self.schema = {
            'users': ['id INTEGER PRIMARY KEY', 'name TEXT', 'age INTEGER']
        }
        
    def create_schema(self):
        """Example function to create database schema."""
        print("Creating database schema with the following structure:")
        for table, columns in self.schema.items():
            print(f"{table}: {', '.join(columns)}")
            
    def document_schema(self):
        """Example function to document the database schema."""
        print("Documenting database architecture.")


# Role 3: Database Engineer
class DatabaseEngineer:
    """Focuses on backend database creation and data handling."""
    
    def insert_data(self, name, age):
        """Insert data into the database."""
        conn = sqlite3.connect('example.db')
        cursor = conn.cursor()
        cursor.execute("INSERT INTO users (name, age) VALUES (?, ?)", (name, age))
        conn.commit()
        conn.close()
        print(f"Inserted {name}, age {age} into the database.")
        
    def fetch_data(self):
        """Fetch data from the database."""
        conn = sqlite3.connect('example.db')
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM users")
        data = cursor.fetchall()
        conn.close()
        return data


# Role 4: Database Analyst
class DatabaseAnalyst:
    """Analyzes data to derive business insights."""
    
    def analyze_data(self):
        """Example function to analyze data."""
        db_engineer = DatabaseEngineer()
        data = db_engineer.fetch_data()
        print("Analyzing data:")
        for user in data:
            print(f"User: {user[1]}, Age: {user[2]}")


# Role 5: Database Tester
class DatabaseTester:
    """Tests the database for bugs and flaws."""
    
    def test_insertion(self):
        """Test data insertion functionality."""
        print("Testing data insertion.")
        db_engineer = DatabaseEngineer()
        db_engineer.insert_data('Charlie', 22)  # Example of data insertion
        
    def test_data_retrieval(self):
        """Test data retrieval functionality."""
        print("Testing data retrieval.")
        db_engineer = DatabaseEngineer()
        data = db_engineer.fetch_data()
        if data:
            print("Data retrieval successful.")
        else:
            print("Data retrieval failed.")


# Demonstration of the roles
if __name__ == "__main__":
    # Create the database for demonstration
    create_example_database()
    
    # Instantiate roles
    admin = DatabaseAdministrator()
    modeler = DatabaseModeler()
    engineer = DatabaseEngineer()
    analyst = DatabaseAnalyst()
    tester = DatabaseTester()
    
    # Execute role-specific functions
    admin.optimize_database()
    modeler.create_schema()
    engineer.insert_data('David', 28)  # Inserting new data
    analyst.analyze_data()  # Analyzing existing data
    tester.test_insertion()  # Testing insertion
    tester.test_data_retrieval()  # Testing data retrieval


# Output

# PS C:\Users\hirew\OneDrive\Desktop\Meta Data Engineer> python -u "c:\Users\hirew\OneDrive\Desktop\Meta Data Engineer\Database Clients\Python\How_Databases_Are_Used_in_Programming.py"
# Optimizing database for faster read/write operations.
# Creating database schema with the following structure:
# users: id INTEGER PRIMARY KEY, name TEXT, age INTEGER
# Inserted David, age 28 into the database.
# Analyzing data:
# User: Alice, Age: 30
# User: Bob, Age: 25
# User: Alice, Age: 30
# User: Bob, Age: 25
# User: David, Age: 28
# Testing data insertion.
# Inserted Charlie, age 22 into the database.
# Testing data retrieval.
# Data retrieval successful.

