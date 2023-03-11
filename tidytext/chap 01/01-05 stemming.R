# stemming & lemmatization
# stemming = rules based
# lemmification = dictionary based

library(tidyverse)
library(tidytext)
library(readtext)

# stemming with snowballC --------
library(SnowballC)

stemmed <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  filter(!grepl('[[:digit:]]', word)) %>%
  anti_join(stop_words, by = "word") %>%
  mutate(stem = wordStem(word)) 

# add this...
%>%
  count(stem, sort = TRUE)

# stemming with hunspell --------
library(hunspell)

stemmed <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  filter(!grepl('[[:digit:]]', word)) %>%
  anti_join(stop_words, by = "word") %>%
  mutate(stem = hunspell_stem(word)) %>%
  count(stem, sort = TRUE)

# lemmification
library(textstem)

lemma_dictionary <- readtext("WonderfulWizardofOz.txt") %>%
  make_lemma_dictionary( engine = 'hunspell')

lemmafied <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  mutate(stem = wordStem(word)) %>%
  mutate(Hun_stem = hunspell_stem(word)) %>%
  mutate(lemm = lemmatize_words(word , dictionary = lemma_dictionary)) %>%
  filter(stem != lemm ) %>%
  select(-doc_id)
  
