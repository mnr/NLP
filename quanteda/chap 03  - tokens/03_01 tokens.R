# tokens

library(quanteda)

# retrieve sample corpus
sampleCorpus <- corpus(data_corpus_inaugural)

# what are we working with...
summary(sampleCorpus)
as.character(sampleCorpus[1])

# create tokens
tokens(sampleCorpus[1]) # breaks doc 1 of corups into tokens (words)
as.character(tokens(sampleCorpus[1])) # look at the punctuation!

# remove everything extraneous
as.character(tokens(sampleCorpus[1],
       remove_punct = TRUE,
       remove_symbols = TRUE,
       remove_numbers = TRUE,
       remove_url = TRUE,
       remove_separators = TRUE))

# 
