# Choosing and Using Data Structures

# This script demonstrates how to choose appropriate data structures for different tasks,
# specifically using a list versus a dictionary for employee management.

# Example: Employees list as a list of tuples
employee_list = [
    (12345, "John", "Kitchen"),
    (12458, "Paul", "House Floor")
]

def get_employee(id):
    """
    Retrieves an employee from the employee_list by ID.
    This function uses a linear search to find the employee.
    
    Args:
    id (int): The employee ID to search for.

    Returns:
    dict: A dictionary containing the employee's details if found, None otherwise.
    """
    for employee in employee_list:
        if employee[0] == id:  # Check if the first element (ID) matches
            return {"id": employee[0], "name": employee[1], "department": employee[2]}
    return None  # Return None if employee not found

# Testing the function with an existing employee ID
print("Using list:")
print(get_employee(12458))  # Output: {'id': 12458, 'name': 'Paul', 'department': 'House Floor'}

# Now let's consider a larger dataset
# Imagine we have 20,000 employees. The above method would require iterating through the entire list
# to find a match, which can be slow.

# Example: Employees list using a dictionary for faster lookups
employee_dict = {
    12345: {
        "id": "12345",
        "name": "John",
        "department": "Kitchen"
    },
    12458: {
        "id": "12458",
        "name": "Paul",
        "department": "House Floor"
    }
}

def get_employee_from_dict(id):
    """
    Retrieves an employee from the employee_dict by ID.
    This function uses a direct lookup for faster access.
    
    Args:
    id (int): The employee ID to search for.

    Returns:
    dict: A dictionary containing the employee's details if found, None otherwise.
    """
    return employee_dict.get(id, None)  # Using .get() to avoid KeyError if ID doesn't exist

# Testing the function with an existing employee ID
print("\nUsing dictionary:")
print(get_employee_from_dict(12458))  # Output: {'id': '12458', 'name': 'Paul', 'department': 'House Floor'}

# Explanation of Performance
print("\nPerformance Considerations:")
print("Using a list for searching employee data involves a linear search,")
print("which means the time complexity is O(n) where n is the number of employees.")
print("As the employee list grows larger, this approach becomes slower.")

print("\nIn contrast, using a dictionary allows for constant time complexity O(1) for lookups.")
print("This means that regardless of the size of the dataset, the lookup time remains consistent.")

# Conclusion
print("\nConclusion:")
print("Choosing the right data structure is crucial depending on the scale and nature of the operations.")
print("Lists work well for small datasets but can become inefficient with larger datasets.")
print("Dictionaries provide faster access for larger datasets, making them preferable for tasks requiring frequent lookups.")
