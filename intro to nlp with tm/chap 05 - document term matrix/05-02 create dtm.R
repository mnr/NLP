# what is a DTM?
library(tm)

# Pull in a sample corpus
newVCorpus <- readRDS("newVCorpus.RDS")

# create a document term matrix
DTmatrix <- DocumentTermMatrix(newVCorpus)
inspect(DTmatrix)

# control allows the use of transforms at creation of dtm
# look at termfreq for the list
DTmatrix <- DocumentTermMatrix(newVCorpus, 
                               control = list(tolower = TRUE,
                                              language = "en",
                                              stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE,
                                              bounds = list( #freq(min,max)
                                                local = c(10,201)
                                              ),
                                              wordLengths = list(10,50) # characters(min,max)
                                              )
                               )

inspect(DTmatrix)

