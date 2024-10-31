# This Python script serves as a guide to commonly used Bash commands in the Mac Terminal.

class Command:
    """Class to represent a command and its description."""
    
    def __init__(self, name, description):
        self.name = name
        self.description = description

    def display_info(self):
        """Display command information."""
        print(f"Command: {self.name}\nDescription: {self.description}\n")


# List of common Bash commands
commands = [
    Command("cd", "Change Directory - Navigate to a different folder."),
    Command("ls", "List command - Show the content of a directory."),
    Command("rm", "Remove command - Delete a file or a directory."),
    Command("mv", "Move command - Move files or folders to another location."),
    Command("touch", "Create a new empty file or update the timestamp on a file."),
    Command("cp", "Copy command - Make a copy of a file or folder."),
    Command("mkdir", "Make directory - Create a new directory."),
    Command("pwd", "Print Work Directory - Shows the current location in the shell."),
    Command("cat", "Concatenate - Read the contents of a file."),
    Command("less", "View file contents one page at a time."),
    Command("grep", "Search for specific text within files or directories."),
]

# Display command information
if __name__ == "__main__":
    print("Common Bash Commands in Mac Terminal:\n")
    for command in commands:
        command.display_info()
