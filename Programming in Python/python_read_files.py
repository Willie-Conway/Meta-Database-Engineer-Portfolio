# Reading files

with open('sample.txt', 'r') as file: # (r) is fror reading files
    # print(file.read()) # prints read text from sample.txt
    
# Read the first 44 characters
    # print(file.read(44))
    
# Read a line
    # print(file.readline())
    
# Read lines
    # print(file.readlines())
    
# Extract to variable then print for loop
    #  data = file.readlines()

    #  for x in data:
    #      print(x)
        
    for x in file:
        print(x)