# parts of speech

parts_of_speech
unique(parts_of_speech$pos)

POS_OZ <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  filter(!grepl('[[:digit:]]', word)) %>%
  anti_join(stop_words, by = "word") %>%
  inner_join(parts_of_speech)
