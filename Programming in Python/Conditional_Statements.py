# Conditional Statements: if, else, and elif

# Example: Light Switch
# Using a Boolean variable to track the state of the light
current = False  # Light is initially off

# Check the current state of the light
if current:
    # If the light is on, turn it off
    current = False
    print('Turning light off')
else:
    # If the light is off, turn it on
    current = True
    print('Turning light on')

# Example: Customer Discount Calculation
# Let's say we have a loyalty customer and a total bill amount
loyalty_customer = True  # Boolean flag indicating if the customer is part of the loyalty program
total_bill = 124         # Total bill amount

# Check for discounts based on conditions
if loyalty_customer and total_bill > 100:
    # If the customer is a loyalty member and their bill is over $100, apply a 20% discount
    total_bill = total_bill - (total_bill * 0.20)  # Calculate 20% discount
    print('20% discount applied. New total bill:', total_bill)
elif total_bill > 100:
    # If the customer is not a loyalty member but their bill is over $100, apply a 10% discount
    total_bill = total_bill - (total_bill * 0.10)  # Calculate 10% discount
    print('10% discount applied. New total bill:', total_bill)
else:
    # If neither condition is met, apply a 5% service charge
    service_charge = total_bill * 0.05  # Calculate 5% service charge
    total_bill += service_charge  # Add service charge to total bill
    print('Sorry, no discount ...')
    print('Service charge applied. New total bill:', total_bill)

# Final output of the total bill
print('Final Total Bill:', total_bill)
