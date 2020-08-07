#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug  5 09:18:47 2020

@author: peterwilliams
"""

# libs
from random import randint

# create the numberGame

def numberGame():
    # choose a random number between 1 and 100
    number = randint(1, 100)
    print('I\'m thinking of a number between 1 and 100.')
    guess = int(input('What is your guess? '))
    # checking for a correct guess
    # use a while loop to allow guessing until the correct number is guessed (break when number is picked)
    while guess:
        if number == guess:
            print('That\'s correct, the number was ', number)
            break
        elif number > guess:
            print('Wrong, try guessing a higher number.')
        else: 
            print('Wrong, try guessing a lower number.')
        guess = int(input('What\'s your next guess?'))
numberGame()


# create a function that makes a greeting using inputs for later in the game 

def greet():
    name = input("What is your name? ")
    print('Hello, ', name)


# practice writing a function that prints "That's my name too" if Peter is typed, or a
# greeting for any other name
def practiceInput():
    name = input("What is your name? ")
    if name == 'Peter':
        print('That\'s my name, too!')
    else: print ('Hello, ',name)
    
