library(tm)

vectorOfText <- c("twas brillig and the slithey toves", "did gyre and gimble in the wabes")
names(vectorOfText) <- c("firstLine", "secondLine")
aCorpus <- Corpus(VectorSource(vectorOfText))

summary(aCorpus)

