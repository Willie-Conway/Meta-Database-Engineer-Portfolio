# Args

# def sum_of(a, b):
    # return a + b

def sum_of(*args):
    sum = 0
    for x in args:
        sum += x
    return sum    

print(sum_of(4, 5, 6))   # 15

print(sum_of(4, 5, 6, 4, 5, 6)) # 30

# Error

# TypeError: sum_of() takes 2 positional arguments but 3 were given 

