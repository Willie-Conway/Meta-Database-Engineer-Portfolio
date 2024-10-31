# Reload function

# Import python library
import importlib
# Import sample class
# import sample

# Import filechanges class
import filechanges

# Changes function
def changes():
    # Try block
    try:
        importlib.reload(filechanges)
        # Call function
        filechanges.print_changes()
    # Exception
    except:
        pass
    
# For loop
for i in range(5):
    changes()
    # Input statement
    input("Hit enter to reload...")

# Reload function
# importlib.reload(sample)
# importlib.reload(sample)
# importlib.reload(sample)
