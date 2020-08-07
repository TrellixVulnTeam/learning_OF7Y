#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Aug  4 19:58:31 2020

@author: peterwilliams
"""
# libraries
import pandas as pd 
import numpy as nd


# steps
# 1. define the factors function, which takes a number as an argument
# 2. create an empty factor list to fill with factors
# 3. Loop over all the numbers from 1 to the given number
# 4. If any of these numbers divides evenly, add to factor list
# 5. Return the list of factors at the end

# 1. define the factors function, which takes a number as an argument
'''def factors(num) :
    factorList1 = []
    # creates our empty vector (2)
    for i in range(1, num+1):
        if num % i == 0:
            factorList.append(i)
    print(factorList)

factors(120)'''

# create a function that returns the GCF of two numbers
def gcf(x,y) :
    factorList1 = []
    factorList2 = []
    # create the two lists of factors
    for i in range(1,x+1):
        if x % i == 0: # if the number can be divided by our argument, then it is a factor of it
            factorList1.append(i)
    for i in range(1, y+1):
        if y % i == 0:
            factorList2.append(i)
    # merge the two lists of factors
    newFactorList = set(factorList1).intersection(factorList2)
    # print the greatest common factor
    print(max(newFactorList))
    
gcf(150,138)
    

