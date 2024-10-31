#         Math operators

# Operator    Meaning        Example 
# --------    -------        ------- 
#    +        Addition        2 + 3  
#    -        Subtraction     3 - 2  
#    /        Division        35 / 5 
#    *        Multiplication  7 * 4  

# Ex:

# Addition
print(2+2)

# Subtraction
print(2-2)

# Division
print(8/2)

# Multiplication
print(35 * 5)


#                    Logical operators

# Operator                Meaning                         Example   
# --------                -------                         -------   
#    and        Checks for both condition              a>5 and a<10 
#                           true                                 
#    or         Checks for at least one condition      a>5 or b>10  
#                         to be true
#    not        Returns false if the result is true      not(a>5)


# Ex:

# and
a = True    
b = True
c = False

if a and b:
    print("All true!")
    
if a and c:
    print("False")  # Nothing print because both conditions are not true
    
# or
a = False   
b = True
c = False

if a or b:
    print("All true!")

if a or c:
    print("False")  # Nothing print because both conditions have not been met
    
# not
a = False  
b = False
c = True

if not(a) or not(b):
    print("All true!")

if not(a) or not(c):
    print("False")  # None of the conditions have been met


    

  


