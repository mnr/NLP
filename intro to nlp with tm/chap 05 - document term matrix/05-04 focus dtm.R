# focusing a DTM

library(tm)

# Pull in a sample corpus
poetCorpus <- readRDS("poetCorpus.RDS")

DTmatrix <- DocumentTermMatrix(poetCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE)
)

# remove sparse (rarely used) terms --------
removeSparseTerms(DTmatrix, sparse = .2) # fewer terms
removeSparseTerms(DTmatrix, sparse = .8) # more terms

# trim with dictionaries of important words -------------
# only terms from dictionary appear in DTM

DTmatrix <- DocumentTermMatrix(poetCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE,
                                              dictionary = c("love", "hate", "apathy")
                                              )
                               )
DTmatrix
Terms(DTmatrix)
removeSparseTerms(DTmatrix, sparse = .2) # we are left with 2 terms
Terms(removeSparseTerms(DTmatrix, sparse = .2))

