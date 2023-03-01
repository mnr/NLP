# what is a DTM?
library(tm)

# Pull in a sample corpus
poetCorpus <- readRDS("poetCorpus.RDS")

# create a document term matrix
DTmatrix <- DocumentTermMatrix(poetCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE))
# what does the DTM look like?
inspect(DTmatrix)

# create a term document matrix
TDmatrix <- TermDocumentMatrix(poetCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE))
# what does the TDM look like?
inspect(TDmatrix)
