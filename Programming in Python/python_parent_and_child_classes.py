# Parent classes vs. child classes

# Employees class
class Employees:
    
    # Init method
    def __init__(self, name, last) -> None:
        self.name = name 
        self.last = last
        
# Supevisors class
class Supervisors(Employees):
    
    # Init method
    def __init__(self, name, last, password) -> None:
        # Super method
        super().__init__(name, last)
        self.password = password
        
# Chefs class      
class Chefs(Employees):
    
    # Leave request method
    def leave_request(self, days):
        return "May I take leave for " + str(days) + " days"


# Chefs and Employees    
adrian = Supervisors("Adrian", "A", "apple")  
    
emily = Chefs("Emily", "E")  
      
juno = Chefs("Juno", "J") 

# Print leave request
print(emily.leave_request(3))

# Print password
print(adrian.password)

# Print name
print(emily.name)


# Hint:

# Note that both the instance variables 
# and methods inside the individual inherited 
# classes are present along with the variables 
# from the parent class. 

