library(tidyverse)
library(openxlsx)

df = read.csv("./ca_measurements_python.csv")

df.new = gather(data = df, key = "Region", value = "NDiameter", c(2:length(df)))


write.xlsx(df.new, "./ca_measurements_long.xlsx")

p = ggplot(df.new, aes(x=case, y = NDiameter, color = factor(Region))) 

p + geom_col() + ggsave("./column_graph.png") 
