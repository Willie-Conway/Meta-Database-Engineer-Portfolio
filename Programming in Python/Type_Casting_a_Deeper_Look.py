# Type Casting: A Deeper Look

# Type casting, also known as data type conversion, is the process of changing a value's data type.

# Implicit Type Conversion
# Example of comparing an integer and a float
print(10 == 10)       # Output: True, both are integers and equal
print(10 == 10.00)    # Output: True, Python implicitly converts 10 to a float for the comparison

# When performing operations with different data types,
# Python automatically converts the integer to a float
print(10 + 10.0)      # Output: 20.0, result is a float due to implicit conversion

# To verify the type of the result
print(type(10 + 10.0))  # Output: <class 'float'>, confirms the result is a float

# User Input and Type Conversion
# Prompting the user for input
user_num_1 = input('First number is: ')  # Input is taken as a string
user_num_2 = input('Second number is: ')  # Input is also taken as a string

# Attempting to sum the inputs directly (this will cause concatenation instead of addition)
user_sum = user_num_1 + user_num_2  # This results in string concatenation
print(user_sum)  # Example: If both inputs are '5', output will be '55'

# Explanation of why the above does not work as intended
# Both inputs are strings, so '5' + '5' = '55'
# We need to explicitly convert the inputs to numbers for correct addition

# Explicit Type Conversion
# Converting user inputs from strings to floats for correct numerical addition
user_num_1 = input('First number is: ')
user_num_2 = input('Second number is: ')
user_sum = float(user_num_1) + float(user_num_2)  # Convert inputs to float
print(user_sum)  # Output will be the correct sum (e.g., 10.0 if both inputs are 5)

# Adding output messages for clarity
num_1 = input('First number is: ')
num_2 = input('Second number is: ')
user_sum = float(num_1) + float(num_2)  # Ensure the inputs are floats

# Attempt to print the result with a message
# This will throw a TypeError because user_sum is a float and needs to be converted to a string for concatenation
# print("The sum of: " + num_1 + " and " + num_2 + " is " + user_sum)  # This line is commented out to avoid errors

# Correcting the above to prevent TypeError by converting all parts to string
print("The sum of " + str(num_1) + " and " + str(num_2) + " is " + str(user_sum))  # Converts to string
# Example output: If both inputs are 5.5, it will print: The sum of 5.5 and 5.5 is 11.0

# Summary
# In Python, it's easy to perform explicit conversions using str(), int(), or float() functions.
# Understanding type casting is essential for effective data manipulation.
