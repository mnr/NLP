# DTM options
library(tm)

# Pull in a sample corpus
poetCorpus <- readRDS("poetCorpus.RDS")

# control allows the use of transforms at creation of dtm
# look at termfreq for the list

DTmatrix <- DocumentTermMatrix(poetCorpus, 
                               control = list(tolower = TRUE,
                                              language = "en",
                                              tokenizer = "Boost",
                                              stopwords = TRUE, 
                                              removePunctuation = TRUE,
                                              removeNumbers = TRUE,
                                              stemming = TRUE
                                              # dictionary = c("love", "hate", "child")
                                              # bounds = list( local = c(60,201))
                                              # wordLengths = c(10,50)
                                              )
                               )

inspect(DTmatrix)
Terms(DTmatrix)
