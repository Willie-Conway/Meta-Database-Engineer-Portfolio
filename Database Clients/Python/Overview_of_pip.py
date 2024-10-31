# Overview of pip
# This script provides a comprehensive overview of pip, the Python package manager,
# and demonstrates its functionalities with examples.

# Import necessary modules (if needed)
import os

# Function to check the version of pip
def check_pip_version():
    """Check the version of pip installed in the environment."""
    print("Checking pip version...")
    os.system("pip --version")  # Use os.system to run shell commands

# Function to install a package using pip
def install_package(package_name):
    """Install a specified package using pip."""
    print(f"Installing package: {package_name}")
    os.system(f"pip install {package_name}")

# Function to show information about a specific package
def show_package_info(package_name):
    """Show details of the specified package."""
    print(f"Showing information for package: {package_name}")
    os.system(f"pip show {package_name}")

# Function to upgrade a package
def upgrade_package(package_name):
    """Upgrade the specified package to the latest version."""
    print(f"Upgrading package: {package_name}")
    os.system(f"pip install --upgrade {package_name}")

# Function to list all installed packages
def list_installed_packages():
    """List all installed packages in the environment."""
    print("Listing all installed packages...")
    os.system("pip list")

# Function to freeze packages to a requirements.txt file
def freeze_packages():
    """Freeze installed packages to a requirements.txt file."""
    print("Freezing installed packages to requirements.txt...")
    os.system("pip freeze > requirements.txt")

# Function to uninstall a package
def uninstall_package(package_name):
    """Uninstall the specified package."""
    print(f"Uninstalling package: {package_name}")
    os.system(f"pip uninstall -y {package_name}")  # -y to confirm uninstallation

# Main execution block
if __name__ == "__main__":
    # Check pip version
    check_pip_version()

    # Example usage of pip functionalities
    # Install a package (mysql-connector)
    install_package("mysql-connector")

    # Show information about the package
    show_package_info("mysql-connector")

    # Upgrade the package
    upgrade_package("mysql-connector")

    # List all installed packages
    list_installed_packages()

    # Freeze installed packages to a requirements.txt file
    freeze_packages()

    # Uninstall the package
    uninstall_package("mysql-connector")
