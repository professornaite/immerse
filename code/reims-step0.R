# import reims data
library(dplyr)
library(tidyverse)
library(readr)
reims <- read_csv("data/reims.csv")
View(reims)

# inspect data
head(reims)
tail(reims)

table(reims$sex)
table(reims$dislikemathclass)

# create dichotomous indicators
# four point likert scale: 
# not at all true, a little true, fairly true, very true
reims %>% 
  mutate_at(c(2:54), funs(recode(., `1`=0, `2`=0, `3`=1, `4`=1, .default = NaN))) -> reims.dummy
reims.dummy

# reverse code dislikemathclass
reims.dummy$dislikemathclass <- ifelse(reims.dummy$dislikemathclass == 1, 1, 0)
table(reims.dummy$dislikemathclass)

# reverse code boys do better
reims.dummy$boysbetter <- ifelse(reims.dummy$boysbetter == 1, 1, 0)
table(reims.dummy$boysbetter)
reims.dummy$female <- ifelse(reims.dummy$sex == 2, 0, 1)
table(reims.dummy$female)

# label of factors
# math identity: mathperson1 mathperson2 mathperson3 mathperson4 dislikemathclass pursuestem 
# racial ethnic identity: learnrace knowrace proudrace unclearrace dontknowrace belongrace understandrace talkrace priderace practicerace strongrace feelrace
# caring relations at school: adultcares adultnotices adultlistens
# high expectations at school: adultgood adultbest adultsuccess
# meaningful participation in school: interestingacts decidethings makediff
# math self efficacy: mathnoadv mathbad mathpuzzle mathboring mathgrades mathimpt
# racial belonging: closerace belongrace raceidentity raceeffects raceproud racehappy

# subset the dichotomous data
test.df <- reims.dummy %>% 
  select(c(1:54), age, female, race) %>% 
  relocate(groupflag, age, female, race) %>% 
  drop_na()
test.df 

table(test.df$dislikemathclass)
table(test.df$boysbetter)

# check for missing data
test.df %>% 
  count() # count observations
sapply(test.df, function(x) sum(is.na(x)))

write_csv(test.df, "/Users/nathanalexander/Dropbox/Projects/immerse/data/reims_clean.csv")
