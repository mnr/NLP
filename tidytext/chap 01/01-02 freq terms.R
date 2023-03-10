# tidytext most frequent terms

# Note: you'll need to change the working directory
# setwd("Exercise Files")

# Use tidytext to find most frequent terms in Wizard of Oz

library(tidyverse)
library(tidytext)
library(readtext)

readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  filter(is.na(as.numeric(word))) %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  print(n=10)

# notes:
# unnest_tokens strips punctuation, converts to lowercase

