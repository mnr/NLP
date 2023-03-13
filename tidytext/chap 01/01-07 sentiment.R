# sentiment analysis

library(tidyverse)
library(tidytext)
library(readtext)

# sentiments is a dictionary of words ranked positive/negative
sentiments
unique(sentiments$sentiment)

# select other sentiment dictionaries. afinn, nrc, bing, loughran
install.packages("textdata")
get_sentiments(lexicon = "nrc")

# use inner join to attach sentiment values
sentimentsOZ <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  filter(!grepl('[[:digit:]]', word)) %>%
  anti_join(stop_words, by = "word") %>%
  inner_join(sentiments)

# or...with nrc
sentimentsOZ <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  filter(!grepl('[[:digit:]]', word)) %>%
  anti_join(stop_words, by = "word") %>%
  inner_join(get_sentiments(lexicon = "nrc"))

# add this for count...
%>%
  count(sentiment, sort = TRUE)
