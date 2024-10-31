# File handling

file = open('test.txt', mode='r') # (r) indicates to read the file



data = file.readline() # readline function returns 
                       # the first line of the file 
                       # as readlines returns multiple.                    
print(data)            # prints the data of the file

file.close() # close function


# With open function

with open('test.txt', mode='r') as  file: # (r) indicates to read the file
    data = file.readline()
    
    print(data)