import pandas as pd

# Load the CSV file
df = pd.read_csv(r'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_data.csv')

# Remove duplicate rows based on 'OrderID'
df.drop_duplicates(subset=['OrderID'], inplace=True)

# Standardize Categories and Subcategories (if needed)
category_mapping = {
    'Other': 'Miscellaneous',
    # Add any other mappings needed
}

# You can add mappings for OrderStatus, PaymentStatus, etc., as needed
status_mapping = {
    'Pending': 'Pending',
    'Delivered': 'Delivered',
    'Cancelled': 'Cancelled',
}

df['Category'] = df['Category'].replace(category_mapping)
df['OrderStatus'] = df['OrderStatus'].replace(status_mapping)

# Convert relevant columns to numeric types
numeric_columns = ['Sales', 'Discount', 'Profit', 'TotalCost']
for column in numeric_columns:
    df[column] = pd.to_numeric(df[column], errors='coerce')  # Convert to numeric, coercing errors to NaN

# Ensure all prices are above 0 (removes rows with invalid sales, discount, and profit values)
df = df[df['Sales'] > 0]
df = df[df['Profit'] >= 0]  # Assuming profit can't be negative
df = df[df['TotalCost'] > 0]  # Ensure total cost is valid

# Save the cleaned DataFrame to a new CSV file
df.to_csv(r'C:/Users/hirew/OneDrive/Desktop/LittleLemonDB/cleaned_orders.csv', index=False)

print("Data cleaned and saved to 'cleaned_orders.csv'")

