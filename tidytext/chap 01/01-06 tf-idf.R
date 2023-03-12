# term frequency with bind_tf_idf( )
# a method to find the most likely document...
# when searching for a word...

library(tidyverse)
library(tidytext)
library(readtext)

# standard term frequency ------------
termFreq <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  filter(!grepl('[[:digit:]]', word)) %>%
  anti_join(stop_words, by = "word") %>%
  count(word, sort = TRUE) 

# add this to calculate total words
# %>%
#  summarize(total = sum(n))

# term frequency * inverse document frequency
# tf Idf
# this fails if there is only one document
# so...idf = log(1/doc count) = 0
# so tf*idf requires > 1 document

tfidf_oz <- list.files(pattern = ".txt") %>%
  readtext() %>%
  unnest_tokens(word, text) %>%
  count(doc_id, word, sort = TRUE) %>%
  bind_tf_idf( term = word, document = doc_id, n = n ) %>%
  arrange(desc(tf_idf))

# tf*idf with ngrams
tfidf_oz <- list.files(pattern = ".txt") %>%
  readtext() %>%
  unnest_tokens(token = "ngrams", n = 6, 
                output = "word",
                input = "text") %>%
  count(doc_id, word, sort = TRUE) %>%
  bind_tf_idf( term = word, document = doc_id, n = n ) %>%
  arrange(desc(tf_idf))


