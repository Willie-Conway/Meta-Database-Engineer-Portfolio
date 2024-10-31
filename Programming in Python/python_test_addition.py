# Test cases

import Python.addition as addition
import pytest 


def test_add():
    # assert True
    assert addition.add(4, 5) == 9
    # pass

def test_sub():
    # assert False
    assert addition.sub(4, 5) == -1
    # pass