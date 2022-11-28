library(tm)

aZipCorpus <- Corpus(ZipSource("./Muhammad_Iqbal/Archive.zip"))

summary(aZipCorpus)
