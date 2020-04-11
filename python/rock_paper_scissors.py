#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Mar 18 10:51:37 2020

@author: peterwilliams
"""
import random

comp_wins = 0
player_wins = 0

# set up function to let user make choice
def Choose_Option():
    user_choice = input("Choose Rock, Paper, or Scissors: ")
    if user_choice in ["Rock", "rock", "r", "R"]:
        user_choice = "r"
    elif user_choice in ["Paper", "paper", "P", "p"]:
        user_choice = "p"
    elif user_choice in ["Scissors", "scissors", "S", "s"]:
        user_choice = "s"
    else:
        print("I don't understand, please try again.")
        Choose_Option()
    return user_choice


# define a function for computer to make choice
def Computer_Option():
    comp_choice = random.randint(1,3)
    if comp_choice == 1:
        comp_choice = "r"
    elif comp_choice == 2:
        comp_choice = "p"
    elif comp_choice == 3:
        comp_choice = "s"
    return comp_choice

# create a while loop to compare results
while True:
    print("")
    user_choice = Choose_Option()
    comp_choice = Computer_Option()
    print("")
    
    if user_choice == "r":
        if comp_choice == "r":
            print("You chose rock. The computer chose rock. You tied")
        elif comp_choice == "p":
            print("You chose rock. The computer chose paper. You lose")
            comp_wins += 1
        elif comp_choice == "s":
            print("You chose rock. The computer chose scissors. You win")
            player_wins += 1
            
    if user_choice == "p":
        if comp_choice == "r":
            print("You chose paper. The computer chose rock. You win")
            player_wins += 1
        elif comp_choice == "p":
            print("You chose paper. The computer chose paper. You tie")
        elif comp_choice == "s":
            print("You chose paper. The computer chose scissors. You lose.")
            comp_wins += 1
            
    if user_choice == "s":
        if comp_choice == "r":
            print("You chose scissors. The computer chose rock. You lose")
            comp_wins += 1
        elif comp_choice == "p":
            print("You chose scissors. The computer chose paper. You win")
            player_wins += 1
        elif comp_choice == "s":
            print("You chose scissors. The computer chose scissors. You tie.")
    
    print("")
    print("Player wins: " + str(player_wins))
    print("Computer wins: " + str(comp_wins))
    print("")
    
    user_choice = input("Do you want to play again? (y/n)")
    if user_choice in ["Yes", "yes", "Y", "y"]:
        pass
    elif user_choice in ["No","no", "N", "n"]:
        break
    else:
        break
    






            
            