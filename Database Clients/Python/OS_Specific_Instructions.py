# Importing necessary modules
import os
import subprocess

# Function to check Python version
def check_python_version():
    """Check and print the installed Python version."""
    print("Checking Python version...")
    try:
        # Run the command to check the Python 3 version
        version = subprocess.check_output(['python3', '--version']).decode('utf-8').strip()
        print(f"Installed Python version: {version}")
    except FileNotFoundError:
        print("Python 3 is not installed on your system.")
        print("Please install Python from https://www.python.org/downloads/")
        return False
    return True

# Function to install Jupyter Notebook
def install_jupyter():
    """Install Jupyter Notebook using pip."""
    print("Installing Jupyter Notebook...")
    try:
        # Run the command to install Jupyter Notebook
        subprocess.check_call(['python3', '-m', 'pip', 'install', 'jupyter', 'notebook'])
        print("Jupyter Notebook installed successfully.")
    except subprocess.CalledProcessError:
        print("An error occurred while installing Jupyter Notebook.")
        return False
    return True

# Function to launch Jupyter Notebook
def launch_jupyter():
    """Launch Jupyter Notebook in the default web browser."""
    print("Launching Jupyter Notebook...")
    try:
        subprocess.Popen(['jupyter', 'notebook'])
        print("Jupyter Notebook should now be open in your browser.")
    except Exception as e:
        print(f"An error occurred while launching Jupyter Notebook: {e}")

# Function to install MySQL Connector/Python
def install_mysql_connector():
    """Install MySQL Connector/Python using pip."""
    print("Installing MySQL Connector/Python...")
    try:
        subprocess.check_call(['pip', 'install', 'mysql-connector-python'])
        print("MySQL Connector/Python installed successfully.")
    except subprocess.CalledProcessError:
        print("An error occurred while installing MySQL Connector/Python.")
        return False
    return True

# Main script execution
if __name__ == "__main__":
    # Check if Python is installed
    if check_python_version():
        # Install Jupyter Notebook
        if install_jupyter():
            # Launch Jupyter Notebook
            launch_jupyter()
            # Install MySQL Connector/Python
            install_mysql_connector()
