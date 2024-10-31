# List of favorite desserts
favorites = ['Creme Brulee', 'Apple Pie', 'Churros', 'Tiramisú', 'Chocolate Cake']

# Specify the dessert to search for
search_dessert = 'Pudding'  # Change this to test with different desserts

# Initialize a flag to track if the dessert is found
found = False

# Iterate through each dessert in the favorites list
for dessert in favorites:
    # Check if the current dessert matches the search term
    if dessert == search_dessert:
        print('Yes! One of my favorite desserts is', dessert)
        found = True  # Set found to True since we found the dessert
        break  # Exit the loop since we found the dessert

# Check if the dessert was not found after the loop
if not found:
    print('No sorry, that dessert is not on my list')

# Now let's demonstrate the 'continue' statement
print("\nOther desserts excluding 'Churros':")
for dessert in favorites:
    # Skip the dessert 'Churros'
    if dessert == 'Churros':
        continue  # Skip this iteration
    # Print other desserts
    print('Other desserts I like are', dessert)

# Demonstrating the 'pass' statement
print("\nListing all desserts with 'pass' on 'Churros':")
for dessert in favorites:
    # If the dessert is 'Churros', do nothing and pass
    if dessert == 'Churros':
        pass  # Effectively does nothing, allows the loop to continue
    # Print every dessert
    print('Other desserts I like are', dessert)
