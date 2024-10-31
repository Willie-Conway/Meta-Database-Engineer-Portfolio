# Algorithm

# Algorithm for a Palindrome

def isPalindrome(str):
    startIndex = 0
    endIndex = len(str) -1
    
# For loop   
    for x in str:
        # If statement
        if str[startIndex] != str[endIndex]: # Checks to see if the startIndex 
                                             # is not equal to the endIndex
                                             
            return False # Confirms it's not a palindrome
        
        return True # Returns True if condition is met ouitside 
                    # of the for loop
                    
# Testing the Algorithm
print(isPalindrome('racecar')) 

# Hint: 

# If you change racecar to 
# racecars the codition will return False

print(isPalindrome('racecars')) 
    
        


# str = 'racecar'    # Check to see in the word is a 
# index: 0123456     # palindrom by using a algorithm,


# Hint:

# A algorim is a seris of 
# steps to solve a problem.

# Checking indexs

# print(str[0])
# print(str[6])

# Checkking the value of the index
  
#   [0] == [6]
#   [1] == [5]
#   [2] == [4]