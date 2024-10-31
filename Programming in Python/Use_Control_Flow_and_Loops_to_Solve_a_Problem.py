# List of integers to be processed
num_list = [33, 42, 5, 66, 77, 22, 16, 79, 36, 62, 78, 43, 88, 39, 53, 67, 89, 11]

# Step 1: Iterate through the list and print each value
for number in num_list:
    print(number)  # Print each number in the list

# Step 2 & 3: Check for numbers greater than 45 and print appropriate messages
for number in num_list:
    if number > 45:
        print("Over 45")  # Print if the number is greater than 45
    else:
        print("Under 45")  # Print if the number is 45 or less

# Step 4: Use enumerate to get both index and value, and check for number 36
for index, number in enumerate(num_list):
    if number == 36:
        print('Number found at position:', index)  # Print the position of number 36

# Step 5: Initialize a counter variable to count the iterations
count = 0  # Initialize count to zero

# Step 6: Increment the counter inside the loop
for number in num_list:
    count += 1  # Increment the counter for each number processed

# Step 7: Print the value of the count variable after the loop
print("Total numbers processed:", count)  # Print the total count of numbers

# Step 8: Add a break statement after finding the number 36
for index, number in enumerate(num_list):
    if number == 36:
        print('Number found at position:', index)  # Print the position of number 36
        break  # Exit the loop after finding number 36
