# Basic Data Type and Function Cheatsheet

# Data Types
# Data type meaning and examples

# String: Text data
string_example1 = 'Hello'  # A simple greeting
string_example2 = 'Testing 123'  # A string with numbers

# Integer: Whole numbers
integer_example1 = -5  # Negative integer
integer_example2 = 4   # Positive integer
integer_example3 = 0   # Zero

# Float: Decimal numbers
float_example1 = 2.4   # Positive float
float_example2 = 5.2   # Another positive float
float_example3 = 1000.00  # Float with two decimal places

# Flow Control
# Comparison operators

# Equals
a = 5
b = 5
equal_check = (a == b)  # True if a equals b

# Not Equal
not_equal_check = (a != b)  # True if a is not equal to b

# Less than
less_than_check = (a < 10)  # True if a is less than 10

# Greater than
greater_than_check = (a > 3)  # True if a is greater than 3

# Less than or Equal to
less_equal_check = (a <= 5)  # True if a is less than or equal to 5

# Greater than or Equal to
greater_equal_check = (a >= 4)  # True if a is greater than or equal to 4

# Comments
# Single-line comments
# This is a single-line comment, Python ignores this

# Multi-line comments
# Python does not have a built-in multi-line comment method
# Use # on each line for multi-line comments
# This is a multiline comment
# which can be used for long comments

# Inline comments
x = 1  # assigns value of 1 to x

# Built-in Functions
# print() - Displays the output
print("Hello")  # Output: Hello

# input() - Captures user input
location = input("Where do you live? ")  # Prompting for input
print("So you live in " + location)  # Displaying user input

# len() - Returns the length of a string
length_of_string = len("Hello")  # Returns 5
print(length_of_string)  # Output: 5

# str() - Converts a value to string
string_conversion = str(55)  # Converts integer 55 to string '55'
print(string_conversion)  # Output: '55'

# int() - Converts a value to integer
integer_conversion = int('75')  # Converts string '75' to integer 75
print(integer_conversion)  # Output: 75

# float() - Converts a value to float
some_int = 10
float_conversion = float(some_int)  # Converts integer 10 to float 10.0
print(float_conversion)  # Output: 10.0

# Creating Functions
# Define a function using the 'def' keyword

# Simple function without parameters
def say_hello():
    return "Hello there!"  # Returns a greeting

# Function with parameters
def say_hello_to(you):
    return "Hello " + you  # Returns a personalized greeting

# Calling the functions
print(say_hello())  # Output: Hello there!
print(say_hello_to("Alice"))  # Output: Hello Alice
