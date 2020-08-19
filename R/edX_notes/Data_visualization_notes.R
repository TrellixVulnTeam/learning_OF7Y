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


# summarizing with dplyer ####
# the summarize functions allows for quick descriptive stats analysis of data sets
s = heights %>% filter(sex == "Male") %>%
  summarize(average = mean(height), standard_deviation = sd(height))

# this returns a data frame. However, sometimes it can be useful to have a vector instead of a df.
# To have dplyer functions return vectors, try this:
us_murder_rate <- murders %>%
  summarize(rate = sum(total) / sum(population * 100000)) %>%
  .$rate

# moving on with the summarize function. We can group the data before summarizing to make it more
# observable:
heights %>%
  group_by(sex) %>%
  summarize(average = mean(height), standard_deviation = sd(height))

murders <- murders %>%
  mutate(murder_rate = total/population * 100000)

murders %>%
  group_by(region) %>%
  summarize(median_rate = median(murder_rate))


# gapminder case study ####
data("gapminder")
head(gapminder)

summary(gapminder)
# which country had the highest child mortality rate?
gapminder %>%
  group_by(country) %>%
  summarize(infant_mortality = mean(infant_mortality, na.rm = TRUE))

# facet wrapping
ggplot(gapminder, aes(fertility, life_expectancy, color = continent)) +
  geom_point() + facet_wrap(~gapminder$year)

# however, this has too many variables to be easily interpreted
years <- c(1962, 1980, 1990, 2000, 2012)
continents <- c("Europe", "Asia")
gapminder %>%
  filter(year %in% years & continent %in% continents) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_wrap(~year)

# another useful facet techniques is facet_grid:
filter(gapminder, year %in% c(1962, 2012)) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_grid(continent ~ year)

# however, this has broken our graph into two variables, continent and year.
# columns - year
# rows - continent
# to fix this, we can use the dot:
filter(gapminder, year %in% c(1962, 2012)) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_grid(. ~ year)

# timeseries ####

# the following plot will allow us to look at the fertility rate over time by country
gapminder %>% 
  ggplot(aes(x = year, y = fertility)) +
  geom_line() + facet_wrap(~country)

# obviously this plot isn't a good visual aid for presentation, but it can be very useful in helping
# the analyst quickly pick out trends between countries.

# if we want to follow this trend for a specific country, we can filter for it.
gapminder %>%
  filter(country == "United States") %>%
  ggplot(aes(year, fertility)) +
  geom_line()

# if we want more than one country:
countries <- c("South Korea", "Germany")
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility)) +
  geom_line()

# this however, is not what we want. This line goes through the points of each graph. 
# if we want two seperate lines, we have to group our data in the aesthetics
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility, group = country)) +
  geom_line()

# if we want to add in labels to this plot we can do this:
labels <- data.frame(country = countries, x = c(1975, 1965), y = c(60, 72))
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, life_expectancy, col = country)) +
  geom_line() +
  geom_text(data = labels, aes(x, y, label = country), size = 5) +
  theme(legend.position = "none")

# Data Transformations ####

# The gapminder data table includes a column with the countries’ gross domestic product (GDP). 
# GDP measures the market value of goods and services produced by a country in a year. 
# The GDP per person is often used as a rough summary of a country’s wealth. Here we divide 
# this quantity by 365 to obtain the more interpretable measure dollars per day. 
# Using current US dollars as a unit, a person surviving on an income of less than $2 a day is 
# defined to be living in absolute poverty. We add this variable to the data table:

gapminder <- gapminder %>%  mutate(dollars_per_day = gdp/population/365) # dividing gdp gives dollars per year per person. Dividing by 365 gives dollars per day

# here is a histogram of per day incomes
past_year <- 1970
gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>% # make sure to filter out any NAs
  ggplot(aes(dollars_per_day)) + 
  geom_histogram(binwidth = 1, color = "black")


# It might be more informative to quickly be able to see how many countries have average daily 
# incomes of about $1 (extremely poor), $2 (very poor), $4 (poor), $8 (middle), $16 (well off), 
# $32 (rich), $64 (very rich) per day. These changes are multiplicative and log transformations 
# convert multiplicative changes into additive ones: when using base 2, a doubling of a value turns 
# into an increase by 1.
gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(log2(dollars_per_day))) + 
  geom_histogram(binwidth = 1, color = "black")
  
# In the dollars per day example, we used base 2 instead of base 10 because the resulting range is easier to interpret. The range of the values being plotted is 0.327, 48.885.

# In base 10, this turns into a range that includes very few integers: just 0 and 1. 
# With base two, our range includes -2, -1, 0, 1, 2, 3, 4, and 5. It is easier to compute 2^x
# and 10^x when x is an integer and between -10 and 10, so we prefer to have smaller integers in 
# the scale. Another consequence of a limited range is that choosing the binwidth is more 
# challenging. With log base 2, we know that a binwidth of 1 will translate to a bin with range x
# to 2x

# transform the values or the scales? ####

# the previous plot used logged values. This is what scaled logs looks like:
gapminder %>% 
  filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) + 
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2")

# scaled logs allow us to quickly see the value on the x axis, rather than reading 5 log 2 dollars per day

  
  
