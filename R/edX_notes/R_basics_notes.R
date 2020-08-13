# general libs
library(tidyverse)
library(dslabs)

# dataframes used
data("murders")


# vector arithmetics ####

# to compute the murder rate column we can simply divide the 
# murders$total/murders$population * 100000 to get the murder rate per capita
murders$rate = (murders$total/murders$population) * 100000

# section 2 assessment ####

x <- c(2, 43, 27, 96, 18)
sort(x)
rank(x)
order(x)
min(x)
which.min(x)
max(x)
which.max(x)

name <- c("Mandi", "Amy", "Nicole", "Olivia")
distance <- c(0.8, 3.1, 2.8, 4.0)
time <- c(10, 30, 40, 50)
new_time = time/60
distance/new_time

# plotting basics

# plot
x <- murders$population / 10^6 # this division allows us to see the per-capita
y <- murders$total
plot(x, y)

# hist 
x <- with(murders, total / population * 100000)
hist(x)

# boxplot
murders$rate <- with(murders, total / population * 100000)
boxplot(rate~region, data = murders)

# image 
x <- matrix(1:120, 12, 10)
image(x)

# SECTION 3 ASSESMENT ####
library(dslabs)
data(heights)
options(digits = 3)    # report 3 significant digits for all answers

# find avg height
mean(heights$height)
# 68.3
ind <- heights %>% filter(heights$height > mean(heights$height) & heights$sex == "Female")
nrow(ind)
# 532 people are above average height

1-mean(heights$sex == "Female")
.77

# determine min height
min(heights$height)

# match first index with min
heights$sex[[match(min(heights$height), heights$height)]]

# determine the max height
max(heights$height)
match(max(heights$height), heights$height)

match(min(heights$height), heights$height) - match(max(heights$height), heights$height)

(1050 - mean(which(heights$sex == "Female")))/1050

# create a new column in heights
heights <- heights %>%
  mutate(height_cm = heights$height * 2.54)
# what is the height of the 18th individual
heights$height_cm[[18]]  
# what is the mean height in cm
mean(heights$height_cm)

# Create a data frame females by filtering the 
# heights2 data to contain only female individuals.
females <- heights %>% filter(heights$sex %in% "Female")
nrow(females)
# mean height of females in cm
mean(females$height_cm)

# plotting
data(olive)
glimpse(olive)

# Plot the percent palmitic acid versus palmitoleic acid in a scatterplot. 
# What relationship do you see?
plot(olive$palmitic, olive$palmitoleic)

# Create a histogram of the percentage of eicosenoic acid in olive.
hist(olive$eicosenoic)

# Make a boxplot of palmitic acid percentage in 
# olive with separate distributions for each region.
boxplot(palmitic~region, data = olive)

# SECTION 4 ASSESMENT ####
library(dslabs)
data(heights)

# Write an ifelse() statement that returns 1 if the sex is Female and 2 if the sex is Male.
# What is the sum of the resulting vector?
binary_sex <- ifelse(heights$sex == "Male", 2, 1)
sum(binary_sex)

# Write an ifelse() statement that takes the height column and returns the height
# if it is greater than 72 inches and returns 0 otherwise.
# What is the mean of the resulting vector?
new_height <- ifelse(heights$height > 72, heights$height, 0)
mean(new_height)

# Write a function inches_to_ft that takes a number of inches x and returns the number of 
# feet. One foot equals 12 inches.
# What is inches_to_ft(144)?
inches_to_ft <- function(n){
  ft <- n/12
  ft
}
inches_to_ft(144)

# How many individuals in the heights dataset have a height less than 5 feet?
sum(ifelse(inches_to_ft(heights$height) < 5, TRUE, FALSE))

any(TRUE, TRUE, FALSE)
all(TRUE, TRUE, FALSE)
all(FALSE,FALSE,FALSE)

# Given an integer x, the factorial of x is called x! and is the product of all 
# integers up to and including x. The factorial() function computes factorials in R. 
# For example, factorial(4) returns 4! = 4 × 3 × 2 × 1 = 24.

# define a vector of length m
m <- 10
f_n <- vector(length = m)

# make a vector of factorials
_________{
  f_n[n] <- factorial(n)
}

# inspect f_n
f_n

# Complete the code above to generate a vector of length m where the first entry is 1!, 
# the second entry is 2!, and so on up to m!.

