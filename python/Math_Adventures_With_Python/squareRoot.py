#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug  5 11:17:41 2020

@author: peterwilliams
"""

# libs

# create an average function
def average(a,b):
    return (a + b)/2

def squareRoot(num, low, high):
    # finds the square root of num by playing the Number guessing Game
    # strategy by guessing over the range from "low" to "high"
    for i in range(20):
        guess = average(low, high)
        if guess**2 == num:
            print(guess)
        elif guess**2 > num: #"Guess lower"
            high = guess
        else: # guess higher
            low = guess
    print(guess)

squareRoot(200,14,15)