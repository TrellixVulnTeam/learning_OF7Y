# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

# solving first degree equations with brute force (working harder)
# equation: 2x + 5 = 13, solve for x
def plug():
    x = -100 # start at -100
    while x < 100: # go up to 100
        if 2*x + 5 == 13: # if it makes the equation true
            print('x = ', x) # print the answer
        x += 1 # make x go up by 1 to test the next number

plug()
    