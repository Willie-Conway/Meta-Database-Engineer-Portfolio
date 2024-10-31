# Writing import statements

# import math
from math import sqrt

# Square root method

# Extract to variable root
# root = math.sqrt(9)
root = sqrt(9)

# Print root
print(root)

# print("Importing the math module")


# Assign a alias
import math as m

# Hyperbolic cosine extract to sosine variable
cosine = m.cos(0)

# Print the cosine
print(cosine)



# Import factorial

# from math import factorial as f, log10, sqrt
from math import factorial as f
from math import *
# from math import some_variable

# Extract to factoral_10 variable
factorial_10 = f(10)

# Print factorial_10
print(factorial_10)

# Extract to x
x = log10(50)

# Print x
print(x)

