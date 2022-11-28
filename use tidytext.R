library(tidytext)
library(readtext)
library(dplyr, quietly=TRUE)

noNumbers <- readtext("./Muhammad_Iqbal/SecretsSelf.txt") %>%
  unnest_tokens(word, text) %>%
  filter(is.na(as.numeric(word)))

noNumbers
