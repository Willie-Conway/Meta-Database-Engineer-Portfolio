# Test Driven Development (TDD)

# from curses.ascii import isdigit
import importlib
import Python.findstring as findstring
import pytest

# Test Methods 
def test_ispresent():
    assert findstring.ispresent("Al")
    
def test_nodigit():
    assert findstring.nodigit("N7")