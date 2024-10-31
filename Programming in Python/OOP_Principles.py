# Importing the ABC module for abstraction
from abc import ABC, abstractmethod

# --------------------------
# Encapsulation Example
# --------------------------
class Department:
    def __init__(self, name, budget):
        self._name = name      # Protected member (accessible within the class and subclasses)
        self.__budget = budget  # Private member (accessible only within this class)

    # Public method to access private member
    def get_budget(self):
        return self.__budget

    # Public method to set budget
    def set_budget(self, new_budget):
        self.__budget = new_budget

# Example of creating a Department object
inventory = Department("Inventory", 10000)
print(f"Department: {inventory._name}, Budget: {inventory.get_budget()}")  # Accessing protected member through a public method

# Attempting to access private member directly (will raise an error)
# print(inventory.__budget)  # Uncommenting this line will cause an AttributeError

# --------------------------
# Polymorphism Example
# --------------------------
def print_length(item):
    """ This function demonstrates polymorphism by accepting different types of items. """
    print(f"The length of the item is: {len(item)}")

# Different types of items
string = "Hello"
list_example = [1, 2, 3, 4, 5]

# Demonstrating polymorphism
print_length(string)       # Outputs: The length of the item is: 5
print_length(list_example) # Outputs: The length of the item is: 5

# --------------------------
# Inheritance Example
# --------------------------
class Animal:
    """ Base class for animals. """
    def speak(self):
        return "Some sound"

class Dog(Animal):
    """ Derived class for dogs, inheriting from Animal. """
    def speak(self):
        return "Woof!"

class Cat(Animal):
    """ Derived class for cats, inheriting from Animal. """
    def speak(self):
        return "Meow!"

# Creating instances of Dog and Cat
dog = Dog()
cat = Cat()

# Demonstrating inheritance and method overriding
print(dog.speak())  # Outputs: Woof!
print(cat.speak())  # Outputs: Meow!

# --------------------------
# Abstraction Example
# --------------------------
class Shape(ABC):
    """ Abstract class for shapes. """
    
    @abstractmethod
    def area(self):
        """ Abstract method to compute area. """
        pass

class Rectangle(Shape):
    """ Concrete class for rectangle, inheriting from Shape. """
    
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        """ Implementation of the abstract method. """
        return self.width * self.height

# Creating an instance of Rectangle
rectangle = Rectangle(10, 5)
print(f"Area of rectangle: {rectangle.area()}")  # Outputs: Area of rectangle: 50

# Trying to instantiate an abstract class will raise an error
# shape = Shape()  # Uncommenting this line will cause a TypeError
