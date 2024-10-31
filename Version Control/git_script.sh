#!/bin/bash
# This script automates the process of forking a GitHub repository, updating a file, and pushing changes.

# Step 1: Authenticate using GitHub CLI
echo "Authenticating with GitHub CLI..."
gh auth login

# Step 2: Prompt for repository URL to fork
echo "Please fork the repository on GitHub and then enter your forked repository details:"
read -p "Enter your GitHub username: " USERNAME
read -p "Enter the repository name (e.g., class-repo): " REPO_NAME

# Step 3: Clone the repository
echo "Cloning the repository..."
gh repo clone "$USERNAME/$REPO_NAME"

# Step 4: Move to the cloned repository directory
cd "$REPO_NAME" || exit

# Step 5: Open the file named class.txt and replace its content
echo "Updating class.txt file..."
cat <<EOL > class.txt
12345678910111213
Crimson
Orange
Blue
Cyan
Yellow
Charcoal
Khaki
Coral
Silver
Fuchsia
EOL

# Step 6: Save and inspect changes
echo "Inspecting file changes using git diff..."
git diff

# Step 7: Add the file and commit the changes
echo "Adding and committing changes..."
git add class.txt
git commit -m 'Update class.txt with new color list'

# Step 8: Push the changes to the forked repository
echo "Pushing changes to the forked repository..."
git push

echo "Process completed successfully!"
