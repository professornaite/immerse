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
df <- reims.dummy
str(df)
# label of factors
# math identity: mathperson1 mathperson2 mathperson3 mathperson4 dislikemath pursuestem 
# racial ethnic identity: learnrace knowrace proudrace unclearrace dontknowrace belongrace understandrace talkrace priderace practicerace strongrace feelrace
# caring relations at school: adultcares adultnotices adultlistens
# high expectations at school: adultgood adultbest adultsuccess
# meaningful participation in school: interestingacts decidethings makediff
# math self efficacy: mathnoadv mathbad mathpuzzle mathboring mathgrades mathimpt
# racial belonging: closerace belongrace raceidentity raceeffects raceproud racehappy

# subset the dichotomous data
test.df <- df %>% 
  select(c(1:54), age, sex, race) %>% 
  relocate(groupflag, age, sex, race)
test.df
