'''Implement a function that adds two numbers together and returns their sum in binary.
The conversion can be done before, or after the addition.

The binary number returned should be a string.'''

# perhaps use additive division
def add_binary(a,b):
    binary = []
    sum = a + b
    binary = sum%2
