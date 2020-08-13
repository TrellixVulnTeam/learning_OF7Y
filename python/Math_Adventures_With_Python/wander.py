#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug  5 09:06:49 2020

@author: peterwilliams
"""

# libs
from turtle import *
from random import randint

# allow the turtle to wander around the screen
speed(0)

def wander():
    while True:
        fd(3)
        # change the parameters the turtle can wander from the traditional 300 grid to 200 grid
        if xcor() >= 200 or xcor() <= -200 or ycor() <= -200 or ycor() >= 200:
            lt(randint(90,180)) # if the turtle hits the +- 200 mark on the x or y then it will do a left turn

wander()

