library(tm)

# how to list metadata ---------

# create a demo corpus ------------
newVCorpus <- VCorpus(DirSource(directory = "poetry",
                                pattern = "*.txt"))

# show corpus and document metadata -------
meta(newVCorpus, type = "corpus")
meta(newVCorpus, type = "local")

# create corpus metadata ------------
meta(newVCorpus, tag = 'mnrMeta') <- "My Stuff"
meta(newVCorpus, tag = 'dueDate') <- c("Monday", "Wednesday")
meta(newVCorpus)

# create document metadata
meta(newVCorpus[[1]], tag = 'comment') <- "great writing"
meta(newVCorpus[[2]], tag = 'comment') <- "another story"
meta(newVCorpus, type = "local")
