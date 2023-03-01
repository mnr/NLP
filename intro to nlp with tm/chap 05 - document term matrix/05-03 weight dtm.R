# weighting a DTM
library(tm)

# Pull in a sample corpus
poetCorpus <- readRDS("poetCorpus.RDS")

# create a dtm
DTmatrix <- DocumentTermMatrix(poetCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE)
                               )

inspect(DTmatrix)

# weighting options
# weightTf: term frequency. default. Does nothing since dtm is already sorted by term frequency
# weightTfIdf: term frequency - inverse document frequency
# weightBin: logical. Does a term appear in a document

# with tf-idf weighting
DTmatrix <- DocumentTermMatrix(poetCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE,
                                              weighting = function(x)
                                                weightTfIdf(x, normalize = TRUE))
)

inspect(DTmatrix)


# weightSMART: 60 combinations of tf, df, and normalization  
?weightSMART

DTmatrix <- DocumentTermMatrix(poetCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE,
                                              weighting = function(x)
                                                weightSMART(x, 
                                                            spec = "atb",
                                                            control = list(alpha = 3)))
)

inspect(DTmatrix)
