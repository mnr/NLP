# quanteda sentiment analysis
# using polarity and valence

# polarity & valence are attached to quanteda dictionaries
# polarity is attached to dictionary columns (categories)
# valence is attached to dictionary rows (words)

# install.packages("quanteda")
# 
# install.packages("devtools")
# devtools::install_github("quanteda/quanteda.sentiment") 

library(quanteda)
library(quanteda.sentiment)

# examples of dictionaries
?data_dictionary_NRC # descriptions in help files
dd_geninq <- data_dictionary_geninqposneg
tokens(dd_geninq) # What does this dictionary look like?

# add polarity to the example dictionary
polarity(dd_geninq) <- list(pos = "positive", neg = "negative")

# create trimmed corpus
scTokens <- tokens(data_corpus_inaugural, 
                   remove_numbers = TRUE,
                   remove_punct = TRUE,
                   remove_symbols = TRUE)

scTokens <- tokens_remove(scTokens, pattern = stopwords(source = "smart"))
scTokens

# Start Demonstration Here --------------
# find polarity of documents in a corpus
textstat_polarity(scTokens, dd_geninq)

# Now jump to the top to understand how we got here ----------

# sort from negative to positive sentiment
tmpsent <- textstat_polarity(data_corpus_inaugural, dd_geninq)
tmpsent[order(tmpsent$sentiment),]

# the same, but using data_dictionary_NRC
dd_NRC <- data_dictionary_NRC
polarity(dd_NRC) # what are current definitions of positive and negative
polarity(dd_NRC) <- list(pos = c("positive", "joy", "trust"),
                         neg = c("negative", "anger", "disgust", "fear"))
tmpsent <- textstat_polarity(data_corpus_inaugural, 
                             dictionary = dd_NRC)
tmpsent[order(tmpsent$sentiment),]

# same but with different algorithm to calculate polarity
tmpsent <- textstat_polarity(x = data_corpus_inaugural, 
                             dictionary = dd_NRC,
                             fun = sent_abspropdiff
                             )
tmpsent[order(tmpsent$sentiment),]

# and...textstat_valence is similar, but with values on each keyword (row)
