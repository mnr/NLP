# stemming with tokens_wordstem( )

library(quanteda)

# create a tokens object
scTokens <- tokens(corpus(data_corpus_inaugural), 
                   remove_numbers = TRUE,
                   remove_punct = TRUE,
                   remove_symbols = TRUE)

scTokens <- tokens_remove(scTokens, pattern = stopwords("english"))

# stem the tokens
tokens_wordstem(scTokens)
