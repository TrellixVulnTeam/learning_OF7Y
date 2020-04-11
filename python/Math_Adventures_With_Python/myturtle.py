from turtle import *


# do the same thing but with a for_loop

for i in range(4):
    shape('turtle')
    forward(100)
    right(90)


# define your own function for the for_loop
def square():
    for i in range(4):
        shape('turtle')
        forward(100)
        right(90)

# write a loop that draws 60 squares in a circle
for i in range(60):
    square()
    right(5)
    speed(0)
    








