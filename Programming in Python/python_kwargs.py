# Kwargs

def sum_of(**kwargs):
    sum = 0
    
    for k, v in kwargs.items():
        sum += v
    return round(sum, 2)

# Calculate a total bill for restauraunt
print(sum_of(coffee=2.99, cake=4.55, juice=2.99))


# Hint:
# Key Word Args = Kwargs