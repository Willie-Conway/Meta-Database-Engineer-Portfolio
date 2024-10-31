# List Comprehension Examples
data = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31]

# Ex1: List comprehension - updating the same list by adding 3 to each element
data = [x + 3 for x in data]
print("Updating the list: ", data)

# Ex2: List comprehension - creating a different list with updated values (doubling each element)
new_data = [x * 2 for x in data]
print("Creating new list: ", new_data)

# Ex3: List comprehension with an if-condition - extracting multiples of four
four_x = [x for x in new_data if x % 4 == 0]
print("Divisible by four: ", four_x)

# Ex4: List comprehension with an if-condition - extracting multiples of four and subtracting 1
four_x_sub = [x - 1 for x in new_data if x % 4 == 0]
print("Divisible by four minus one: ", four_x_sub)

# Ex5: List comprehension using range - getting multiples of nine from 0 to 99
nines = [x for x in range(100) if x % 9 == 0]
print("Nines: ", nines)

# Dictionary Comprehension Examples
# Ex1: Creating a dictionary using range
using_range = {x: x * 2 for x in range(12)}
print("Using range(): ", using_range)

# Ex2: Creating a dictionary using one input list
months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
num_dict = {x: x ** 2 for x in number}
print("Using one input list to create dict: ", num_dict)

# Ex3: Creating a dictionary using two input lists with zip
months_dict = {key: value for (key, value) in zip(number, months)}
print("Using two lists: ", months_dict)

# Set Comprehension Example
# Ex: Creating a set of numbers in range 10 to 20, excluding certain values
set_a = {x for x in range(10, 20) if x not in [12, 14, 16]}
print("Set of values not in [12, 14, 16]: ", set_a)

# Generator Comprehension Example
# Ex: Creating a generator from the data list
gen_obj = (x for x in data)
print("Generator object created. Type: ", type(gen_obj))

# Iterating through the generator to print values
for item in gen_obj:
    print(item, end=" ")
print()  # For better output formatting

# Demonstrating map() function vs. List Comprehensions
def square(num):
    """Function to square a number."""
    return num * 2

# Using map() function to apply the square function
new_data_map = map(square, data)

# Using list comprehension to achieve the same result
new_data_list_comp = [square(x) for x in data]

# Printing results to compare
print("Using map(): ", list(new_data_map))  # Convert map object to list for printing
print("Using list comprehension: ", new_data_list_comp)
