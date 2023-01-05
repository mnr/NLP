# quanteda sentiment analysis

# install.packages("quanteda")
# 
# install.packages("devtools")
# devtools::install_github("quanteda/quanteda.sentiment") 

library(quanteda)
library(quanteda.sentiment)

# examples of dictionaries
?data_dictionary_NRC # descriptions in help files
dd_geninq <- data_dictionary_geninqposneg
tokens(dd_geninq) # an example dictionary

# add polarity to the example dictionary
polarity(dd_geninq) <- list(pos = "positive", neg = "negative")

# create trimmed corpus
scTokens <- tokens(data_corpus_inaugural, 
                   remove_numbers = TRUE,
                   remove_punct = TRUE,
                   remove_symbols = TRUE)

scTokens <- tokens_remove(scTokens, pattern = stopwords(source = "smart"))

scTokens

# find polarity of documents in a corpus
textstat_polarity(scTokens, dd_geninq)

# sort from negative to positive sentiment
tmpsent <- textstat_polarity(data_corpus_inaugural, dd_geninq)
tmpsent[order(tmpsent$sentiment),]

# the same, but using data_dictionary_NRC
dd_NRC <- data_dictionary_NRC
polarity(dd_NRC) # what are current definitions of positive and negative
polarity(dd_NRC) <- list(pos = c("positive", "joy", "trust"),
                         neg = c("negative", "anger", "disgust", "fear"))
tmpsent <- textstat_polarity(data_corpus_inaugural, dd_NRC)
tmpsent[order(tmpsent$sentiment),]
