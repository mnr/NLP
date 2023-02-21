# compare tm, quanteda, tidytext

# Note: you'll need to change the working directory
# for example...
# setwd("where is Muhammad_Iqbal?")

# Base R with tm ---------
library(tm)

newSimpleCorpus <-
  SimpleCorpus(DirSource(directory = "Muhammad_Iqbal",
                         pattern = "./*txt"))

newSimpleCorpus[[2]] <- removeNumbers(newSimpleCorpus[[2]])

summary(newSimpleCorpus)

# Quanteda --------

# install.packages("quanteda")
# install.packages("readtext")

library(quanteda)
library(readtext)

textDF <- readtext("./Muhammad_Iqbal/*.txt",
                   docvarsfrom = "filenames")

quantCorpus <- corpus(textDF)

tokenQuantCorpus <- tokens(quantCorpus)
noNumQuantCorpus <- tokens(quantCorpus, remove_numbers = TRUE)

summary(tokenQuantCorpus)
summary(noNumQuantCorpus)

# tidytext ----------
library(tidytext)
library(dplyr)

newTidyNLP <- list.files("Muhammad_Iqbal", pattern = "*txt")[1] %>%
  readLines() 

%>%
  data.frame() %>%
  rename_with(.cols = 1, ~ "theText") %>%
  unnest_tokens(eachWord, theText) %>%
  filter(is.na(as.numeric(eachWord)))

View(newTidyNLP)