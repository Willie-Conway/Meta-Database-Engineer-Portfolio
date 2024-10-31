# Instantiate a custom Object

# This is your first experience creating classes 
# and objects in Python. You will be following a 
# sequential process where you will create a class, 
# define its state by creating variables and functions 
# to define its attributes and behavior, and then instantiate 
# it using some variable. Finally, you will use the class members 
# to get the desired output.

# Follow the steps to build and run 
# your program in the environment provided 
# at the bottom of the reading.


# Step 1

# 1.1 Define a class called MyFirstClass.

# 1.2 Add a print statement inside it such as “Who wrote this?”.

# Step 2

# Create a string variable named index and initialize it with a string “Author-Book”.

# Step 3

# 3.1 Define a function called hand_list() with the help of def keyword. 

# 3.2 Pass the parameter  self to it. And then pass two parameters, philosopher and book to it.

# Step 4
    
# 4.1 Write a print statement using the print() function and pass the class variable by accessing it. 

# Hint: Class variables are accessed directly by calling it over the class name using dot notation.

# 4.2 Write a print statement that will give output such as: “Plato wrote the book: Republic” where “Plato” is the philosopher and “Republic” is the book. 

# Hint: You can make use of the built-in (+) concatenation operator to join these strings. 

# Step 5

# 5.1 Create and instantiate an object of that class, called whodunnit

# 5.2 Call method hand_list() over this object “whodunnit” and pass two values to it namely “Sun Tzu” and “The Art of War”.


# Define class MyFirstClass

    # Define string variable called index
    
    # Define function hand_list()
    
        # variable + “ wrote the book: ” + variable
        
        
# Use the following code block to build your program:

# Call function handlist()


# Solution code 

# Sample Solution code
class MyFirstClass():
    print("Who wrote this?")
    index = "Author-Book"

    def hand_list(self, philosopher, book):
        print(MyFirstClass.index)
        print(philosopher + " wrote the book: " + book)

whodunnit = MyFirstClass()
whodunnit.hand_list("Sun Tzu", "The Art of War")