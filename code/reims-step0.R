# import reims data
library(dplyr)
library(tidyverse)
library(readr)
reims <- read_csv("data/reims.csv")
View(reims)

# inspect data
head(reims)
tail(reims)

# create dichotomous indicators
reims %>% 
  mutate_at(c(2:54), funs(recode(., `1`=0, `2`=0, `3`=1, `4`=1, .default = NaN))) -> reims.dummy
reims.dummy
