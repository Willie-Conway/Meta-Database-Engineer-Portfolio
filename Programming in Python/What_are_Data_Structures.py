# Introduction to Data Structures in Python

# Data structures allow us to organize and manage data efficiently.
# In this script, we will explore the built-in data structures in Python.

# 1. List
# A list is a mutable data structure that can hold an ordered collection of items.
my_list = [1, 2, 3, 4, 5]  # Creating a list of integers
print("List:", my_list)

# Modifying the list: Lists are mutable, so we can change, add, or remove items.
my_list.append(6)  # Adding an item
print("List after appending 6:", my_list)

my_list[0] = 0  # Changing the first element
print("List after changing first element to 0:", my_list)

my_list.remove(3)  # Removing an item
print("List after removing 3:", my_list)

# 2. Dictionary
# A dictionary is a mutable data structure that holds key-value pairs.
my_dict = {
    'name': 'Alice',
    'age': 30,
    'city': 'New York'
}
print("\nDictionary:", my_dict)

# Modifying the dictionary: You can change values, add new key-value pairs, or remove them.
my_dict['age'] = 31  # Updating a value
print("Dictionary after updating age:", my_dict)

my_dict['job'] = 'Engineer'  # Adding a new key-value pair
print("Dictionary after adding job:", my_dict)

del my_dict['city']  # Removing a key-value pair
print("Dictionary after removing city:", my_dict)

# 3. Tuple
# A tuple is an immutable data structure that can hold an ordered collection of items.
my_tuple = (1, 2, 3)  # Creating a tuple
print("\nTuple:", my_tuple)

# Attempting to modify a tuple will raise an error.
# Uncommenting the following line will cause a TypeError.
# my_tuple[0] = 0  # TypeError: 'tuple' object does not support item assignment

# 4. Set
# A set is a mutable data structure that holds an unordered collection of unique items.
my_set = {1, 2, 3, 4, 5}  # Creating a set
print("\nSet:", my_set)

# Adding and removing items in a set
my_set.add(6)  # Adding an item
print("Set after adding 6:", my_set)

my_set.discard(3)  # Removing an item (does not raise an error if item not found)
print("Set after discarding 3:", my_set)

# Demonstrating mutability and immutability
print("\nMutability and Immutability:")
print("List is mutable:", my_list)  # Can be modified
print("Tuple is immutable:", my_tuple)  # Cannot be modified

# Conclusion
# In Python, choosing the appropriate data structure is important for organizing data effectively.
# Mutable structures (like lists and dictionaries) allow for changes, while immutable structures (like tuples) do not.

# Feel free to experiment with these data structures and their properties!
