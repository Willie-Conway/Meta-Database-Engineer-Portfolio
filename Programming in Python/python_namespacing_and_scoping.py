# Namespacing and scoping

def d():
    # Local variable
    animal = "elephant"
    def e():
        # Non-local keyword to declare animal value 
        nonlocal animal
        animal = "giraffe"
        print("inside nested function: " + animal)
        
    print("before calling function: " + animal)
    
    # Call function
    e()
    
    print("After nested function " + animal)

# Global variable        
animal = "camel"
    
# Call function
d()

print("Global animal: " + animal)