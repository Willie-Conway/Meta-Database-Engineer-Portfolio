# Importing ABC and abstractmethod from the module abc (which stands for abstract base classes)
from abc import ABC, abstractmethod

# Class Bank inherits from ABC
class Bank(ABC):
    """ An abstract bank class

    This class must derive from class ABC and contains the following:
    - A method basicinfo() that prints "This is a generic bank" and returns a string "Generic bank: 0"
    - An abstract method withdraw() that will be implemented in derived classes.
    """

    @abstractmethod
    def basicinfo(self):
        # Method to provide basic information about the bank
        print("This is a generic bank")
        return "Generic bank: 0"
    
    @abstractmethod
    def withdraw(self, amount):
        # Abstract method for withdrawing money, to be implemented in subclasses
        pass

# Class Swiss inherits from Bank
class Swiss(Bank):
    """ A specific type of bank that derives from class Bank

    This class implements the following:
    - A constructor that initializes a class variable `bal` to 1000
    - A method basicinfo() that provides information specific to Swiss Bank
    - A method withdraw() that allows withdrawal of funds with balance checking
    """

    def __init__(self):
        # Constructor for Swiss class initializes balance
        self.bal = 1000

    def basicinfo(self):
        # Overrides the basicinfo method from Bank class
        print("This is the Swiss Bank")
        return f"Swiss Bank: {self.bal}"

    def withdraw(self, amount):
        # Overrides the withdraw method from Bank class
        if amount > self.bal:
            # Check if there are sufficient funds
            print("Insufficient funds")
            return self.bal
        else:
            # Process withdrawal
            print(f"Withdrawn amount: {amount}")
            self.bal -= amount  # Deduct the amount from the balance
            print(f"New Balance: {self.bal}")
            return self.bal

# Driver Code
def main():
    # Ensure that Bank is a subclass of ABC
    assert issubclass(Bank, ABC), "Bank must derive from class ABC"
    
    # Create an instance of Swiss
    s = Swiss()
    
    # Print basic information about the Swiss Bank
    print(s.basicinfo())
    
    # Attempt to withdraw a valid amount
    s.withdraw(30)  # Expected to succeed
    # Attempt to withdraw an amount greater than the balance
    s.withdraw(1000)  # Expected to fail with "Insufficient funds"

# The standard Python boilerplate for executing the main function
if __name__ == "__main__":
    main()
