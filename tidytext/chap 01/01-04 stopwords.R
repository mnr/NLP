# cleaning tokens
# remove punctuation, whitespace, numbers, stopwords

library(tidyverse)
library(tidytext)
library(readtext)

termFreq <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  count(word)

# punctuation and whitespace are removed by default
# unnest_tokens "to_lower = TRUE" is a default
# unnest_tokens:token = words has optional strip_punct = true
# how to include punctuation and whitespace

termFreq <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text,  
                strip_punct = FALSE,
                to_lower = FALSE) %>%
  count(word)

# removing numbers
termFreq <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  # filter(!grepl('[0-9]', word)) %>%
  filter(!grepl('[[:digit:]]', word)) %>%
  count(word)

# remove stopwords
# first, what are stopwords?
stopwords::stopwords_getsources()
# stop_words is a collection of stopwords from all lexicons
stop_words

termFreq <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  # anti_join(stop_words, by = "word") %>%
  # anti_join(get_stopwords(source = "snowball"), by = "word") %>%
  anti_join(get_stopwords(source = "nltk"), by = "word") %>%
  count(word)

# all filters
termFreq <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  filter(!grepl('[[:digit:]]', word)) %>%
  anti_join(stop_words, by = "word") %>%
  count(word)
