import pandas as pd
import sqlite3
import plotly.express as px
from dash import Dash, dcc, html, Input, Output

# Load the Global Super Store dataset
data_file = r'C:\Users\hirew\OneDrive\Desktop\Meta Data Engineer\Advanced Data Modeling\Tableau\Datasources\global_super_store.xlsx'  # Replace with your actual path
df = pd.read_excel(data_file)

# Prepare the dataset for analysis
df['Order Date'] = pd.to_datetime(df['Order Date'])
df['Ship Date'] = pd.to_datetime(df['Ship Date'])

# Create SQLite database and tables
conn = sqlite3.connect('global_super_store.db')  # Create a new SQLite database
df.to_sql('orders', conn, if_exists='replace', index=False)  # Load data into SQLite

# Normalize data by creating separate tables
customers = df[['Customer ID', 'Customer Name', 'City', 'State', 'Country', 'Postal Code']].drop_duplicates()
customers.to_sql('customers', conn, if_exists='replace', index=False)

products = df[['Product ID', 'Product Name', 'Category', 'Sub-Category', 'Sales']].drop_duplicates()
products.to_sql('products', conn, if_exists='replace', index=False)

# Close the database connection
conn.close()

# Reconnect to read data
conn = sqlite3.connect('global_super_store.db')

# Query sales data for analysis
state_sales = pd.read_sql_query('SELECT State, SUM(Sales) as Total_Sales FROM orders GROUP BY State', conn)

# Updated SQL query to handle spaces in column names
state_profits = pd.read_sql_query('SELECT State, SUM(Profit) as Total_Profit, SUM(Quantity) as Total_Quantity, SUM("Shipping Cost") as Total_Shipping FROM orders GROUP BY State', conn)

# Clean state names if necessary
state_sales['State'] = state_sales['State'].str.strip("'")
state_profits['State'] = state_profits['State'].str.strip("'")

# Sales Trend Line Chart
sales_trends = pd.read_sql_query('SELECT strftime("%Y", "Order Date") as Year, State, SUM(Sales) as Total_Sales FROM orders GROUP BY Year, State HAVING Total_Sales > 40000', conn)

# Create visualizations
fig_map = px.choropleth(
    state_sales,
    locations='State',
    locationmode='USA-states',
    color='Total_Sales',
    hover_name='State',
    title='Sales in the USA',
    color_continuous_scale=px.colors.sequential.Plasma
)

fig_bubble = px.scatter(
    state_profits,
    x='State',
    y='Total_Profit',
    size='Total_Quantity',
    hover_data=['Total_Profit', 'Total_Quantity', 'Total_Shipping'],
    title='Profits in the USA'
)

fig_line = px.line(
    sales_trends,
    x='Year',
    y='Total_Sales',
    color='State',
    title='Sales Trend in the USA'
)

# Create a Dash app for the interactive dashboard
app = Dash(__name__)

app.layout = html.Div([
    html.H1("Sales and Profits Dashboard for Global Super Store"),
    
    # Map Chart
    dcc.Graph(figure=fig_map, id='sales-map'),
    
    # Bubble Chart
    dcc.Graph(figure=fig_bubble, id='profits-bubble'),
    
    # Line Chart
    dcc.Graph(figure=fig_line, id='sales-trend-line')
])

@app.callback(
    Output('profits-bubble', 'figure'),
    Input('sales-map', 'clickData')
)
def update_bubble_chart(clickData):
    if clickData is None:
        return fig_bubble  # Return original bubble chart if nothing is clicked
    
    state_name = clickData['points'][0]['hovertext']
    filtered_data = state_profits[state_profits['State'] == state_name]
    
    updated_fig = px.scatter(
        filtered_data,
        x='State',
        y='Total_Profit',
        size='Total_Quantity',
        hover_data=['Total_Profit', 'Total_Quantity', 'Total_Shipping'],
        title=f'Profits in {state_name}'
    )
    
    return updated_fig

if __name__ == '__main__':
    app.run_server(debug=True)
