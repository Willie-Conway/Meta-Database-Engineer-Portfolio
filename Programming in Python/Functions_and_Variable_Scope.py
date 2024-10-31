# 1. Local Scope
def get_total(a, b):
    # Local variable declared inside a function
    total = a + b  # This variable is only accessible within this function
    return total

# Call the function and print the result
print("Local Scope:")
result = get_total(5, 2)  # Outputs: 7
print("Total from get_total(5, 2):", result)

# Trying to access the 'total' variable outside the function
print("\nTrying to access 'total' outside the function:")
try:
    print(total)  # This will raise NameError since 'total' is not defined outside
except NameError as e:
    print("Error:", e)  # Catch and print the error


# 2. Enclosing Scope
def get_total_with_enclosure(a, b):
    # Enclosed variable declared inside this function
    total = a + b

    def double_it():
        # Local variable within the nested function
        double = total * 2  # Accessing 'total' from the enclosing scope
        print("Double of total:", double)

    double_it()  # Call the nested function

print("\nEnclosing Scope:")
get_total_with_enclosure(5, 2)  # Outputs: Double of total: 14

# Trying to access 'double' outside its function
print("\nTrying to access 'double' outside its function:")
try:
    print(double)  # This will raise NameError since 'double' is not defined outside
except NameError as e:
    print("Error:", e)  # Catch and print the error


# 3. Global Scope
# Global variable declared outside any function
special = 5

def get_total_with_global(a, b):
    # Enclosed variable declared inside this function
    total = a + b
    print("Global scope access in get_total:", special)  # Accessing the global variable

    def double_it():
        # Local variable in nested function
        double = total * 2
        print("Global scope access in double_it:", special)  # Accessing the global variable

    double_it()  # Call the nested function
    return total

print("\nGlobal Scope:")
print("Total from get_total_with_global:", get_total_with_global(5, 2))  # Outputs the total


# 4. Built-in Scope
# Demonstrating built-in scope by using a built-in function
print("\nBuilt-in Scope:")
print("Using the built-in print function to demonstrate built-in scope.")

# Built-in functions can be accessed at any level, like `len()`, `type()`, etc.
sample_list = [1, 2, 3, 4, 5]
print("Length of sample_list:", len(sample_list))  # Outputs: 5
