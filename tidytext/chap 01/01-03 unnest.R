# tokenizing with tidytext::unnest_tokens

# tidytext uses "unnest..." for tokenizing

library(tidyverse)
library(tidytext)
library(readtext)

WizOzTibble <- readtext("WonderfulWizardofOz.txt") 
  
WizOzTibble %>% unnest_tokens(token = "words",
                              input = text,
                              output = "wizWords")

# tokens don't have to be words -------

WizOzTibble %>% unnest_tokens(token = "paragraphs",
                              input = text,
                              output = "wizWords")
WizOzTibble %>% unnest_paragraphs(input = text,
                                  output = "wizWords")
# note... the above two statements are the same

WizOzTibble %>% unnest_sentences(input = text,
                                 output = "wizWords")
WizOzTibble %>% unnest_characters(input = text,
                                  output = "wizWords")
WizOzTibble %>% unnest_lines(input = text,
                             output = "wizWords")

# ngrams are combinations of words ---------
WizOzTibble %>% unnest_ngrams(input = text,
                              output = "wizWords",
                              n = 3)

# character shingles are similar to ngrams
WizOzTibble %>%
  unnest_character_shingles(input = text,
                            output = "wizWords",
                            n = 4)
# skip_ngrams are similar to ngrams, but skip words
WizOzTibble %>% unnest_skip_ngrams(input = text,
                                   output = "wizWords",
                                   n = 3,
                                   k = 2)

# other speciality tokenizers --------
# penn treebank handles special cases
# look at line 54 of ptbktokens
ptbktokens <- WizOzTibble %>% unnest_ptb(input = text,
                           output = "wizWords")
# compare to line 52 & 53 of stdtokens
stdtokens <- WizOzTibble %>% unnest_tokens(token = "words",
                              input = text,
                              output = "wizWords")
# use regular expressions ----------
# break on 2+ vowels (ebook) 
WizOzTibble %>% unnest_regex(pattern = "[aeiou]{2,}",
                             input = text,
                             output = "wizWords")

