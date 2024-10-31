# Maps and filters

# Menu
menu = ["espresso", "mocha", "latte", "cappuccino", "cortado","americano"]

def find_coffee(coffee):
    if coffee[0] == 'c':
        return coffee
    
# # Map function  
# map_coffee = map(find_coffee, menu)

# print(map_coffee) # print out map

# # Iterate map
# for x in map_coffee:
#     print(x)

# Filter function
filter_coffee = filter(find_coffee, menu)
print(filter_coffee)

# For loop
for x in filter_coffee:
    print(x)
    
    
# Hint:

# A map takes all objects in the 
# list and allows you to apply a 
# function to it. A filter also 
# allows you to take in all objects 
# in the list and runs through a function 
# but it creates a new list and only returns 
# values where the evaluated function returns 
# true. 


