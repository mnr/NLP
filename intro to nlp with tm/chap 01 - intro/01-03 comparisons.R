# compare tm, quanteda, tidytext

# Note: you'll need to change the working directory
# for example...
# setwd("Exercise Files/poetry")

# Compare different NLP tools
# task: create a corpus without numbers

# Base R with tm ---------
library(tm)

newCorpus <- Corpus(DirSource(pattern = "./*txt"))

noNumberCorpus <- tm_map(newCorpus, removeNumbers)

newCorpus[[1]] # with numbers
noNumberCorpus[[1]] # without numbers

# Quanteda --------

# install.packages("quanteda")
# install.packages("readtext")

library(quanteda)
library(readtext)

textDF <- readtext("*.txt", docvarsfrom = "filenames")

quantCorpus <- corpus(textDF)

noNumQuantCorpus <- tokens(quantCorpus, remove_numbers = TRUE)

noNumQuantCorpus[[1]]

# tidytext ----------
library(tidyverse)tidytext
library(tidytext)

allPoetry <- list.files( pattern = "*txt")

newTidyNLP <-  map_df(allPoetry, ~ data_frame(txt = read_file(.x))) %>%
  unnest_tokens(word, txt) %>%
  filter(is.na(as.numeric(word)))

print(newTidyNLP, n=100)
