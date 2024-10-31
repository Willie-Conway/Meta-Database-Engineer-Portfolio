#!/bin/bash
# This script demonstrates basic usage of common Bash commands in Mac Terminal.

# Change Directory to the user's home folder
echo "Changing directory to the home folder..."
cd ~
echo "Current directory:"
pwd

# List contents of the current directory
echo -e "\nListing contents of the home directory:"
ls

# Create a new directory called 'test_directory'
echo -e "\nCreating a new directory named 'test_directory'..."
mkdir test_directory
echo "Directory created."

# Change into the new directory
cd test_directory
echo "Current directory after change:"
pwd

# Create an empty file called 'example.txt'
echo -e "\nCreating an empty file 'example.txt'..."
touch example.txt
echo "File created."

# Display the contents of the directory again
echo -e "\nListing contents of the 'test_directory':"
ls

# Create a copy of 'example.txt' named 'example_copy.txt'
echo -e "\nCopying 'example.txt' to 'example_copy.txt'..."
cp example.txt example_copy.txt
echo "Copy created."

# List contents to show the copy
echo -e "\nContents after copying:"
ls

# Remove the copy
echo -e "\nRemoving the copy 'example_copy.txt'..."
rm example_copy.txt
echo "Copy removed."

# Return to the home directory
cd ..
# Remove the test directory
echo -e "\nRemoving 'test_directory'..."
rm -r test_directory
echo "'test_directory' removed."

# Using grep to search for a term in a file (this assumes a file exists)
echo -e "\nSearching for the term 'example' in 'example.txt' (this will not show results as file is empty):"
grep "example" example.txt

# Displaying the manual page for 'ls'
echo -e "\nDisplaying the manual page for 'ls':"
man ls
