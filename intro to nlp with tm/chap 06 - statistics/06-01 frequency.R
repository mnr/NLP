# term frequency
library(tm)

# Pull in a sample corpus
newVCorpus <- readRDS("newVCorpus.RDS")

# create a document term matrix
DTmatrix <- DocumentTermMatrix(newVCorpus, 
                               control = list(stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE))

# exploring documents and terms
nDocs(DTmatrix) # number of documents
Docs(DTmatrix)
nTerms(DTmatrix) # number of terms
Terms(DTmatrix)

# term frequency
termFreq(newVCorpus[[1]],
         control = list(removePunctuation = TRUE,
                        removeNumbers = TRUE,
                        stopwords = TRUE,
                        stemming = TRUE,
                        bounds = list(local = c(10,Inf))))


findFreqTerms(DTmatrix, lowfreq = 100, highfreq = Inf)

findMostFreqTerms(DTmatrix, n = 10)


