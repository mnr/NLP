library(tm)

# Corpora metadata vs Document metadata

# create a demonstration corpus ------------
newVCorpus <- VCorpus(DirSource(directory = "poetry",
                                pattern = "*.txt"))

# show corpus and document metadata -------
meta(newVCorpus, type = "corpus") # at corpus level
meta(newVCorpus, type = "local") # at document level
meta(newVCorpus, type = "indexed") # at document level as data.frame

# note - simpleCorpus does not have "local" metadata - only indexed and corpus

# create corpus metadata ------------
meta(newVCorpus, tag = 'mnrMeta', type = "corpus") <- "My Stuff"
meta(newVCorpus, type = "corpus")

# create document (local) metadata

meta(newVCorpus, tag = 'dueDate', type = "local") <- seq.Date(from = as.Date("2023-01-13"), 
                                                               by = "week", 
                                                               length.out = length(newVCorpus))
# specify a document contents ([[x]]) implies local metadata
meta(newVCorpus[[1]], tag = 'comment') <- "great writing"
meta(newVCorpus[[2]], tag = 'comment') <- "another story"
meta(newVCorpus[[3]], tag = "description") <- "a pirate story"

meta(newVCorpus, type = "local")

# indexed metadata --------------
# assign random letter to each document
meta(newVCorpus, tag = 'randLETTER', type = "indexed") <- sample(LETTERS, length(newVCorpus))

meta(newVCorpus, type = "indexed")
