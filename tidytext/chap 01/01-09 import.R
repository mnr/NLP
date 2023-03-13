# imports from other NLP packages
library(tm)
library(tidyverse)
library(tidytext)

# can't use Corpus or SimpleCorpus
tmCorpus <- VCorpus(DirSource(pattern = "*.txt"))

summary(tmCorpus)

tt_import_from_tm <- tmCorpus %>%
  tidy() %>%
  unnest_tokens(word, text)
  