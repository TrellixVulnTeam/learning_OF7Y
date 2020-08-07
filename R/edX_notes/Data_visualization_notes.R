# libs
library(tidyverse)
library(dslabs)

# Understanding distributions ####

# A useful function is the pnorm, which tells the probability of a 
# randomly selected score being lower (think quantiles or percentiles) than a predicted number
data(heights)
male <- heights %>%
  filter(sex == "Male")

# the one minus gives us the probability of someone being higher than 70.5 in. (5.9)
1 - pnorm(70.5, mean = mean(male$height), sd = sd(male$height))
