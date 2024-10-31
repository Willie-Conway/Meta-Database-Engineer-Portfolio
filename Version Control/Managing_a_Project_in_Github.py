# This Python script serves as a guide for forking a repository and updating files in GitHub.

def print_instructions():
    """Function to print the step-by-step instructions for using GitHub CLI."""
    instructions = [
        "1. Open the Terminal and authenticate using GitHub CLI:",
        "   gh auth login",
        "",
        "2. Create an authentication token in your GitHub account with specified scopes.",
        "   Copy the token from GitHub and paste it into the terminal. Verify authorization was successful.",
        "   (A new token will not be needed if one has already been created and is non-expired.)",
        "",
        "3. Visit the class repo and click the fork button.",
        "",
        "4. Select the owner from the dropdown and add a description (optional) then click the Create fork button.",
        "",
        "5. Clone the repository using the GitHub CLI command:",
        "   gh repo clone <YOUR_USERNAME>/<REPOSITORY-NAME>",
        "",
        "6. Move to the repo directory by using:",
        "   cd <REPOSITORY-NAME>",
        "",
        "7. Open the file named 'class.txt'.",
        "",
        "8. Replace the content of the file with the contents below:",
        "   12345678910111213",
        "   Crimson",
        "   Orange",
        "   Blue",
        "   Cyan",
        "   Yellow",
        "   Charcoal",
        "   Khaki",
        "   Coral",
        "   Silver",
        "   Fuchsia",
        "",
        "9. Save the file.",
        "",
        "10. Using the diff command, note which lines were deleted and which lines were added:",
        "    git diff",
        "",
        "11. Add the file and commit it to the repository with a message:",
        "    git add class.txt",
        "    git commit -m 'some message'",
        "",
        "12. Push the commit to the forked repository:",
        "    git push"
    ]
    
    for step in instructions:
        print(step)

if __name__ == "__main__":
    print("Instructions for Forking a Repository and Updating Files:")
    print_instructions()
