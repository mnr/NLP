# quanteda + tidyverse

# implement dplyr verbs for quanteda docvars, corpus, dfm
# arrange, distinct, filter, mutate, transmute, 
#     pull, relocate, rename, select, slice

# if necessary
# install.packages("devtools")
# devtools::install_github("quanteda/quanteda.tidy")

library(quanteda)
library(quanteda.tidy)

# examples..
data_corpus_inaugural %>% 
  filter(Year > 1950) %>%
  arrange(Party) %>%
  pull(President)

newSampCorp <- data_corpus_inaugural %>%
  distinct(President) %>%
  mutate(firstWords = substr(text, start = 0, stop = 20))

newSampCorp$firstWords
