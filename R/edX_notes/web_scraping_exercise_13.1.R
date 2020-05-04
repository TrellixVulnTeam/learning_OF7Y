library(tidyverse)
library(rvest)
library(jsonlite)



url <- paste0("https://m.imdb.com/chart/bestpicture/")
movies <- read_html(url)

# using SelectorGadget, the titles can be read like this:
movieTitles <- movies %>% 
  html_nodes(".best-picture-item-title") %>%
  html_text() %>%
  as.data.frame() %>%
  setNames("movie_title")

# figure out how to separate the title from the year
movieTitles %>% 
  separate(movie_title, into = c("title", "year"), sep = "*(")


