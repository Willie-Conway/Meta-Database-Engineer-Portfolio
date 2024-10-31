import mysql.connector
import time

def create_stored_procedures():
    print("Creating stored procedures and functions...")
    time.sleep(1)

    # Connection for creating procedures and functions
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="LuckyShrub"
    )
    
    try:
        cursor = db_connection.cursor()

        # Create stored procedure
        create_procedure_sql = """
        DROP PROCEDURE IF EXISTS GetAllClients;
        CREATE PROCEDURE GetAllClients()
        BEGIN
            SELECT * FROM Clients;
        END;
        """
        cursor.execute(create_procedure_sql)
        print("Stored procedure 'GetAllClients' created successfully.")

        # Create stored function
        create_function_sql = """
        DROP FUNCTION IF EXISTS GetCostAverage;
        CREATE FUNCTION GetCostAverage() RETURNS DECIMAL(5,2) DETERMINISTIC
        BEGIN
            RETURN (SELECT AVG(cost) FROM Orders);
        END;
        """
        cursor.execute(create_function_sql)
        print("Stored function 'GetCostAverage' created successfully.")

        db_connection.commit()

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        db_connection.close()

def call_stored_procedures():
    print("Calling stored procedures and functions...")
    time.sleep(1)

    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Admin@LL123!",
        database="LuckyShrub"
    )

    try:
        cursor = db_connection.cursor()

        # Call the stored procedure
        cursor.callproc('GetAllClients')

        print("Clients List:")
        for result in cursor.stored_results():
            for row in result.fetchall():
                print(row)

        # Execute the function
        cursor.execute("SELECT GetCostAverage();")
        average_cost = cursor.fetchone()[0]
        print(f"Average Cost of Orders: {average_cost:.2f}")

    except mysql.connector.Error as err:
        print(f"Error calling stored procedures or functions: {err}")
    finally:
        cursor.close()
        db_connection.close()

if __name__ == "__main__":
    create_stored_procedures()
    call_stored_procedures()
