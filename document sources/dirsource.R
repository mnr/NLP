library(tm) 
docDir <- DirSource(directory = "./Muhammad_Iqbal/")

newCorpus <- Corpus(docDir)

inspect(newVCorpus)