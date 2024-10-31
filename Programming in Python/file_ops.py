def read_file(file_name):
    """ Reads in a file and returns its contents.

    Args:
        file_name: the name of the file to be read

    Returns:
        string: contents of the given file.
    """
    with open(file_name, 'r') as file:
        contents = file.read()  # Read the entire file content
    print(contents)  # Print the contents of the file
    return contents  # Return the contents


def read_file_into_list(file_name):
    """ Reads in a file and stores each line as an element in a list.

    Args:
        file_name: the name of the file to be read

    Returns:
        list: a list where each element is a line in the file.
    """
    with open(file_name, 'r') as file:
        lines = file.readlines()  # Read the file line by line
    return [line.strip() for line in lines]  # Return lines without newline characters


def write_first_line_to_file(file_contents, output_filename):
    """ Writes the first line of a string to a file.

    Args:
        file_contents: string to be split and written into output file
        output_filename: the name of the file to be written to
    """
    with open(output_filename, 'w') as output_file:
        first_line = file_contents.split('\n')[0]  # Get the first line
        output_file.write(first_line)  # Write the first line into the output file


def read_even_numbered_lines(file_name):
    """ Reads in the even numbered lines of a file.

    Args:
        file_name: the name of the file to be read

    Returns:
        list: a list of the even-numbered lines of the file
    """
    with open(file_name, 'r') as file:
        lines = file.readlines()  # Read all lines in the file
        even_lines = [line.strip() for i, line in enumerate(lines) if i % 2 == 1]  # Get even lines
    return even_lines  # Return the list of even lines


def read_file_in_reverse(file_name):
    """ Reads a file and returns a list of the lines in reverse order.

    Args:
        file_name: the name of the file to be read

    Returns:
        list: list of the lines of the file in reverse order.
    """
    with open(file_name, 'r') as file:
        lines = file.readlines()  # Read all lines in the file
        reversed_lines = list(reversed(lines))  # Reverse the order of lines
    print(reversed_lines)  # Print the reversed lines
    return [line.strip() for line in reversed_lines]  # Return reversed lines without newline characters


def main():
    # Demonstration of the functions
    file_contents = read_file("sampletext.txt")
    print(read_file_into_list("sampletext.txt"))
    write_first_line_to_file(file_contents, "online.txt")
    print(read_even_numbered_lines("sampletext.txt"))
    print(read_file_in_reverse("sampletext.txt"))


if __name__ == "__main__":
    main()
