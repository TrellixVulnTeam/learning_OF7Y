#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep  1 11:47:18 2020

@author: peterwilliams
"""

# import the libraries
import random
import time

def display_intro():
    print('''You are in a land full of dragons. In front of you, you see two caves.
In one cave, the dragon is friendly and will share his treasure with you.
The other dragon is greedy and hungry, and will eat you on sight.''')
    print()

def choose_cave():
    cave = []
    while cave != 1 and cave != 2: # using and with this while loop is called input validation. The loop will continue asking which cave until they pick 1 or 2
        print("Which cave would you like to enter? (1 or 2): ")
        cave = input()

        return cave

def check_cave(chosen_cave):
    print("You approach the cave...")
    time.sleep(2)
    print('It is dark and spooky...')
    time.sleep(2)
    print("A large dragon jumps out in front of you! He opens his jaws and ...")
    print()
    time.sleep(2)

    friendly_cave = random.randint(1, 2)

    if chosen_cave == str(friendly_cave):
        print('Gives you his treasure!')
    else:
        print('Gobbles you down in one bite!')

# although we defined the functions above, if we were to run the program we wouldn't have anything output into the terminal. We have to call each function, which we do below:
play_again = 'yes'
# setting play again to yes allows us to start the while loop.
while play_again == 'yes' or play_again == 'y':
        # now we can call our functions in order to play our game
        display_intro()
        cave_number = choose_cave()
        check_cave(cave_number)
        # the only way to end the loop is to change our play_again variable from yes. Here we give the player that option.
        print('Do you want to play again? (yes or no): ')
        play_again = input()
