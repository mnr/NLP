# term frequency with bind_tf_idf( )

termFreq <- readtext("WonderfulWizardofOz.txt") %>%
  unnest_tokens(word, text) %>%
  count(word)

bind_tf_idf( )
