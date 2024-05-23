# load HSLS data for training

library(readr)
hsls_w1 <- read_csv("data/hsls_09_school_v1_0.csv")
hsls_w1
head(hsls_w1)
tail(hsls_w1)
str(hsls_w1)
View(hsls_w1)