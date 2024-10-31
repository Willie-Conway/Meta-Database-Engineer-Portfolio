# Import necessary libraries
import pandas as pd
import tableau_api_lib
from tableau_api_lib.utils.querying import get_projects_dataframe
from tableau_api_lib.utils import flatten_dict_column
from tableau_api_lib import TableauServerConnection

# Connect to Tableau Server
def connect_to_tableau(server, username, password, site_id=''):
    """Establish a connection to Tableau Server."""
    connection = TableauServerConnection(
        server=server,
        username=username,
        password=password,
        site_id=site_id
    )
    connection.signin()  # Sign in to Tableau Server
    print("Connected to Tableau Server.")
    return connection

# Download data from a Tableau workbook
def download_data(connection, workbook_id):
    """Download data from a specific workbook."""
    data = connection.download_workbook(workbook_id)
    df = pd.read_csv(data)  # Assuming data is in CSV format
    return df

# Create bar chart visualization
def create_bar_chart(df):
    """Create a bar chart using pandas and matplotlib."""
    import matplotlib.pyplot as plt

    # Group data by category and sum sales
    sales_by_category = df.groupby('Category')['Sales'].sum().reset_index()

    # Plotting the bar chart
    plt.figure(figsize=(10, 6))
    plt.bar(sales_by_category['Category'], sales_by_category['Sales'], color='skyblue')
    plt.title('Total Sales by Category')
    plt.xlabel('Product Category')
    plt.ylabel('Total Sales')
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.show()

# Create trend chart visualization
def create_trend_chart(df):
    """Create a trend chart to show profits over time."""
    import matplotlib.pyplot as plt

    # Convert 'Order Date' to datetime
    df['Order Date'] = pd.to_datetime(df['Order Date'])
    
    # Group by year and category, summing profits
    trend_data = df.groupby([df['Order Date'].dt.year, 'Category'])['Profit'].sum().unstack()

    # Plotting the trend chart
    trend_data.plot(kind='line', marker='o', figsize=(12, 8))
    plt.title('Profit Trends by Category Over Years')
    plt.xlabel('Year')
    plt.ylabel('Total Profit')
    plt.legend(title='Product Category')
    plt.grid()
    plt.show()

# Create map visualization (using Plotly for interactive maps)
def create_map_chart(df):
    """Create a map chart to visualize sales by country."""
    import plotly.express as px

    # Filter for Africa
    africa_sales = df[df['Region'] == 'Africa']

    # Create map chart
    fig = px.choropleth(
        africa_sales,
        locations='Country',
        locationmode='country names',
        color='Sales',
        hover_name='Country',
        title='Sales by Country in Africa',
        color_continuous_scale='Viridis'
    )
    fig.show()

# Main function to execute the script
def main():
    # Tableau Server connection details
    tableau_server = 'https://your-tableau-server.com'
    username = 'your_username'
    password = 'your_password'
    workbook_id = 'your_workbook_id'  # Replace with your actual workbook ID

    # Connect to Tableau
    connection = connect_to_tableau(tableau_server, username, password)

    # Download data from the Tableau workbook
    df = download_data(connection, workbook_id)

    # Create various visualizations
    create_bar_chart(df)  # Bar chart for sales by category
    create_trend_chart(df)  # Trend chart for profits over time
    create_map_chart(df)  # Map chart for sales in Africa

    # Sign out from Tableau Server
    connection.signout()
    print("Signed out from Tableau Server.")

if __name__ == '__main__':
    main()
