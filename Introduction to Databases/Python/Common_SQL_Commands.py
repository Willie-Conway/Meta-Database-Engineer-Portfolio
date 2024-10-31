# Define a function to display SQL commands with their descriptions
def display_sql_commands(commands):
    for category, commands_list in commands.items():
        print(f"\n{category}")
        print("=" * len(category))
        for command, details in commands_list.items():
            print(f"\nCommand: {command}")
            print(f"Purpose: {details['purpose']}")
            print(f"Syntax: {details['syntax']}")

# Main function to define and display SQL commands
def main():
    # Define SQL commands categorized by DDL, DML, DCL, and TCL
    sql_commands = {
        "Data Definition Language (DDL)": {
            "CREATE": {
                "purpose": "To create the database or tables inside the database.",
                "syntax": "CREATE TABLE table_name (column_name1 datatype(size), column_name2 datatype(size), column_name3 datatype(size));"
            },
            "DROP": {
                "purpose": "To delete a database or a table inside the database.",
                "syntax": "DROP TABLE table_name;"
            },
            "ALTER": {
                "purpose": "To change the structure of the tables in the database.",
                "syntax": [
                    "ALTER TABLE table_name ADD (column_name datatype(size));",  # Add a column
                    "ALTER TABLE table_name ADD primary key (column_name);"  # Add primary key
                ]
            },
            "TRUNCATE": {
                "purpose": "To remove all records from a table without deleting the table itself.",
                "syntax": "TRUNCATE TABLE table_name;"
            },
            "COMMENT": {
                "purpose": "To add comments to explain SQL statements.",
                "syntax": "-- This is a comment"
            }
        },
        "Data Query Language (DQL)": {
            "SELECT": {
                "purpose": "To retrieve data from tables in the database.",
                "syntax": "SELECT * FROM table_name;"
            }
        },
        "Data Manipulation Language (DML)": {
            "INSERT": {
                "purpose": "To add records of data into an existing table.",
                "syntax": "INSERT INTO table_name (column1, column2, column3) VALUES (value1, value2, value3);"
            },
            "UPDATE": {
                "purpose": "To modify or update data contained within a table.",
                "syntax": "UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;"
            },
            "DELETE": {
                "purpose": "To delete data from a table in the database.",
                "syntax": "DELETE FROM table_name WHERE condition;"
            }
        },
        "Data Control Language (DCL)": {
            "GRANT": {
                "purpose": "To provide a user with the privileges required to access and manipulate the database.",
                "syntax": "GRANT privilege_type ON database_name TO user;"
            },
            "REVOKE": {
                "purpose": "To remove permissions from any user.",
                "syntax": "REVOKE privilege_type ON database_name FROM user;"
            }
        },
        "Transaction Control Language (TCL)": {
            "COMMIT": {
                "purpose": "To save all the work you have already done in the database.",
                "syntax": "COMMIT;"
            },
            "ROLLBACK": {
                "purpose": "To restore the database to the last committed state.",
                "syntax": "ROLLBACK;"
            }
        }
    }

    # Display all SQL commands with their descriptions
    display_sql_commands(sql_commands)

# Run the main function
if __name__ == "__main__":
    main()
