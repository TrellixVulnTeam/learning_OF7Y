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

# case study - describing students heights ####

# boxplot to quickly visualize the distribution of heights
heights %>% ggplot(aes(x = sex, y = height)) +
  geom_boxplot(aes(fill = heights$sex))

# create a qq plot for males and females
# quantile-quantile plots help us to judge the fit of a normal distrubtion on our data
heights %>% filter(sex == "Male") %>%
  ggplot(aes(sample = scale(height))) + 
  geom_qq() +
  geom_abline()

heights %>% filter(sex == "Female") %>%
  ggplot(aes(sample = scale(height))) + 
  geom_qq() +
  geom_abline()

# exercises ####

male <- heights$height[heights$sex == "Male"]
female <- heights$height[heights$sex == "Female"]

# 1. How many measurements do we have for each? male: 812, female: 238

# 2. Create a five row table showing female_percentiles and male_percentiles with the 
# 10th, 30th, 50th, 70th, & 90th percentiles for each sex. Then create a data frame with 
# these two as columns.

male_percentiles <- quantile(male, seq(.1, .99, .2))
# start at ten percent, increase by twenty percent, until you hit ninety-nine percent
female_percentiles <- quantile(female, seq(.1, .99, .2))

# ggplot ####

data("murders")

p = murders %>% ggplot(aes(x = population/10^6, y = total, label = abb)) 

p + geom_point(size = 3) + # total murders vs population in millions
  geom_text(nudge_x = 1.5, label = murders$abb)  # geom_text allows text to be inserted on these points in the graph according the the abb labels
  
# new mappings can be applied to each layer of the graph without overriding the original ones
p + geom_point(size = 3) +
  geom_text(aes(x = 10, y = 800), label = "Hello There!")

# scales ####
p = p + geom_point(aes(col = murders$region), size = 3) +
  geom_text(nudge_x = 0.05) +
  scale_x_log10() +
  scale_y_log10() + # scale x and y components by the log 10 function (other log scales can be done with continuous)
  xlab("Populations in millions (log scale)") + 
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010") 

# if you want to add a line to the graph to better visualize the linear relationship, you need to
# first determine the slope of that line. Because we want our line to represent the average murder
# rates for the entire country, our slope (y=rx) would be the per million murder rate. We can 
# calculate this like so:
r <- murders %>% 
  summarize(rate = sum(total) /  sum(population) * 10^6) %>%
  pull(rate) # without pulling r, it would stay as a dataframe and would be difficult to work with. However, pulling it allows us to use it as a numeric value.

# to add the line we can type:
p + geom_abline(intercept = log10(r)) # because our graph is in log10, we need to convert the intercept as well

# the line can be edited using the following commands:
p <- p + geom_abline(intercept = log10(r), lty = 2, color = "darkgrey")
# HINT: if you draw the line first (before the points) it will be under them not over them


# the following command allows us to change the name of our legend.
p <- p + scale_color_discrete(name = "Region") 

# there are tons of add-on packages for ggplot
p + ds_theme_set() # this is a built in theme from the dslabs package

library(ggthemes)
# gg themes is a package with a bunch of built in themes
p + theme_economist()

p + theme_fivethirtyeight()

p + theme_excel()

p + theme_wsj()

p + theme_stata()

# the last thing to change in our plot is the location of the text, we can make it cleaner with the 
# ggrepel package:
library(ggrepel)

# let's put it all together now:

r <- murders %>% 
  summarize(rate = sum(total) /  sum(population) * 10^6) %>%
  pull(rate)

murders %>% ggplot(aes(population/10^6, total, label = abb)) +   
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col=region), size = 3) +
  geom_text_repel() + 
  scale_x_log10() +
  scale_y_log10() +
  xlab("Populations in millions (log scale)") + 
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010") + 
  scale_color_discrete(name = "Region") +
  theme_economist()

# quick plots with qplot ####

# if you just want a quick plot for an EDA, and you don't want to type 13 lines of code, try using 
# q plots:

x <- log10(murders$population)
y <- murders$total
qplot(x,y)

# plotting two plots side by side ####
library(gridExtra)

# the gridExtra package allows us to put two plots side by side
p1 <- qplot(x)
p2 <- qplot(x,y)
grid.arrange(p1, p2, ncol = 2)
