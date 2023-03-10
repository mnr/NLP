# compare tm, quanteda, tidytext

# Note: you'll need to change the working directory
# for example...
# setwd("Exercise Files")

# Compare different NLP tools
# task: what are most popular words used in poetry?

# tidytext ----------
library(tidyverse)
library(tidytext)

list.files(path = "poetry", pattern = "*txt",
                        full.names = TRUE) %>%
  map_df( ~ data_frame(txt = read_file(.x))) %>%
  unnest_tokens(word, txt) %>%
  filter(is.na(as.numeric(word))) %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  head(n=10)

# notes:
# unnest_tokens strips punctuation, converts to lowercase

