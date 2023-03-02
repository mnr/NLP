# sample data

library(tm)

poetCorpus <- readRDS("poetCorpus.RDS")
poetTDM <- TermDocumentMatrix(poetCorpus,
                              control = list(
                                removePunctuation = TRUE,
                                stopwords = TRUE,
                                removeNumbers = TRUE,
                                removeSparseTerms = TRUE
                              ))

# plotting Zipf's law

# the most frequent word will occur approximately twice as often 
# as the second most frequent word, 
# three times as often as the third most frequent word, etc.

Zipf_plot(poetTDM, type = "l")

# plotting Heaps' law

# More words does not result in more different words
# V = Unique terms (vocabulary)
# T = Number of terms
Heaps_plot(poetTDM, type = "l")
