import pandas as pd

# Load the CSV file
df = pd.read_csv(r'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/menus_data.csv')

# Remove duplicate rows based on 'MenuItemID'
df.drop_duplicates(subset=['MenuItemID'], inplace=True)

# Standardize Categories and Subcategories (if needed)
category_mapping = {
    'Other': 'Miscellaneous',
    # Add any other mappings needed
}

df['Category'] = df['Category'].replace(category_mapping)

# Ensure all prices are above 0 (removes rows with invalid prices)
df = df[df['Price'] > 0]

# Save the cleaned DataFrame to a new CSV file
df.to_csv(r'C:/Users/hirew/OneDrive/Desktop/LittleLemonDB/cleaned_menu.csv', index=False)

print("Data cleaned and saved to 'cleaned_menu.csv'")
