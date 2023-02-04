# what is a DTM?
library(tm)

# Pull in a sample corpus
newVCorpus <- readRDS("newVCorpus.RDS")

# create a document term matrix
DTmatrix <- DocumentTermMatrix(newVCorpus)

# create a dtm
DTmatrix <- DocumentTermMatrix(newVCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE)
                               )

inspect(DTmatrix)

# with weighting
DTmatrix <- DocumentTermMatrix(newVCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE,
                                              weighting = function(x)
                                                weightTfIdf(x, normalize = TRUE))
)

inspect(DTmatrix)

# weighting options
# weightTf: term frequency. default. Does nothing since dtm is already sorted by term frequency
# weightTfIdf: inverse document frequency
# weightBin: logical - but?
# weightSmart:
