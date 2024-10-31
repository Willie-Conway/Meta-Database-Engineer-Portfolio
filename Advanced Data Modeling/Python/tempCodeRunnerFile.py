import pandas as pd
import plotly.express as px
import sqlite3
from dash import Dash, dcc, html, Input, Output

# Check SQLite version
print(sqlite3.version)

# Step 1: Load the Global Super Store dataset
data_file = r'C:\Users\hirew\OneDrive\Desktop\Meta Data Engineer\Advanced Data Modeling\Tableau\Datasources\global_super_store.csv'
df = pd.read_csv(data_file)

# Step 2: Prepare the dataset for analysis
df['Order Date'] = pd.to_datetime(df['Order Date'])
df['Ship Date'] = pd.to_datetime(df['Ship Date'])

# Create a new column 'Warranty' based on 90 days from the 'Order Date'
df['Warranty'] = df['Order Date'] + pd.Timedelta(days=90)

# Step 3: Create a map chart to show sales in Africa
africa_sales = df[df['Region'] == 'Africa']

# Create a map chart using Plotly
fig_map = px.choropleth(
    africa_sales,
    locations='Country',
    locationmode='country names',
    color='Sales',
    hover_name='Country',
    hover_data=['Quantity', 'Sales'],
    title='Sales in Africa',
    color_continuous_scale=px.colors.sequential.Plasma
)

# Show the map
fig_map.show()

# Step 4: Create a bar chart for profits in Africa
profitable_africa = africa_sales[africa_sales['Profit'] >= 500]

# Create a bar chart
fig_bar = px.bar(
    profitable_africa,
    x='Country',
    y='Profit',
    hover_data=['Profit', 'Shipping Cost'],
    title='Profits in Africa',
    labels={'Profit': 'Profit ($)', 'Country': 'Country'}
)

# Show the bar chart
fig_bar.show()

# Step 5: Create an interactive dashboard
app = Dash(__name__)

app.layout = html.Div([
    dcc.Graph(figure=fig_map, id='sales-map'),
    dcc.Graph(figure=fig_bar, id='profits-bar')
])

@app.callback(
    Output('profits-bar', 'figure'),
    Input('sales-map', 'clickData')
)
def update_bar_chart(clickData):
    if clickData is None:
        return fig_bar  # Return original bar chart if nothing is clicked
    country_name = clickData['points'][0]['hovertext']
    filtered_data = profitable_africa[profitable_africa['Country'] == country_name]
    updated_fig = px.bar(
        filtered_data,
        x='Country',
        y='Profit',
        hover_data=['Profit', 'Shipping Cost'],
        title=f'Profits in {country_name}',
    )
    return updated_fig

if __name__ == '__main__':
    app.run_server(debug=True)