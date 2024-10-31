# Import necessary libraries
import pandas as pd

# Function to display a schema for different database types
def display_schema(title, schema):
    print(f"\n{title}")
    print("=" * len(title))
    for table, columns in schema.items():
        print(f"\nTable: {table}")
        print("Columns:", ", ".join(columns))

# Flat File Database Example
flat_file_schema = {
    "FlatFile": ["OrderID", "CustomerID", "OrderDate"]
}

# Hierarchical Database Example
hierarchical_schema = {
    "Student": ["StudentID", "Name"],
    "Course": ["CourseID", "CourseName"],
    "Enrollment": ["StudentID", "CourseID"]
}

# Network Database Example
network_schema = {
    "Teacher": ["TeacherID", "Name"],
    "Course": ["CourseID", "CourseName"],
    "Teaching": ["TeacherID", "CourseID"]
}

# Relational Database Example
relational_schema = {
    "Professor": ["PROF_ID (Primary Key)", "Name", "Department"],
    "Course": ["COURSE_ID (Primary Key)", "CourseName"],
    "Class": ["CLASS_ID (Primary Key)", "PROF_ID (Foreign Key)", "COURSE_ID (Foreign Key)"]
}

# Object-Oriented Database Example
object_oriented_schema = {
    "Person": ["PersonID", "Name", "Email"],
    "Author": ["AuthorID (Foreign Key)", "Biography"],
    "Customer": ["CustomerID (Foreign Key)", "PurchaseHistory"]
}

# NoSQL Database Example (Document Store)
nosql_schema = {
    "Document": ["Field1", "Field2", "Field3"]
}

# Main function to display all schemas
def main():
    # Display schemas for different database types
    display_schema("Flat File Database Schema", flat_file_schema)
    display_schema("Hierarchical Database Schema", hierarchical_schema)
    display_schema("Network Database Schema", network_schema)
    display_schema("Relational Database Schema", relational_schema)
    display_schema("Object-Oriented Database Schema", object_oriented_schema)
    display_schema("NoSQL Database Schema", nosql_schema)

# Run the main function
if __name__ == "__main__":
    main()
