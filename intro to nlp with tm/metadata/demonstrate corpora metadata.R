library(tm)

docDir <- DirSource(directory = "./Muhammad_Iqbal/",
                    pattern = ".*.txt")

newVCorpus <- VCorpus(docDir)

str(newVCorpus)

meta(newVCorpus, type = "local")

# creating corpus metadata
meta(newVCorpus, tag = 'mnrMeta') <- "I did this"
meta(newVCorpus, tag = 'mnrStuff') <- c("Hello", "goodbye")
meta(newVCorpus)

# creating document metadata
meta(newVCorpus[[1]], tag = 'comment') <- "great writing"
meta(newVCorpus, type = "local")
