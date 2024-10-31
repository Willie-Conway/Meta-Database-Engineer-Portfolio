# Instaniate a custom Object

class Receipe():
    # def __new__(cls: type[Self]) -> Self:  # Hint:
    #    pass 
                                           # The CLS here is not a keyword, 
                                           # but rather a convention. It acts 
                                           # as a placeholder for passing the 
                                           # class as its first argument, which 
                                           # will be used for creating the new 
                                           # empty object. The second method is 
                                           # the init method, which is similar 
                                           # to what is known as a constructor 
                                           # in some other programming languages.
                                           
    # def __init__(self) -> None: # The init method takes the new object 
    #     pass                    # as its first argument. The self keyword 
                                # here is another convention. It has no 
                                # function itself but serves as a placeholder 
                                # for self-reference by the instance object.
    
    # Init method
    def __init__(self, dish, items, time) -> None:
        self.dish = dish
        self.items = items
        self.time = time
    
    # Contents method
    def contents(self):
        print("The " + self.dish + " has " + str(self.items) + \
            " and takes " + str(self.time) + " min to prepare ")
 
# Objects       
pizza = Receipe("Pizza", ["cheese", "bread","tomato"], 45) # Pizza Instance

pasta = Receipe("Pasta", ["penne", "sauce"], 55) # Pasta Instance


# Print statements
print(pizza.items)
print(pasta.items)

print(pizza.contents()) # Contents of the item