# Contional

# if
# else
# elif (else if)

# Ex:

#if
bill_total = 114 

discount1= 10

if bill_total > 100:
    print("Bill is greater than 100!")
    
    bill_total = bill_total - discount1
    
print("total bill: " + str(bill_total))  


# else

bill_total = 95 

discount1= 10

if bill_total > 100:
    print("Bill is greater than 100!")
    
    bill_total = bill_total - discount1
else:
    print("Bill is less than 100!")
    
print("total bill: " + str(bill_total)) 

# else if

bill_total = 210 

discount1= 10
discount2 = 20

if bill_total > 100 and bill_total < 200:
    print("Bill is greater than 100!")
    
    bill_total = bill_total - discount1
elif bill_total > 200:
    print("Bill is greater than 200!")
    bill_total = bill_total - discount2
else:
    print("Bill is less than 100!")
    
print("total bill: " + str(bill_total)) 


 # If else
 
 #Starter Code
favorites = ['Creme Brulee', 'Apple Pie', 'Churros', 'Tiramisú', 'Chocolate Cake']

for dessert in favorites:
    if dessert == 'Churros':
        print('Yes! One of my favorite desserts is', dessert) 
        
        
 #Starter Code
favorites = ['Creme Brulee', 'Apple Pie', 'Churros', 'Tiramisú', 'Chocolate Cake']

for dessert in favorites:
    if dessert == 'Pudding':
        print('Yes one of my favorite desserts is', dessert) 
    else:
        print('No sorry, that dessert is not on my list')       






# Loop control statements

#Starter Code
favorites = ['Creme Brulee', 'Apple Pie', 'Churros', 'Tiramisú', 'Chocolate Cake']

for dessert in favorites:
    if dessert == 'Pudding':
        print('Yes one of my favorite desserts is', dessert)
        break 
    else:
        print('No sorry, not a dessert on my list')

# Continue

#Starter Code
favorites = ['Creme Brulee', 'Apple Pie', 'Churros', 'Tiramisú', 'Chocolate Cake']

for dessert in favorites:
    if dessert == 'Churros':
        continue
    print('Other desserts I like are', dessert) 
    
    
# Pass

#Starter Code
favorites = ['Creme Brulee', 'Apple Pie', 'Churros', 'Tiramisú', 'Chocolate Cake']

for dessert in favorites:
    if dessert == 'Churros':
        pass
    print('Other desserts I like are', dessert) 
    
    
    





# for loop
# while loop
# do while loop


# Switches





