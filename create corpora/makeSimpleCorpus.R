library(tm) 

newSimpleCorpus <- SimpleCorpus(
  DirSource(directory = "./Muhammad_Iqbal/")
)

summary(newSimpleCorpus)