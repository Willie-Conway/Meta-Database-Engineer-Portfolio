# Pure functions

my_list = [1, 2, 3] # original list

def add_to_list(lst, item): # The function is still using the list as a argument
    
    # Create a new list copy
    nl = lst.copy()
    
    # Append function 
    # my_list.append(item)
    # lst.append(item)
    nl.append(item)
    # return my_list # Return list
    # return lst # Return list
    return nl # Return list to pure function


new_list = add_to_list(my_list, 4) # new list

# Prints lists
print(my_list)
print(new_list)


