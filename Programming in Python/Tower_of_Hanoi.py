def hanoi(disks, source, helper, destination):
    """
    Recursive function to solve the Tower of Hanoi puzzle.
    
    Parameters:
    disks (int): The number of disks to move.
    source (str): The tower from which disks are to be moved.
    helper (str): The tower to assist in the movement of disks.
    destination (str): The tower to which disks are to be moved.
    """
    # Base Condition: If there's only one disk, move it directly to the destination
    if disks == 1:
        print(f'Disk 1 moves from tower {source} to tower {destination}.')
        return  # End the function call for this branch
    
    # Recursive call to move n-1 disks from source to helper
    hanoi(disks - 1, source, destination, helper)
    
    # Move the nth disk from source to destination
    print(f'Disk {disks} moves from tower {source} to tower {destination}.')
    
    # Recursive call to move the n-1 disks from helper to destination
    hanoi(disks - 1, helper, source, destination)

# Driver code
if __name__ == "__main__":
    # Take input for the number of disks to move
    disks = int(input('Number of disks to be displaced: '))
    
    # Start the process: Move disks from tower A to tower C using B as helper
    hanoi(disks, 'A', 'B', 'C')
