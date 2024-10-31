# ## Instructions:

# 1. Open the `test_spellcheck.py` file inside the project folder.

# 2. Import the `pytest` and `spellcheck` modules.
# 3. Comment out the beta variable using # symbol for now. 
# 4. Next, complete the `test_length()` and `test_struc()` functions.   
#    These two functions use input_value to check if the functions defined in spellcheck behave correctly. 
# 5.  In `test_length()` function, you must add two assert statements.   
#     In each assert statement you first need to call the required function from the spellcheck file that you imported,  
#     and then check against some conditions. For example, the format will be similar to the following against some condition:
#     ```
#     assert spellcheck.some_function(input_value)
#     ```
#     - 5.1: Add the first assert statement over `function word_count()` from the main code which asserts that the returned value is less than 10.
#     - 5.2: Add the second assert statement over `function char_count()` from the main code which asserts that the returned value is less than 50. 
# 

# 6. In the second function `test_struc()`, you must add two assert statements. The first assert statement checks if the first character is in upper case.  
# The second assert statement checks if the sentence or the string variable passed ends with a dot (“.”) 
#     - Add the first assert statement over function `first_char()` from the main code.  
#       Now call a built-in function `isupper()` directly over it, such as `function_name.isupper()`. 
#     - `isupper()` function returns True if it is called over an upper-case character and False if called over a lower-case character.  
#       For example, `"A".isupper()` returns `True` and `"a".isupper()` returns `False`.
#     - Add the second assert statement over the function `last_char()`from the main code and compare it to `“.” ` 
# 

# 7. Save the files.
# 8. Open the terminal to execute the files.
# 9. Run the code using the following command (within the  project directory):
#     ```
#     python3 -m pytest test_spellcheck.py 
#     ```
# 10. Both the tests should pass in this case.  


# - **BONUS STEP:**
# Pass the variable beta instead of alpha in all four of the functions.  
# The result should now show one passed and one failed test.  

# 

# > **Tips**
# > Be sure to double check some common mistakes made in this process 
#   below before submitting!  
# > - Forgetting to import the `pytest` and `main` code file
# > - Not passing the variable names correctly




# Given implementations of some string-related methods. 
# DO NOT CHANGE THIS FILE

def word_count(sentence):
    # Function to check the number of words. Returns the word count in string.
    words = len(sentence.split())
    print(words)
    return words

def char_count(sentence):
    # Function to check the number of characters. Returns the character count in string.
    chars = len(sentence)
    print(chars)
    return chars

def first_char(sentence):
    # Function to check the first character using the string index. Returns the first character in string.
    first = sentence[0]
    return first

def last_char(sentence):
    # Function to check the last character using the string index. Returns the last character in string.
    last = sentence[-1]
    return last