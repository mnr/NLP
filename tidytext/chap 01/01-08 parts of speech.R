# parts of speech

library(tidyverse)
library(tidytext)
library(readtext)

parts_of_speech
unique(parts_of_speech$pos)

POS_OZ <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  filter(!grepl('[[:digit:]]', word)) %>%
  anti_join(stop_words, by = "word") %>%
  inner_join(parts_of_speech)

# what to do with this information? -------
POS_OZ <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text, to_lower = FALSE) %>%
  inner_join(parts_of_speech) 

getAWord <- function(typeOfWord) {
  if (!(tolower(typeOfWord) %in% tolower(unique(POS_OZ$pos)))) {
    return("WaT")
  } else {
    POS_OZ[POS_OZ$pos %in% typeOfWord, "word"] %>%
      sample(size = 1) %>%
      return()
  }
}

getAWord(typeOfWord = "Noun")

print(paste(getAWord(typeOfWord = "Pronoun"),
            getAWord(typeOfWord = "Noun"),
            getAWord(typeOfWord = "Adverb"),
            getAWord(typeOfWord = "Verb (usu participle)")))

