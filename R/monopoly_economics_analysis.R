library(tidyverse)
library(modelr)
library(readxl)

# Read in the dataset ####
monopoly = read_xlsx("./Monopoly.xlsx")
monopoly$Family = as.factor(monopoly$Family)

# colors
pal = c("#f5f2a9" 
           , "#54080a" 
           , "#120994" 
           , "#099409" 
           , "#96d0eb" 
           , "#d91196" 
           , "#ff9900"
           , "#6a0396"
           , "#7d4b01" 
           , "#bd0202" 
           , "#26521d"  
           , "#1d5247" 
           , "#edeb4e")

# Familiarize yourself with the data 
monopoly %>%
  group_by(Family) %>%
  summarise(Freq = mean(Frequency))

# Make a box plot about frequency and family ####
pbox = ggplot(monopoly, aes(x = Family, y = Frequency, fill = Family)) +
  geom_boxplot()

pbox + scale_fill_manual(values = pal) + ylim(0.02,0.04) + theme_classic()

# make a scatter plot for frequency ~ price ####
pointPlot = ggplot(monopoly, aes(x = Price, y = Frequency, color = Family)) +
  geom_point()

pointPlot + 
  scale_color_manual(values = pal) + 
  labs(title = "Frequency ~ Price of Square") +
  theme_bw()

# make a table with average prices based on frequency
table = monopoly %>%
  group_by(Family) %>%
  summarize(avgVisitPercent = (mean(Frequency) * 100),
            avgPrice = mean(Price),
            avgRent = mean(`Property Rent`), 
            avgRentWithSet = mean(`Rent with Set`),
            avgRentHotel = mean(Hotel), 
            avgImproveCost = mean(`Improvement Cost`),
            avgRailRoad = mean(`Railroad Rent`))

write.csv(table, "./Averages_per_monopoly_square.csv")
