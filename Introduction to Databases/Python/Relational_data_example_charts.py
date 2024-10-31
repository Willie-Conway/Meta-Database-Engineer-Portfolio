import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Print available styles
print("Available styles:", plt.style.available)

# Set a style for the charts
plt.style.use('ggplot')  # Change this if you find another style you prefer

# ---- Bar Chart ----
# Sample data for the bar chart representing bookshop sales from 2019 to 2022
years = ['2019', '2020', '2021', '2022']
sales = [50000, 30000, 20000, 10000]  # Example sales data in dollars

# Creating the bar chart
plt.figure(figsize=(10, 6))
plt.bar(years, sales, color='skyblue')
plt.title('Bookshop Sales Revenue (2019-2022)')
plt.xlabel('Year')
plt.ylabel('Sales Revenue ($)')
plt.ylim(0, 60000)  # Setting the limit for y-axis
plt.grid(axis='y')

# Save the bar chart as an image file
plt.savefig('bar_chart.png')

# Display the bar chart
plt.show()

# ---- Bubble Chart ----
# Sample data for the bubble chart representing population of the largest countries
countries = ['China', 'India', 'USA', 'Indonesia', 'Russia', 'Egypt']
population = [1400, 1300, 330, 270, 145, 100]  # Population in millions
sizes = [800, 700, 300, 250, 150, 100]  # Size of bubbles

# Creating the bubble chart
plt.figure(figsize=(10, 6))
plt.scatter(countries, population, s=sizes, alpha=0.5, color='coral', edgecolors='w', linewidth=2)
plt.title('Population of the 10 Largest Countries (2015)')
plt.xlabel('Country')
plt.ylabel('Population (millions)')
plt.grid(axis='y')

# Save the bubble chart as an image file
plt.savefig('bubble_chart.png')

# Display the bubble chart
plt.show()

# ---- Line Chart ----
# Sample data for the line chart representing gold prices over a month
dates = pd.date_range(start='2023-10-01', periods=30)  # 30 days of October
gold_prices = np.random.uniform(low=60000, high=65000, size=30).round(2)  # Random prices

# Creating the line chart
plt.figure(figsize=(10, 6))
plt.plot(dates, gold_prices, marker='o', linestyle='-', color='gold', markersize=5)
plt.title('Gold Price Over the Month of October 2023')
plt.xlabel('Date')
plt.ylabel('Price ($ per kg)')
plt.xticks(rotation=45)  # Rotate date labels
plt.grid()

# Save the line chart as an image file
plt.savefig('line_chart.png')

# Display the line chart
plt.show()

# ---- Pie Chart ----
# Sample data for the pie chart representing students' favorite sports
sports = ['Soccer', 'Tennis', 'Swimming']
preferences = [50, 25, 25]  # Percentages

# Creating the pie chart
plt.figure(figsize=(8, 8))
plt.pie(preferences, labels=sports, autopct='%1.1f%%', startangle=140, colors=['#ff9999','#66b3ff','#99ff99'])
plt.title('Students\' Favorite Sports')
plt.axis('equal')  # Equal aspect ratio ensures pie chart is circular

# Save the pie chart as an image file
plt.savefig('pie_chart.png')

# Display the pie chart
plt.show()

# ---- Additional Charts ----
# Sample data for an Area Chart (for illustration)
x = np.arange(1, 11)
y1 = x ** 2
y2 = x ** 1.5

# Creating an area chart
plt.figure(figsize=(10, 6))
plt.fill_between(x, y1, color="skyblue", alpha=0.4, label="x squared")
plt.fill_between(x, y2, color="coral", alpha=0.4, label="x to the power of 1.5")
plt.title('Area Chart Example')
plt.xlabel('X values')
plt.ylabel('Y values')
plt.legend()
plt.grid()

# Save the area chart as an image file
plt.savefig('area_chart.png')

# Display the area chart
plt.show()
