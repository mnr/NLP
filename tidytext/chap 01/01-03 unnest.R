# tokenizing with tidytext::unnest_tokens

# tidytext uses "unnest..." for tokenizing

library(tidyverse)
library(tidytext)
library(readtext)

WizOzTibble <- readtext("WonderfulWizardofOz.txt") 
  
WizOzTibble %>% unnest_tokens(token = "words",
                              input = text,
                              output = "wizWords")

# tokens don't have to be words

WizOzTibble %>% unnest_tokens(token = "paragraphs",
                              input = text,
                              output = "wizWords")
WizOzTibble %>% unnest_paragraphs(input = text,
                                  output = "wizWords")
WizOzTibble %>% unnest_sentences(input = text,
                                 output = "wizWords")
WizOzTibble %>% unnest_characters(input = text,
                                  output = "wizWords")
WizOzTibble %>% unnest_lines(input = text,
                             output = "wizWords")

# ngrams are combinations of words
WizOzTibble %>% unnest_ngrams(input = text,
                              output = "wizWords",
                              n = 3)
WizOzTibble %>%
  unnest_character_shingles(input = text,
                            output = "wizWords",
                            n = 4)
WizOzTibble %>% unnest_skip_ngrams(input = text,
                                   output = "wizWords",
                                   n = 3,
                                   k = 2)
# other speciality tokenizers
WizOzTibble %>% unnest_ptb()
WizOzTibble %>% unnest_regex()

