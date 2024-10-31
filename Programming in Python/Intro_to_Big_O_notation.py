def constant_time_example(arr):
    """
    O(1) - Constant Time
    Accessing an element by its index does not depend on the size of the array.
    """
    # Access the first element of the array
    if arr:
        return arr[0]
    return None

def linear_time_example(arr, target):
    """
    O(n) - Linear Time
    Searching for a specific value in an unsorted list.
    The time taken grows linearly with the number of elements.
    """
    for i in range(len(arr)):
        if arr[i] == target:
            return i  # Return index of the target if found
    return -1  # Return -1 if the target is not found

def quadratic_time_example(arr):
    """
    O(n^2) - Quadratic Time
    Bubble Sort implementation.
    Time complexity grows quadratically with the number of elements.
    """
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                # Swap if the element found is greater than the next element
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr  # Return the sorted array

def logarithmic_time_example(arr, target):
    """
    O(log n) - Logarithmic Time
    Binary Search implementation.
    The search time decreases dramatically with the size of the array.
    """
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = left + (right - left) // 2
        if arr[mid] == target:
            return mid  # Return index if target is found
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1  # Return -1 if target is not found

# Example usage of the functions
if __name__ == "__main__":
    # Example for O(1)
    print("Constant Time Example:", constant_time_example([10, 20, 30]))

    # Example for O(n)
    unsorted_list = [3, 5, 2, 4, 1]
    target_value = 4
    print("Linear Time Example (Search):", linear_time_example(unsorted_list, target_value))

    # Example for O(n^2)
    unsorted_array = [5, 1, 4, 2, 8]
    sorted_array = quadratic_time_example(unsorted_array)
    print("Quadratic Time Example (Bubble Sort):", sorted_array)

    # Example for O(log n)
    sorted_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    target_value_binary = 7
    print("Logarithmic Time Example (Binary Search):", logarithmic_time_example(sorted_list, target_value_binary))
