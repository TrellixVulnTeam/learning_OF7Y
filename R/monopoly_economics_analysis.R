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

p = ggplot(monopoly, aes(x = Family, y = Frequency, fill = Family)) +
  geom_violin(trim = FALSE)

pbox = ggplot(monopoly, aes(x = Family, y = Frequency, fill = Family)) +
  geom_boxplot()

p + stat_summary(fun.y = mean, geom = "point", shape = 2, size = 1)

pbox + scale_fill_manual(values = pal) + ylim(0.02,0.04) + theme_classic()



  

