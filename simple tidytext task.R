library(tidytext)
library(dplyr)

newTidyNLP <- data.frame(readLines("./Muhammad_Iqbal/SecretsSelf.txt")) %>%
  rename_with(.cols = 1, ~"theText") %>%
  unnest_tokens(eachWord, theText) %>%
  filter(is.na(as.numeric(eachWord)))
