# import the turtle module
from turtle import *

# change the length of the sides of squares using variables
def square(sidelength):
    for i in range(4):
        shape('turtle')
        forward(sidelength)
        right(90)
        


# create a triangle function

def triangle(sidelength):
    for i in range(3):
        shape('turtle')
        forward(sidelength)
        right(120)        

   

# create a polygon function that creates a polygon with the
# same number of sides as the called argument:
# to find the degree turned right, divide 360 by the number of sides

def polygon(sidenumber):
    for i in range(sidenumber):
        shape('turtle')
        forward(50)
        right(360/sidenumber)

polygon(6)


# make a function to draw 60 sqaures, turning 5 degrees after each square
# and making each successive square bigger
def spiral():
    length = 5
    for i in range(60):
        speed(0)
        square(length)
        right(5)
        length += 5


# write a star function that draws a star
# why 144 degrees?
# each angle in the 5 pointed star must add up to 180
# so 180 - (180/5) = 144 
def star(sidelength):
    for i in range(5):
        forward(sidelength)
        right(144)




# write a spiral function for the star
def spiralstar():
    length = 5
    for i in range(60):
        speed(0)
        star(length)
        right(5)
        length += 5



        
        
        

