import mysql.connector
from mysql.connector import Error
import pandas as pd

# Database connection configuration
source_db_config = {
    'host': 'source_host',  # Update with your source database host
    'database': 'source_db',  # Update with your source database name
    'user': 'source_user',  # Update with your source database username
    'password': 'source_password'  # Update with your source database password
}

warehouse_db_config = {
    'host': 'localhost',  # Update with your data warehouse host
    'database': 'data_warehouse',  # Update with your warehouse database name
    'user': 'warehouse_user',  # Update with your warehouse username
    'password': 'warehouse_password'  # Update with your warehouse password
}

def create_connection(config):
    """Create a database connection."""
    conn = None
    try:
        conn = mysql.connector.connect(**config)
        if conn.is_connected():
            print(f"Connected to {config['database']}")
    except Error as e:
        print(f"Error: {e}")
    return conn

def extract_data(conn):
    """Extract data from source databases."""
    extract_query = "SELECT * FROM source_table;"  # Modify the table name as needed
    df = pd.read_sql(extract_query, conn)
    print("Data extracted successfully")
    return df

def transform_data(df):
    """Transform the data into a suitable format."""
    # Example transformations
    df['FullName'] = df['FirstName'] + ' ' + df['LastName']  # Concatenate first and last name
    df['Profit'] = df['SellingPrice'] - df['BuyingPrice']  # Calculate profit
    df['Date'] = pd.to_datetime(df['Date'])  # Ensure date is in datetime format
    
    # Clean data: remove duplicates and invalid entries
    df = df.drop_duplicates()
    df = df[df['Profit'] >= 0]  # Keep only valid profit entries
    print("Data transformed successfully")
    return df

def load_data(conn, df):
    """Load the transformed data into the data warehouse."""
    cursor = conn.cursor()
    insert_query = """
    INSERT INTO warehouse_table (FullName, Profit, Date) VALUES (%s, %s, %s)  # Modify table structure as needed
    """
    for row in df.itertuples(index=False):
        cursor.execute(insert_query, (row.FullName, row.Profit, row.Date))
    
    conn.commit()
    print("Data loaded successfully")

def main():
    # Extract
    source_conn = create_connection(source_db_config)
    if source_conn:
        data = extract_data(source_conn)
        source_conn.close()

    # Transform
    transformed_data = transform_data(data)

    # Load
    warehouse_conn = create_connection(warehouse_db_config)
    if warehouse_conn:
        load_data(warehouse_conn, transformed_data)
        warehouse_conn.close()

if __name__ == '__main__':
    main()
