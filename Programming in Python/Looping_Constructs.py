# Looping Constructs: Practical Examples

# For Loop Example
# This example uses a for loop to iterate over a list of favorite desserts
favorites = ['Creme Brulee', 'Apple Pie', 'Churros', 'Tiramisú', 'Chocolate Cake']

# Using a for loop to print each dessert
for dessert in favorites:
    print('One of my favorite desserts is', dessert)

# Explanation:
# The for loop iterates over each element in the 'favorites' list.
# 'dessert' takes on the value of each item in the list, one at a time,
# and the print statement outputs a sentence for each dessert.

# While Loop Example
# The while loop continues to execute as long as a specified condition is true.
# Here we will use a while loop to achieve the same result as the for loop above.

count = 0  # Initialize a counter variable

# Using a while loop to print each dessert
while count < len(favorites):
    print('One of my favorite desserts is', favorites[count])
    count += 1  # Increment the counter

# Explanation:
# The while loop checks if 'count' is less than the length of the 'favorites' list.
# If true, it executes the print statement.
# After printing, it increments 'count' by 1.
# Once 'count' equals the length of the list, the condition becomes false, and the loop stops.

# Summary of Loops:
# - A for loop is generally used when the number of iterations is known (like iterating over a list).
# - A while loop is used when the number of iterations is not known ahead of time and is based on a condition.

# Additional Note:
# Both loops achieve the same outcome here but do so using different approaches.
