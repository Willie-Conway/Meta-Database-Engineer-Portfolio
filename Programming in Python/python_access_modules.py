# Access Modules

# Import
import sys

# my calendar
locations = sys.path
print(locations)

# For loop
for i in locations:
    print(i)
    
import calendar

# leapdays
leapdays = calendar.leapdays(2000, 2050)

# prints the leap days
print(leapdays)

# determine if there's leap days 
# in the folowing year
# boolean
isitleap = calendar.isleap(2036)

print(isitleap)