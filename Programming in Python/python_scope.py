# Variable scopes

#global scope
my_global = 10

def fn1():
    
    # enclose variable
    enclosed_v = 8
    
    
    def fn2():
    # enclose variable
        local_v = 5
        print('Access to Global', my_global)
        print('Access to enclosed', enclosed_v)
    
 # function call   
    fn2()
    
# function call   
fn1()

# Error

# print('Cant access local', local_v)

# print(enclosed_v)
# print(local_v)

# Functions and variables

# Local scope

# def get_total(a, b):
#     #local variable declared inside a function
#     total = a + b;
#     return total

# print(get_total(5, 2))
# 7

# # Accessing variable outside of the function:
# print(total)
# NameError: name 'total' is not defined


# Enclosing scope

# def get_total(a, b):
#     #enclosed variable declared inside a function
#     total = a + b

#     def double_it():
#         #local variable
#         double = total * 2
#         print(double)

#     double_it()
#     #double variable will not be accessible
#     print(double)

#     return total

# Global scope


# special = 5

# def get_total(a, b):
#     #enclosed scope variable declared inside a function
#     total = a + b
#     print(special)

#     def double_it():
#         #local variable
#         double = total * 2
#         print(special)

#     double_it()

#     return total
