# Exceptions in Python


# Task 1 : IndexError

try:
    item = items[6] # type: ignore
    print(item)
except: 
    print("The index does not exist in the list.")
    
    
# Task 2 : ZeroDivisionError

def divide_by(a, b):
    try:
        return a / b
    except ZeroDivisionError:
        return 0
    except Exception as e:
        print(e, 'Something went wrong!')

ans = divide_by(10,0)
print(ans)


# Task 3 : FileNotFoundError

try:
    with open('file_does_not_exist.txt', 'r') as file:
        print(file.read())
except:
    print("Unable to locate file")  
