# Dictionary

my_d = {1: 'Test', 'Name': 'Jim'} # Key

# my_d = {1: 'Test', 'Name': 'Jim', 1: 'Not a test'} # Key

# Type function
print(type(my_d))

# Pass in value
print(my_d[1])

# Pass in String
print(my_d['Name'])

# Add to key
my_d[2] = 'Test 2'
print(my_d)

# Update a key
my_d[1] = 'Not a test!'
print(my_d)

# Hint:

# Duplicate keys are not 
# allowed with dictionaries.

# Delete a key
del my_d[1]
print(my_d)

# Iterate a key
for x in my_d:
  print(x)
  
#  Items method
for key, value in my_d.items():
    print(str(key) + " : " + value)
    
    
# Choosing and using data structures

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
    return employee_dict[id];


print(get_employee_from_dict(12458));

# Output:

# {'id': '12458', 'name': 'Paul', 'department': 'House Floor'}