# Step 1: Define the class MyFirstClass
class MyFirstClass:
    # Print statement to indicate class creation
    print("Who wrote this?")
    
    # Step 2: Define a string variable called index
    index = "Author-Book"  # Class variable holding the title

    # Step 3: Define the method hand_list
    def hand_list(self, philosopher, book):
        # Step 4: Access the class variable and print it
        print(MyFirstClass.index)  # Accessing the class variable directly using the class name
        
        # Print statement that combines philosopher and book
        print(philosopher + " wrote the book: " + book)  # Concatenating strings to form the output

# Step 5: Instantiate an object of MyFirstClass
whodunnit = MyFirstClass()  # Creating an instance of the class

# Call the method hand_list on the instance and pass arguments
whodunnit.hand_list("Sun Tzu", "The Art of War")  # Passing values to the method
