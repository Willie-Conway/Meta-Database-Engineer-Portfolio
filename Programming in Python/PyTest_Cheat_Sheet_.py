# PyTest Cheat Sheet

# Installation Instructions
# To install PyTest, run the following command in your terminal:
# For Mac:
# pip3 install pytest
# For Windows:
# pip install pytest

# Nomenclature
# - When creating a test file, ensure the file name starts with 'test_'.
# - Similarly, for functions that need to be tested, prefix them with 'test_'.

# Example:
# Filename: test_example.py
# Function: def test_function_name():
# This will allow PyTest to automatically discover these tests.

# Running PyTest
# To run a specific test file, use the following command:
# python3 -m pytest test_file.py
# Alternative command:
# py.test test_file.py

# To run a specific function within a test file, append '::' followed by the function name:
# python3 -m pytest test_file.py::test_function_name

# Flags Used
# PyTest provides several flags to modify its behavior:

# -v : verbose output
# -q : quiet mode
# -s : allows print statements in the test to be executed
# -x : stops execution after the first failure
# -m : marks specific tests to run
# -k : searches for tests with a specific keyword
# --tb : disables traceback for errors
# --maxfail=n : specifies the maximum number of test failures allowed

# Example of running PyTest with flags:
# python3 -m pytest abc.py -v

# Tips for Writing Tests
# - Use assert statements to check for expected outcomes. 
# - Various assert conditions can be used: in, not in, is, <, >, and more.
# - Multiple assert statements can be included in a single test function.

# Fixtures
# Fixtures provide a way to set up conditions for tests. They are functions that run before your test functions.
# They can provide data from various sources, such as databases or URLs.

# Example Fixture:
import pytest

@pytest.fixture
def sample_data():
    # This function provides sample data for the tests.
    return {"key": "value"}

# Example Test using a Fixture:
def test_with_fixture(sample_data):
    assert sample_data["key"] == "value"

# Markers
# Markers allow you to categorize and select tests to run. 
# You can create custom markers using the @pytest.mark decorator.

# Example Marker:
@pytest.mark.alpha
def test_alpha_function():
    assert True  # Example assertion

# To run tests with a specific marker from the command line, use:
# pytest -m alpha -v

# Example usage of a marker:
def test_with_marker():
    assert True

# To summarize, this cheat sheet provides essential commands, tips, and examples for using PyTest effectively.
