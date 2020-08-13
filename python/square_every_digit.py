#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon May  4 17:45:23 2020

@author: petercw94
"""

# Welcome. In this kata, you are asked to square every digit of a 
# number.

# For example, if we run 9119 through the function, 
# 811181 will come out, because 92 is 81 and 12 is 1.

# Note: The function accepts an integer and returns an integer

def square_digits(num):
    new_num = []
    for i in str(num):
        new_num.append(int(i)**2)
    print(int(new_num))

square_digits(9119)