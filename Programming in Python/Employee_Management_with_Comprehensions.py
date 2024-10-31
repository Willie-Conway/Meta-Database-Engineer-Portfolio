# Input data: List of dictionaries containing employee information
employee_list = [
    {"id": 12345, "name": "John", "department": "Kitchen"},
    {"id": 12456, "name": "Paul", "department": "House Floor"},
    {"id": 12478, "name": "Sarah", "department": "Management"},
    {"id": 12434, "name": "Lisa", "department": "Cold Storage"},
    {"id": 12483, "name": "Ryan", "department": "Inventory Mgmt"},
    {"id": 12419, "name": "Gill", "department": "Cashier"}
]

# Function to modify employee data into a formatted string
def mod(employee):
    """ Combines employee name and department into a single string. """
    temp = employee['name'] + "_" + employee["department"]
    return temp

def to_mod_list(employee_list):
    """ Modifies the employee list of dictionaries into a list of employee-department strings.

    Uses the map() method to apply mod() to all elements in employee_list.

    Args:
        employee_list: list of employee objects

    Returns:
        list - A list of strings consisting of name + department.
    """
    # Applying the mod function to each employee dictionary and converting the result to a list
    map_emp = list(map(mod, employee_list))
    return map_emp

def generate_usernames(mod_list):
    """ Generates a list of usernames by replacing spaces with underscores.

    Uses list comprehension and the replace() function to achieve this.

    Args:
        mod_list: list of employee-department strings

    Returns:
        list - A list of usernames consisting of name + department delimited by underscores.
    """
    # Using list comprehension to replace spaces with underscores
    usernames = [name.replace(" ", "_") for name in mod_list]
    return usernames

def map_id_to_initial(employee_list):
    """ Maps employee id to the first initial of their name.

    Uses dictionary comprehension to create a mapping from employee's id to first letter of their name.

    Args:
        employee_list: list of employee objects

    Returns:
        dict - A dictionary mapping an employee's id (value) to their first initial (key).
    """
    # Creating a dictionary that maps first initials to employee IDs
    id_to_initial = {employee['name'][0]: employee['id'] for employee in employee_list}
    return id_to_initial

def main():
    # Modifying the employee list to create a list of formatted strings
    mod_emp_list = to_mod_list(employee_list)
    print("Modified employee list: " + str(mod_emp_list) + "\n")

    # Generating usernames from the modified list
    usernames = generate_usernames(mod_emp_list)
    print(f"List of usernames: {usernames}\n")

    # Mapping employee initials to their IDs
    initials_ids = map_id_to_initial(employee_list)
    print(f"Initials and ids: {initials_ids}")

# Entry point of the script
if __name__ == "__main__":
    main()
