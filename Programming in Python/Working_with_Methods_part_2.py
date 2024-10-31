# Exercise 1
class A:
    def b(self):
        return "Function inside A"

class B:
    pass  # Class B does not define any methods

class C:
    def b(self):
        return "Function inside C"  # Class C defines its own b() method

class D(B, C, A):  # Class D inherits from B, C, and A in that order
    pass

# Driver code for Exercise 1
d = D()
print(d.b())  # Calls b() from class C because C is the first class in the MRO that has the method

# Expected Output: "Function inside C"


# Exercise 2
class A:
    def c(self):
        return "Function inside A"

class B(A):
    def c(self):
        return "Function inside B"  # Overrides c() from A

class C(B):  # Class C inherits from B
    pass

# Driver code for Exercise 2
class D(C):  # Class D inherits from C
    pass

d = D()
print(d.c())  # Calls c() from class B due to the MRO
# Expected Output: "Function inside B"


# Exercise 3
class A:
    pass  # Class A does not define any methods

class B(A):
    pass  # Class B inherits from A but does not define any methods

class C(B):
    pass  # Class C inherits from B

# Driver code for Exercise 3
c = C()
try:
    print(c.a())  # Trying to call a() will raise an error since there is no method a() in the hierarchy
except AttributeError as e:
    print(e)  # Catch the error and print it

# Expected Output: "AttributeError: 'C' object has no attribute 'a'"
