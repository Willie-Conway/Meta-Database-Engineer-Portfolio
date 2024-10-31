# Exception Handling in Python

# 1. Handling IndexError
# The following code attempts to access an index in a list that may not exist.

# Starter code
items = [1, 2, 3, 4, 5]

try:
    # Attempting to access the 7th item (index 6) in the list
    item = items[6]
    print(item)
except IndexError:
    # Catching the IndexError and providing a user-friendly message
    print("Item does not exist in the list.")

# 2. Handling ZeroDivisionError
# The following code attempts to divide a number by zero, which is mathematically invalid.

def divide_by(a, b):
    """Divides two numbers, a and b."""
    return a / b

try:
    # Attempting to divide by zero
    ans = divide_by(40, 0)
    print(ans)
except ZeroDivisionError:
    # Catching the ZeroDivisionError and returning 0 instead
    print("Division by zero encountered. Returning 0.")
    ans = 0

# Printing the result after handling the exception
print("Result of division:", ans)

# 3. Handling FileNotFoundError
# The following code attempts to open a file that may not exist.

try:
    # Trying to open a non-existent file
    with open('file_does_not_exist.txt', 'r') as file:
        print(file.read())
except FileNotFoundError:
    # Catching the FileNotFoundError and providing a user-friendly message
    print("The file could not be found.")

# Conclusion
print("\nException handling allows for more robust code that can gracefully handle errors.")
print("By using try-except blocks, we can provide useful feedback to the user instead of crashing the program.")
