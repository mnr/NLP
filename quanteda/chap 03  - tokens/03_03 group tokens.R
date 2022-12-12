# tokens_compound(), tokens_ngrams(), tokens_skipgrams()

library(quanteda)

# create a tokens object
scTokens <- tokens(corpus(data_corpus_inaugural), 
                   remove_numbers = TRUE,
                   remove_punct = TRUE,
                   remove_symbols = TRUE)

# replace "friends and fellow" and "constitution requires"
tokens_compound(scTokens,
                pattern = list(c("friends", "and", "fellow"),
                               c("constitution", "requires")),
                concatenator = "_")

# ngrams are tokens in sequence
tokens_ngrams(scTokens,
              n = 2,
              concatenator = "_")

# ngrams can also be done on characters -------
charToken <- as.character(tokens("Twas brillig and the slithey toves", what = c("character")))
char_ngrams(charToken,
              n = 2,
              concatenator = "_")

# skipgrams are ngrams spanning multiple words
tokens_skipgrams(scTokens,
              n = 2,
              skip = 0:4,
              concatenator = "_")
