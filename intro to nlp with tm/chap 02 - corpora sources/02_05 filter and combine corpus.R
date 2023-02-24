library(tm)

# setup for demonstration -------
simpCorp <- readRDS("poetCorpus.RDS")
newVCorpus <- VCorpus(DirSource(directory = "poetry",
                                pattern = "*.txt"))

# combine corpora ---------
# note: "c" will return the class of the first object
# simpleCorpus sometimes shows up as a list
# c(simpleCorpus, aVCorpus) is converted to a list
# c( aVCorpus, simpleCorpus) results in a VCorpus
combinedCorpora <- c(newVCorpus, simpCorp)
combinedCorpora <- c(simpCorp, newVCorpus)
summary(combinedCorpora)

# tm_filter  ---------

# returns a corpus of documents matching filter
filteredCorpus <- tm_filter(simpCorp,
                            FUN = function(x) grepl("Will not", x))
summary(filteredCorpus)

# tm_index --------
tm_index(simpCorp, FUN = function(x) grepl("Will not", x))

filteredCorpus <- simpCorp[tm_index(simpCorp, 
                                    FUN = function(x) grepl("Will not", x))
                           ]
