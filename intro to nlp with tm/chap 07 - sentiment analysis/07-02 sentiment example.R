# # Sentiment Analysis - a simple example

# syuzhet is from NLP group at Stanford University
# https://cran.r-project.org/package=syuzhet
# install.packages("syuzhet")
library(syuzhet)

# create a small collection of words -> tokens
smallText <- get_tokens(c("hate","love","apathy"))

# this looks up the nrc dictionary sentiment values for each word
get_nrc_sentiment(smallText) 

# is smallText positive or negative?
get_sentiment(smallText, method = "nrc") 

# I'd rather use the means of all dictionary values
rowMeans(get_nrc_sentiment(smallText))
