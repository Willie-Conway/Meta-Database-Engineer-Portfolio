# String reversal 2

def string_reverse(str):
    # If statement
    if len(str) == 0:
        return str
    else:
        return string_reverse(str[1:]) + str[0] # The string is reverse from front skippin every character
    
str = "reversal"
reverse = string_reverse(str) # function calling the string
print(reverse) # Prints a reverese order of the string
