#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Aug 14 18:38:36 2020

@author: peterwilliams
"""

from random import randint 

def guess_game():
    play = 1
    num = randint(1,10)
    game = input("Would you like to play a game? (Y/N): ")
    if game == "yes" or "Yes" or 'y' or 'Y':
        play = 0
    elif game == 'no' or 'No' or 'n' or 'N':
        print("That's too bad. Maybe later!")
    else:
        print("I am not sure what that means, please try again later.")  
    while play < 10:
        guess = int(input("I am thinking of a number between 1 and 10. What do you think the number is?: "))
        if guess == num:
            print("Good job! You guessed it. The number was " + str(num))
            break
        elif guess < num: 
            print("Try guessing higher")
        else:
            print("Try guessing lower")
            
guess_game()
            

        
