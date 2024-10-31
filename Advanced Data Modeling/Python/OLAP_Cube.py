import mysql.connector
from mysql.connector import Error
import pandas as pd

# Database connection configuration
database_config = {
    'host': 'localhost',  # Update with your database host
    'database': 'global_super_store',  # Update with your database name
    'user': 'db_user',  # Update with your database username
    'password': 'db_password'  # Update with your database password
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

def execute_query(conn, query):
    """Execute a SQL query and return the result as a pandas DataFrame."""
    cursor = conn.cursor()
    cursor.execute(query)
    columns = cursor.column_names
    results = cursor.fetchall()
    cursor.close()  # Close the cursor after fetching results
    return pd.DataFrame(results, columns=columns)

def olap_cube(conn):
    """Create an OLAP cube by aggregating sales data."""
    olap_query = """
    SELECT 
        YEAR(order_date) AS year,
        country,
        product_category,
        SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY YEAR(order_date), country, product_category
    ORDER BY year, country, product_category;
    """
    return execute_query(conn, olap_query)

def slice(cube_df, category):
    """Slice the OLAP cube to focus on a specific product category."""
    return cube_df[cube_df['product_category'] == category]

def pivot(cube_df):
    """Pivot the OLAP cube to change the view."""
    return cube_df.pivot_table(index='year', columns='country', values='total_sales', aggfunc='sum')

def dice(cube_df, categories, countries):
    """Dice the OLAP cube for specific categories and countries."""
    return cube_df[(cube_df['product_category'].isin(categories)) & (cube_df['country'].isin(countries))]

def drill_down(conn, year):
    """Drill down to see quarterly data for a specific year."""
    quarterly_query = f"""
    SELECT 
        QUARTER(order_date) AS quarter,
        country,
        product_category,
        SUM(sales_amount) AS total_sales
    FROM sales
    WHERE YEAR(order_date) = {year}
    GROUP BY QUARTER(order_date), country, product_category
    ORDER BY quarter, country, product_category;
    """
    return execute_query(conn, quarterly_query)

def roll_up(cube_df):
    """Roll up to see aggregated sales by year and country."""
    return cube_df.groupby(['year', 'country'], as_index=False).agg({'total_sales': 'sum'})

def main():
    # Connect to the database
    global_super_store_conn = create_connection(database_config)
    
    if global_super_store_conn:
        # Create OLAP cube
        cube_df = olap_cube(global_super_store_conn)
        print("OLAP Cube:")
        print(cube_df)

        # Slice operation
        furniture_sales = slice(cube_df, 'Furniture')
        print("\nSlice for Furniture Sales:")
        print(furniture_sales)

        # Pivot operation
        pivoted_cube = pivot(cube_df)
        print("\nPivoted OLAP Cube:")
        print(pivoted_cube)

        # Dice operation
        dicing_result = dice(cube_df, ['Furniture', 'Technology'], ['France', 'Germany'])
        print("\nDiced Cube (Furniture and Technology in France and Germany):")
        print(dicing_result)

        # Drill-down operation for the year 2022
        drill_down_result = drill_down(global_super_store_conn, 2022)
        print("\nDrill-down to Quarterly Data for 2022:")
        print(drill_down_result)

        # Roll-up operation
        rolled_up_result = roll_up(cube_df)
        print("\nRolled-up Sales Data by Year and Country:")
        print(rolled_up_result)

        global_super_store_conn.close()

if __name__ == '__main__':
    main()
