co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

co2_tidy = gather(co2_wide, key = month, value = co2, -year)


co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = as.factor(year))) + geom_line()


library(dslabs)
data(admissions)
dat <- admissions %>% select(-applicants)
head(dat)

tmp <- gather(admissions, key, value, admitted:applicants)
tmp


# concept quiz
install.packages("Lahman")
library(Lahman)

top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()

Master %>% as_tibble()

# combine the data sets

top_names <- top %>%  left_join(Master) %>%
  select(playerID, nameFirst, nameLast, HR)

# how to add this to the last table through the same pipe
Salaries %>% filter(yearID == "2016") %>% right_join(top_names)


# Inspect AwardsPlayer table and filter for year 2016
awards2016 <- AwardsPlayers %>% filter(yearID == 2016) 

top_new <- Batting %>%
  filter(yearID == 2016) %>%
  arrange(desc(HR))

awardstotal = awards2016 %>%
  right_join(top_new)
nas = is.na(awardstotal$awardID)
which(nas == "FALSE")
