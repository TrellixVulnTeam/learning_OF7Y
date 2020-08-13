#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug  6 18:47:47 2020

@author: petercw94
"""

# create an equation that can solve all first-degree equations
def equation(a,b,c,d):
    '''solves equations of the form 
    ax + b = cx + d'''
    return (d-b)/(a-c)

# solve the equation 12x + 18 = -34x + 67
# print(equation(12, 18, -34, 67))
    
# solve the most sinister looking equation (1/2x + 2/3 = 1/5x + 7/8)
x = equation(1/2, 2/3, 1/5, 7/8)
print(x)