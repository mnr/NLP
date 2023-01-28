library(tm)

newCorpus <- Corpus(URISource(c("https://www.gutenberg.org/files/57317/57317-0.txt", 
                   "https://www.gutenberg.org/files/41707/41707-0.txt")))

