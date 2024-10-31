# Instance methods

# Class statement
class Payslips:
    def __init__(self, name, payment, amount) -> None:
        self.name = name
        self.payment = payment
        self.amount = amount
        
    # Pay method
    def pay(self):
        self.payment = "yes"
        
    # Status method
    def status(self):
        
        # If statement
        if self.payment == "yes":
            return self.name + " is paid " + str(self.amount)
        
        # Else statement
        else: 
            return self.name  + " is not paid yet"
 
 # Payslips           
nathan = Payslips("Nathan", "no", 1000)
roger = Payslips("Roger", "no", 3000)

# Print status
print(nathan.status(), "\n", roger.status())
    
    
# Pay function
nathan.pay()  
 
print("After payment")

print(nathan.status(), "\n", roger.status())
  