import os

# Prompt the user for the CSV file name
file_name = input('Type the file name (with .csv extension): ')

# Specify the full path to the CSV file
file_path = os.path.join(r'C:\Users\hirew\OneDrive\Desktop\Meta Data Engineer\Programming in Python\Data', file_name)

# Print the current working directory for reference
print("Current Working Directory:", os.getcwd())

try:
    # Open the CSV file in read mode
    with open(file_path, "r") as f:
        # Read the content of the file
        f_content = f.read()
        # Split content into a list by lines
        f_content_list = f_content.splitlines()
        
        # Print all lines from the CSV file
        print("Sales Data Entries:")
        for line in f_content_list:
            print(line)

except FileNotFoundError:
    print("The file could not be found. Please check the file name and path.")
