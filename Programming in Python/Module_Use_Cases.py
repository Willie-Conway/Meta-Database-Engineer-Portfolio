# This script provides an overview of modules, packages, libraries, and demonstrates 
# how to install and use a third-party package in Python.

# 1. Understanding Modules, Packages, and Libraries

# Modules: A module is a single file (with a .py extension) that can contain functions, 
# classes, and variables. It allows for code organization and reusability.

# Example of a simple module (saved as example_module.py):
def greet(name):
    return f"Hello, {name}!"

# Packages: A package is a collection of modules organized in a directory. 
# It must contain a special __init__.py file (which can be empty) to be recognized as a package.

# Example directory structure of a package:
# my_package/
# ├── __init__.py
# ├── module1.py
# └── module2.py

# Libraries: The term "library" typically refers to a collection of related packages.
# It’s often used interchangeably with "package" in casual conversation.

# 2. Installing Third-Party Packages with pip

# pip is a package manager for Python that allows you to install packages from the Python Package Index (PyPI).

# Ensure pip is installed (uncomment the appropriate command for your OS):
# For Mac:
# python3 -m ensurepip --upgrade

# For Windows:
# py -m ensurepip --upgrade

# Example of installing a package:
# To install the 'requests' library, which is used for making HTTP requests:
# For Mac:
# python3 -m pip install requests

# For Windows:
# py -m pip install requests

# 3. Using Installed Packages

# Once a package is installed, you can import and use it in your code.

import requests  # Import the requests package

# Making a simple GET request using the requests library
response = requests.get("https://api.github.com")
print(f"Status Code: {response.status_code}")  # Print the HTTP status code of the response
print(f"Response Body: {response.json()}")  # Print the JSON response from the GitHub API

# 4. Sub-packages

# Packages can contain sub-packages, which can be imported using dot notation.
# Example: Importing the pyplot sub-package from matplotlib for plotting.

import matplotlib.pyplot as plt  # Importing pyplot as plt

# Creating a simple plot
plt.plot([1, 2, 3], [4, 5, 6])
plt.title("Simple Plot")
plt.xlabel("X-axis")
plt.ylabel("Y-axis")
plt.show()  # Display the plot

# Summary: 
# - Modules are single files with Python code.
# - Packages are directories containing multiple modules.
# - Libraries are collections of related packages.
# - Use pip to install third-party packages and explore their documentation for usage examples.

# Note: Always check the documentation of the packages for detailed usage instructions and examples.
