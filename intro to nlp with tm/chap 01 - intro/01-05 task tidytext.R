# compare tm, quanteda, tidytext

# Note: you'll need to change the working directory
# for example...
# setwd("Exercise Files/poetry")

# Compare different NLP tools
# task: what are most popular words used in poetry?

# tidytext ----------
library(tidyverse)
library(tidytext)


allPoetry <- list.files( pattern = "*txt")

poetTidy <-  map_df(allPoetry, ~ data_frame(txt = read_file(.x))) %>%
  unnest_tokens(word, txt) %>%
  filter(is.na(as.numeric(word))) %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE)

print(poetTidy, n=10)

# notes:
# unnest_tokens strips punctuation, converts to lowercase

