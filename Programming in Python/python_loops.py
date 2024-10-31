import time

# Loops 

favorites= ['Creme Brulee', 'Apple Pie', 'Churros', 'Tiramisu', 'Chocolate Cake']

# for loop

# for i in range(10):
#     print('Looping ..', i)

# for item in favorites:
#     print('I like this dessert', item)

# while loop

# count = 0

# while count < len(favorites):
#     print('i like this dessert', favorites[count])
#     count += 1

# for idx, item in enumerate(favorites):
#     print(idx, item)
    
# favorites = ['Creme Brulee', 'Apple Pie', 'Churros', 'Tiramisú', 'Chocolate Cake']

# count = 0

# while count < len(favorites):
#     print('One of my favorite desserts is', favorites[count]);
#     count += 1


# Time complexity
    
start_time = time.time()  

# outer loop
for i in range(100):
    
    #inner loop
    for j in range(10000):
        print(0, end = " ")
    print()

print(round((time.time() - start_time), 2))