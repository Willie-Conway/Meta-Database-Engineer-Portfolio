# Classes amd Instances

class MyClass:
    
    # Create a variable
    a = 5
    # print("Hello") # print hello
    
    # function method
    def hello(self):
        print("Hello, world!")

# Create a variable
# myclass = MyClass() # myclass is represented as a 
                    # object an is instanited as the 
                    # variable

myc = MyClass() # Instance object
                    
# Print the variable
# print(MyClass.a)
print(myc.a)

# Call method
print(myc.hello())      
                    
# Hint:

# Classes mainly perform two kinds of operations, 
# attribute references and instantiation.

