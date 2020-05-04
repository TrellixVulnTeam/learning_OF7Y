#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Apr 24 12:47:11 2020

@author: peterwilliams
"""
import random
# make a user input
def Choose_Option():
    user_choice = input("Pick a number between 0 and 10")
    return user_choice

# make a computer import
def Computer_Option():
    computer_choice = random.randint(1,10)
    return computer_choice
    

# print out the result
    
# ask to play again