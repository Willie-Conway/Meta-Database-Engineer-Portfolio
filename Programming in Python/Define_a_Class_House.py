class House:
    ''' 
    This class represents a house that can be used to create objects 
    and evaluate different metrics required in constructing it.
    '''
    
    # Class attributes
    num_rooms = 5       # Default number of rooms in the house
    bathrooms = 2       # Default number of bathrooms in the house

    def cost_evaluation(self, rate):
        '''
        This method calculates the cost based on the number of rooms 
        and a given rate per room.
        
        Parameters:
        rate (float): The cost per room
        
        Returns:
        float: The total cost of the house based on the number of rooms.
        '''
        # Calculate total cost
        cost = rate * self.num_rooms
        return cost

# Creating an instance of House
house = House()

# Outputting the default number of rooms using the instance
print(f"Number of rooms (instance): {house.num_rooms}") # Outputs: 5
# Outputting the default number of rooms using the class
print(f"Number of rooms (class): {House.num_rooms}")    # Outputs: 5

# Modifying the instance attribute
house.num_rooms = 7
print(f"Updated number of rooms (instance): {house.num_rooms}") # Outputs: 7
print(f"Number of rooms (class after instance modification): {House.num_rooms}") # Outputs: 5

# Modifying the class attribute
House.num_rooms = 7
print(f"Number of rooms (instance after class modification): {house.num_rooms}") # Outputs: 7
print(f"Number of rooms (class after modification): {House.num_rooms}") # Outputs: 7

# Calculating the cost of the house using the cost_evaluation method
rate_per_room = 10000  # Example cost rate per room
total_cost = house.cost_evaluation(rate_per_room)
print(f"Total cost of the house: ${total_cost}") # Outputs: 70000
