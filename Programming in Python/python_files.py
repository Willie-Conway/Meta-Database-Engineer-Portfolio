# Creating files

with open('newfile.txt', mode='w') as file:  # creates and writes to a file
        file.write("This is a new file created!\n") # writes text to file
        
# Writelines function
        file.writelines(["This is a new file created!2\n", 
                         "This is another line to be added."])    # writes multiple lines to files 
                                                                  # using list brackets []
                                                                  # Add a newline character \n at the end 
                                                                  # of the string to move to the next line.
# Append function
with open('newfile.txt', mode='a') as file:  # creates and appends to a file
        file.write("\nThis is a another file created!2\n") # writes text to file  
        
# Try and except statements
try:
    with open('sample/newfile.txt', 'a') as file:  # appends file to new directory sample
        file.writelines("\nThis is a new file created!2", "\nThis is another line to be added.") 
except FileNotFoundError as e:  # Throws excepion error
    print("ERROR", e) 
