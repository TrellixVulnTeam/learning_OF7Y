#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Aug  6 18:59:27 2020

@author: petercw94
"""

'''In this kata you will create a function that takes a 
list of non-negative integers and strings and returns a new list 
with the strings filtered out.'''

def filter_list(l):
    new_list = []
    for i in l:
        if type(i) == type(1):
            new_list.append(i)
        else:
            next 
    print(new_list)
    

filter_list([1,2,'a', 'b'])
