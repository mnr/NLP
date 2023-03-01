# DTM sparse terms

library(tm)

# Pull in a sample corpus
poetCorpus <- readRDS("poetCorpus.RDS")

DTmatrix <- DocumentTermMatrix(poetCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE)
)

inspect(DTmatrix)

# remove sparse (rarely used) terms --------
removeSparseTerms(DTmatrix, sparse = .2) # fewer terms
removeSparseTerms(DTmatrix, sparse = .8) # more terms

