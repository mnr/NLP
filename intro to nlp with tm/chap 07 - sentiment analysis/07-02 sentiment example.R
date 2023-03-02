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
sum(get_sentiment(smallText, method = "nrc") )
get_sentiment(smallText, method = "nrc")

# I'd rather use the means of all dictionary values
rowMeans(get_nrc_sentiment(smallText))

# a more sophisticated example --------
poetCorpus <- readRDS("poetCorpus.RDS")
library(tm)

# for example ------------
get_nrc_sentiment(poetCorpus$content[1])

# use tm_map to apply get_nrc_sentiment to all documents in corpus
poet_tmp <- tm_map(poetCorpus, FUN = get_nrc_sentiment)
# move content to a data.frame
poetDF <- poet_tmp$content
# add titles to each row in the data.frame ------------
poetDF$titles <- meta(poet_tmp, type = "indexed", tag = "title")

# now - which is the angriest?
