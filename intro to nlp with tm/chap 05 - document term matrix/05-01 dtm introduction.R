# what is a DTM?
library(tm)

# Pull in a sample corpus
newVCorpus <- readRDS("newVCorpus.RDS")

# create a document term matrix
DTmatrix <- DocumentTermMatrix(newVCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE))
# what does the DTM look like?
inspect(DTmatrix)

# create a term document matrix
TDmatrix <- TermDocumentMatrix(newVCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE))
# what does the DTM look like?
inspect(TDmatrix)
