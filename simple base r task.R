library(tm) 

newSimpleCorpus <- SimpleCorpus(DirSource(directory = "./Muhammad_Iqbal/"))

newSimpleCorpus[[2]] <- removeNumbers(newSimpleCorpus[[2]])

inspect(newSimpleCorpus[[2]])
