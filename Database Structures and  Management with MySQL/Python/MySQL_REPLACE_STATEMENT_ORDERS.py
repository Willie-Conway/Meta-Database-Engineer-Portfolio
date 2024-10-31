def lucky_shrub_orders_tasks():
    """Manage Lucky Shrub Orders using MySQL REPLACE statement."""

    # Task 1: Insert two new orders using REPLACE statement
    print("Task 1: Insert two new orders.")

    task1_sql = """
    -- REPLACE INTO statement to insert new orders
    REPLACE INTO Orders (OrderID, ClientID, ProductID, Quantity, Cost)
    VALUES 
        (9, 'Cl1', 'P1', 10, 5000),  -- New order for Client Cl1
        (10, 'Cl2', 'P2', 5, 100);    -- New order for Client Cl2
    """
    
    print("SQL for Task 1:")
    print(task1_sql)

    # After executing the above SQL, you would check the contents of the Orders table
    print("Executing the above SQL will insert two new orders into the Orders table.\n")
    print("Select all data from the Orders table to verify:")
    print("SELECT * FROM Orders;")

    # Task 2: Update the cost of order number 9
    print("\nTask 2: Update the cost of order number 9.")

    task2_sql = """
    -- REPLACE INTO statement to update the cost of order number 9
    REPLACE INTO Orders 
    SET OrderID = 9, 
        ClientID = 'Cl1', 
        ProductID = 'P1', 
        Quantity = 10, 
        Cost = 500;  -- Correcting the cost to $500
    """
    
    print("SQL for Task 2:")
    print(task2_sql)

    # After executing the update SQL, you would again check the contents of the Orders table
    print("Executing the above SQL will update the cost of order number 9.\n")
    print("Select all data from the Orders table to verify:")
    print("SELECT * FROM Orders;")

if __name__ == "__main__":
    print("Lucky Shrub Database Tasks:")
    lucky_shrub_orders_tasks()
