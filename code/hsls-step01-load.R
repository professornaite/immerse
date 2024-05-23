# load HSLS data for training

library(readr)
df <- read_csv("data/hsls_09_school_v1_0.csv")
df
head(df)
tail(df)
str(df)
View(df)