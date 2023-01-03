# quanteda sentiment analysis

# install.packages("quanteda")
# 
# install.packages("devtools")
# devtools::install_github("quanteda/quanteda.sentiment") 

library(quanteda)
library(quanteda.sentiment)

# examples of dictionaries
?data_dictionary_NRC # descriptions in help files
dfm(tokens(data_dictionary_geninqposneg))

# simple sentiment analysis
inaugTokens <- tokens(data_corpus_inaugural, 
                      remove_punct = TRUE,
                      remove_symbols = TRUE,
                      remove_numbers = TRUE)

dfm(tokens_lookup(inaugTokens, dictionary = data_dictionary_NRC))
dfm(tokens_lookup(inaugTokens, dictionary = data_dictionary_geninqposneg))

# need to read https://rdrr.io/github/quanteda/quanteda.sentiment/f/vignettes/sentiment_analysis.Rmd