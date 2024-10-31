def little_lemon_starters_tasks():
    """Manage Little Lemon Starters using MySQL REPLACE statement."""

    # Task 1: Insert a new starter using REPLACE statement
    print("Task 1: Insert a new starter.")

    task1_sql = """
    -- REPLACE INTO statement to insert a new starter
    REPLACE INTO Starters (StarterName, Cost, StarterType) 
    VALUES ("Cheese bread", 9.50, "Indian"); 
    """
    
    print("SQL for Task 1:")
    print(task1_sql)

    # After executing the above SQL, check the contents of the Starters table
    print("Executing the above SQL will insert 'Cheese bread' into the Starters table.\n")
    print("Select all data from the Starters table to verify:")
    print("SELECT * FROM Starters;")

    # Task 2: Update the cost of 'Cheese bread' using REPLACE statement
    print("\nTask 2: Update the cost of 'Cheese bread'.")

    task2_sql = """
    -- REPLACE INTO statement to update the cost of 'Cheese bread'
    REPLACE INTO Starters (StarterName, Cost, StarterType) 
    VALUES ("Cheese bread", 9.75, "Indian"); 
    """
    
    print("SQL for Task 2:")
    print(task2_sql)

    # After executing the update SQL, check the contents of the Starters table
    print("Executing the above SQL will update the cost of 'Cheese bread' to $9.75.\n")
    print("Select all data from the Starters table to verify:")
    print("SELECT * FROM Starters;")

if __name__ == "__main__":
    print("Little Lemon Database Tasks:")
    little_lemon_starters_tasks()
