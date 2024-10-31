# class_explore.py

# Class A definition
class A:
    def __init__(self, c):
        # Constructor for class A
        print("---------Inside class A----------")
        self.c = c  # Initialize instance variable c
        print("Print inside A.")  # This prints immediately upon class definition

    def alpha(self):
        # Method alpha that increments c by 1
        c = self.c + 1
        return c

# Display the attributes and methods of class A
print(dir(A))  # Lists all methods and attributes of class A

# Step 1: Instantiate class A
print("Instantiating A..")
a = A(1)  # Create an instance of A with c = 1

# Call method alpha on instance a
print(a.alpha())  # Outputs 2 (1 + 1)

# Class B definition
class B:
    def __init__(self, a):
        # Constructor for class B
        print("---------Inside class B----------")
        self.a = a  # Store reference to instance of class A
        print(a.alpha())  # Call method alpha on instance a
        d = 5  # Local variable d in B's constructor
        print(d)  # Prints value of d (5)
        print(a)  # Prints the object reference of instance a

# Step 2: Instantiate class B
print("Instantiating B..")
b = B(a)  # Create an instance of B, passing in instance a
print(a)  # Prints the object reference of instance a

# Step 3: Uncomment the following lines to observe behavior

# Uncomment lines 21 and 24 to see how NameError occurs
# print(a.alpha())  # Uncomment to see if 'a' is defined

# Step 4: Uncomment lines 14 and 21 to observe output
# print(a.alpha())  # Call method alpha on instance a

# Step 5: Uncomment lines 27 and 28 to see the variable modification
# a.c = a.alpha()  # This modifies the instance variable c in a

# Final Step: Uncomment all remaining comments to see complete output
# print(a)  # This will show the memory address of instance a

# Summary of expected output:
# - Instantiation of A should show "Inside class A" and its initialization.
# - The method alpha should return and print incremented value.
# - Instantiation of B should show "Inside class B", call to alpha, and value of d.
# - The final print of a should show the object's memory address.
