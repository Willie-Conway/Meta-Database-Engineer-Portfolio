# Tuples

my_tuple = (1, 'strings', 4.5, True)
     #Index: 0     1       2     3

# Get access
print(my_tuple[1])

# Get type
print(type(my_tuple))         # <class 'tuple'>
print(type(my_tuple[0]))      # <class 'int'>
print(type(my_tuple[1]))      # <class 'str'>
print(type(my_tuple[2]))      # <class 'float
print(type(my_tuple[3]))      # <class 'bool'>

# Count function
print(my_tuple.count('strings'))

# Index function
print(my_tuple.index(4.5))

# for loop function
for x in my_tuple:
    print(x)
    
    
# Hint: 
# tuples are immutable, 
# they can not be changed.

# Ex:

#Immutable function
my_tuple[0] = 5

# TypeError: 'tuple' object does not support item assignment
