#####################################
#   Extracting  Data From Websites  #
#             04/30/2020            #
#####################################

# EXTRACTING DATA FROM HTML CODE ####


# within the tidyverse, the rvest package helps to scape data from HTMLs
library(tidyverse)
library(rvest)

# load the url using the read_html argument
url <- paste0("https://en.wikipedia.org/w/index.php?title=",
              "Gun_violence_in_the_United_States_by_state",
              "&direction=prev&oldid=810166167")
h <- read_html(url)

# the code that defines the downloaded webpage can be seen like this:
html_text(h)

# to extract the table from the html code we have to specify which node it is
# a node is anything between the <> </>
tab <- h %>%
  html_nodes("table")
# this extracted the HTML code for the table

# this is the table we are interested in 
tab[[1]]
# however, it is not in a data frame, so it needs to be extracted further

# in order to get this into a data frame we use:
tab <- tab[[1]] %>%
  html_table
# now we have a dataframe that we can work with in R
class(tab)
head(tab)

# however, the column names are still not very helpful, so we can now tidy the data
tab <- tab %>% setNames(c("state", "population", "total", "murder_rate"))
head(tab)

# the next step would be to remove the commas, so the characters could be read as numbers







# ANOTHER APPROACH USING CSS SELECTORS ####

# there may often be occasions where the HTML code for a webpage is so complex, that finding the 
# exact nodes with the data can be impossible. When this is the case, selectorGadgets can be used to
# help ease the process

# JSON
# If the webpage is written using Java Script Object Notation (JSON), it can be written in like this:
library(jsonlite)
citi_bike <- fromJSON("http://citibikenyc.com/stations/json")
# This downloads a list. The first argument tells you when you downloaded it:
citi_bike$executionTime
# and the second is a data table:
citi_bike$stationBeanList %>% as_tibble() 


# 23.5 EXERCISES ####
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)
# extract the table nodes
nodes <- h %>% html_nodes("table")

# now extract the table you want (8th node) from the table nodes
tab <- html_table(nodes[[8]])

# now repeat for the first four nodes
tab1 <- html_table(nodes[[1]], fill = TRUE)
tab2 <- html_table(nodes[[2]])
tab3 <- html_table(nodes[[3]])
tab4 <- html_table(nodes[[4]])


# now make all the tables in nodes a table using lapply
tabs <- lapply(nodes, html_table)

# creat two new tables from this new list of tables to see how they join together
tab_1 <- tabs[[10]] %>% setNames(c("no.", "team", "payroll", "average"))
tab_2 <- tabs[[19]] %>% setNames(c( "team", "payroll", "average"))

# now join them with a full join
full_join(tab_1, tab_2)

# now join with anti_join to see the difference
anti_join(tab_1, tab_2)

# fix the problem of yankees being written as both N.Y. and NY
tab_1 <- tab_1 %>%
  mutate(team = ifelse(team == "N.Y. Yankees", "NY Yankees", team))

tab_1 %>%
  full_join(tab_2) %>%
  filter(team == c("*Oak*", "*Yank*")) 



