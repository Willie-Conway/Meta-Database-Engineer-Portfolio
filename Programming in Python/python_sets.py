# Sets

# set_a = {1, 2, 3, 4, 5, 5} 

set_a = {1, 2, 3, 4, 5 } 
set_b = {4, 5, 6, 7, 8}

# Hint: 

# The second 5 will not
# be printed out in the 
# list.

# # Add method
# set_a.add(6)

# # Remove method
# set_a.remove(2)

# # Discard method
# set_a.discard(3)

# Union method                 # Merges the sets together
print(set_a.union(set_b))      # {1, 2, 3, 4, 5, 6, 7, 8}

# | method                     # Merges the sets together
print(set_a | set_b)           # {1, 2, 3, 4, 5, 6, 7, 8}

# Intersection method             # Intersecting Match elements
print(set_a.intersection(set_b))  # {4, 5}

# & method                        # Match elements
print(set_a & set_b)              # {4, 5}

# Difference method               # Determines the difference elements
print(set_a.difference(set_b))    # {1, 2, 3}

# - method                        # Determines the difference elements             
print(set_a - set_b)              # {1, 2, 3}


# Symmetric method                        # Determines the symmetric difference elements
print(set_a.symmetric_difference(set_b))  # {1, 2, 3, 6, 7, 8}

#  ^ method                                # Determines the symmetric difference elements                 
print(set_a ^ set_b)                       # {1, 2, 3, 6, 7, 8}



# Hint:

# The most importnat thing about sets
# is that a set is a colection without
# no duplicate. but it's also a collection
# of unordered items. Unlike a list where 
# you can print out contect based on index.


# Error
print(set_a[0])  # TypeError: 'set' object is not subscriptable

# this means that the set is not
# a sequence. it doesn't contain a 
# ordered index of all elements inside


# prints set
# print(set_a)