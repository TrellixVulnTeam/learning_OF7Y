library(tidyverse)
library(stringr)
library(dslabs)

# case study 1: U.S. murders raw data ####
library(rvest)
url <- paste0("https://en.wikipedia.org/w/index.php?title=",
              "Gun_violence_in_the_United_States_by_state",
              "&direction=prev&oldid=810166167")
murders_raw <- read_html(url) %>%
  html_node("table") %>%
  html_table() %>%
  setNames(c("state", "population", "total", "murder_rate"))

# try coercing the character values representing numbers as.numeric
as.numeric(murders_raw$population[1:3])

# NAs introduced by coercion because there are commas in the numbers which are not recognized numeric
# by R
# using str_detect() we can determine what kind of pattern is being used in strings
commas <- function(x) any(str_detect(x, ",")) # a function that lets you check each column for commas
murders_raw %>% summarize_all(commas)
# we can see that population and total columns have commas that need to be removed

# the commas can then be replaced with str_replace_all():
test_1 <- str_replace_all(murders_raw$population, ",", "")
test_1 <- as.numeric(test_1)

# we can now get apply this function to each column to get rid of all columns
# HOWEVER, since this is such a common problem in data wrangling, there is a built in function
# for parsing non-numeric characters inorder to coerce a string to numeric:
test_2 <- parse_number(murders_raw$population)
identical(test_1, test_2)

# using the mutate_at() function we can apply this parse_number function to our data frame:
murders_new <- murders_raw %>% mutate_at(2:3, parse_number)
head(murders_new)


# Case Study 2: self-reported heights ####
data(reported_heights)

# These heights were obtained using a web form in which students were asked to enter 
# their heights. They could enter anything, but the instructions asked for height in inches, 
# a number. We compiled 1,095 submissions, but unfortunately the column vector with the 
# reported heights had several non-numeric entries and as a result became a character vector:
class(reported_heights$height)
# if we try to parse it into numbers there is a warning
x <- as.numeric(reported_heights$height)
# there are quite a few NAs
sum(is.na(x))
# to take a look at some of the entries containing NAs we can use the following command:
reported_heights %>% 
  mutate(new_height = as.numeric(height)) %>%
  filter(is.na(new_height)) %>% 
  head(n=10)
# It looks like not all the students reported their height in inches so the conversion 
# wasn't made, resulting in an NA value.
# in order tidy this data set, you will need to find patterns in the messy column


# in order to find patterns in the messy column, it helps to temporarily remove the 
# entries that were done correctly. 
# to do this, write a function that keeps all the NAs from parsing and keeps the numbers
# that are outside a plausible range of heights in inches
not_inches <- function(x, smallest = 50, tallest = 84){
  inches <- suppressWarnings(as.numeric(x))
  ind <- is.na(inches) | inches < smallest | inches > tallest
  ind
}

problems <- reported_heights %>%
  filter(not_inches(height)) %>%
  pull(height)

length(problems)

# after printing the problems we can see three major patterns arise:

# 1. a pattern of the form x'y or x'y'', or x'y" with x and y representing feet and 
# inches

# 2. a pattern of the form x.y or x,y with x feet and y inches

# 3. entries reported in centimeters

# note on escaping functions with \
#   a \ can be used to escape the function of quotations in order to write 5'10" like so:
s <- '5\'10"'
# cat() lets us see what the string actually looks like outside of R
cat(s)


# defining strings as regular expressions (regex; patterns in the strings)



# PLAN OF ATTACK: ####
# convert entries fitting the first two patterns into a standardized one
# extract feet and inches and convert to inches
# define a procedure for identifying entries in cm
# check to see if any un-fixed entries remain




