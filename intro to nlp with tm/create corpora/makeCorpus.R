library(tm) 

newCorpus <- Corpus(DirSource(directory = "./Muhammad_Iqbal/"))

# show structure of the new corpus
str(newCorpus)
