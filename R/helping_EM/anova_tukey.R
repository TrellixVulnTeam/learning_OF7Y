library(tidyverse)
library(modelr)

df = read_csv("./prosub_ca1_sub.csv")

nas = which(is.na(df))

mod1 = aov(width ~ region, data = df)
summary(mod1)

tuk = TukeyHSD(mod1)

write.csv(tuk, "../Desktop/tukey_results.csv", row.names = FALSE)


