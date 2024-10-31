def count_tickets_on_rail(tickets_on_rail):
    """
    Counts the total number of food order tickets on the rail board.

    Parameters:
    tickets_on_rail (list): A list representing tickets on the rail. 
                             Each element is a ticket (could be any non-empty value).

    Returns:
    int: The total number of tickets on the rail.
    """
    # Initialize the ticket counter
    T = 0

    # Loop through the tickets two at a time
    for i in range(0, len(tickets_on_rail), 2):
        # Increment by 2 for each pair found
        T += 2 if i + 1 < len(tickets_on_rail) else 1  # Check if there is a pair

    # Return the total count of tickets
    return T

# Example usage:
# Let's create a list of tickets on the rail
tickets = ["Ticket1", "Ticket2", "Ticket3"]  # Example with three tickets
total_tickets = count_tickets_on_rail(tickets)

print("Total tickets on the rail:", total_tickets)
