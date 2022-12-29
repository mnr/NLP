# quanteda + tidyverse

# implement dplyr verbs for quanteda docvars, corpus, dfm
# arrange, distinct, filter, mutate, transmute, 
#     pull, relocate, rename, select, slice

# if necessary
# install.packages("devtools")
# devtools::install_github("quanteda/quanteda.tidy")

library(quanteda)
library(quanteda.tidy)

sampleCorpus <- corpus(data_corpus_inaugural)

# examples..
sampleCorpus %>% 
  filter(Year > 1950) %>%
  arrange(Party) %>%
  pull(President)

newSampCorp <- sampleCorpus %>%
  distinct(President) %>%
  mutate(firstWords = substr(text, start = 0, stop = 20))
newSampCorp$firstWords
