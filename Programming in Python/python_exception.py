# Exception

def divide_by(a, b):
    return a / b

print(divide_by(40, 4))


# Hint:

# In math you can't dive 
# a number by zero


# Try and except statement

try:
    ans = divide_by(40, 0)
    
# except Exception as e: # (e) acts as variable for the exception\
except ZeroDivisionError as e: # (e) acts as variable for the exception
    
    # Error statement
    # print("Something went wrong!", e) # (e) clarifies the exception type
    
    print(e, "we cannot divide by zero")
    
# Another except statement to test for more exceptions
except Exception as e:
    
    print(e, "something went wrong")
   
    
    # print(divide_by(40, 0))  # ZeroDivisionError: division by zero
    
    print(e.__class__) # Prints the class of the exception that's caught
    
    
    




