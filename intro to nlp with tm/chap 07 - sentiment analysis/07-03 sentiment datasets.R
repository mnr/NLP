# sentiment datasets

# install.packages("quanteda")
# install.packages("devtools")
# devtools::install_github("quanteda/quanteda.sentiment") 

library(quanteda)
library(quanteda.sentiment)

# list the different dictionaries
# AFINN - valence, one list
data_dictionary_AFINN
textstat_valence(x = "anger", dictionary = data_dictionary_AFINN)

# ANEW - valence, three lists
data_dictionary_ANEW
names(data_dictionary_ANEW)
textstat_valence(x = "anger", 
                 dictionary = data_dictionary_ANEW["pleasure"])
textstat_valence(x = "anger", 
                 dictionary = data_dictionary_ANEW["arousal"])
textstat_valence(x = "anger", 
                 dictionary = data_dictionary_ANEW["dominance"])

# NRC - polarity
data_dictionary_NRC
names(data_dictionary_NRC)
# what is the polarity?
textstat_polarity(x = "anger", 
                 dictionary = data_dictionary_NRC)
# where is "anger" found?
tokens_lookup(tokens("anger"), 
              dictionary = data_dictionary_NRC)

# browsing other dictionaries
library(syuzhet)
smallText <- get_tokens(c("hate","love","apathy"))

get_nrc_sentiment(smallText)
head(get_sentiment_dictionary(dictionary = "nrc"))
tail(get_sentiment_dictionary(dictionary = "nrc"))
head(get_sentiment_dictionary(dictionary = "bing"))
head(get_sentiment_dictionary(dictionary = "afinn"))

