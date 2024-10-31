# Inheritance Examples in Python

# Single Inheritance
class A:
    # Parent class A
    pass

class B(A):
    # Child class B inheriting from class A
    pass

# Instantiating class B
b_instance = B()
# b_instance can access attributes and methods from class A

# -------------------------------------------

# Multiple Inheritance
class A:
    a = 1  # Attribute in class A

class B:
    b = 2  # Attribute in class B

class C(A, B):
    # Class C inherits from both A and B
    pass

# Creating an instance of class C
c = C()
# Accessing attributes from the parent classes
print("Multiple Inheritance:")
print("c.a:", c.a)  # Output: 1
print("c.b:", c.b)  # Output: 2

# -------------------------------------------

# Multi-Level Inheritance
class A:
    a = 1  # Attribute in class A

class B(A):
    a = 2  # Overriding attribute a in class B

class C(B):
    # Class C inherits from B, which in turn inherits from A
    pass

# Creating an instance of class C
c = C()
# Accessing the overridden attribute from class B
print("\nMulti-Level Inheritance:")
print("c.a:", c.a)  # Output: 2

# -------------------------------------------

# Using issubclass()
print("\nUsing issubclass():")
print("Is B a subclass of A?", issubclass(B, A))  # Output: True
print("Is A a subclass of B?", issubclass(A, B))  # Output: False

# -------------------------------------------

# Using isinstance()
class A:
    pass

class B(A):
    pass

# Creating an instance of class B
b_instance = B()

# Checking if b_instance is an instance of B and A
print("\nUsing isinstance():")
print("Is b_instance an instance of B?", isinstance(b_instance, B))  # Output: True
print("Is b_instance an instance of A?", isinstance(b_instance, A))  # Output: True

# -------------------------------------------

# Using super()
class Fruit:
    def __init__(self, fruit):
        # Constructor of parent class Fruit
        print('Fruit type:', fruit)

class FruitFlavour(Fruit):
    def __init__(self):
        # Calling the constructor of the parent class
        super().__init__('Apple')
        print('Apple is sweet')

# Creating an instance of FruitFlavour
apple = FruitFlavour()
# Output:
# Fruit type: Apple
# Apple is sweet

# -------------------------------------------

# Example without using super()
class Fruit:
    def __init__(self, fruit):
        print('Fruit type:', fruit)

class FruitFlavour(Fruit):
    def __init__(self):
        # Without super(), parent class constructor is not called
        print('Apple is sweet')

# Creating an instance of FruitFlavour
apple_without_super = FruitFlavour()  # Only outputs 'Apple is sweet'
# Output: 
# Apple is sweet
