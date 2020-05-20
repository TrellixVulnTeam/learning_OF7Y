library(tidyverse)
library(rvest)
library(jsonlite)

# load in the data from the url
url <- paste0('https://www.footballdb.com/fantasy-football/index.html?pos=QB%2CRB%2CWR%2CTE&yr=2019&wk=all&rules=1')
html <- read_html(url)

# find the nodes that correspond to tables in the html file
nodes <- html %>%
  html_nodes('table')

# create the tables from the nodes
tabs <- lapply(nodes, html_table)
tabs[1]

# extract table one from the other tables
fantasy <- tabs[[1]]

fantasy