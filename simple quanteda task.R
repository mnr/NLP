
# install.packages("quanteda")
# install.packages("readtext")

library(quanteda)
library(readtext)

textDF <- readtext("./Muhammad_Iqbal/*.txt",
                   docvarsfrom = "filenames")

quantCorpus <- corpus(textDF)

tokenQuantCorpus <- tokens(quantCorpus)
noNumQuantCorpus <- tokens(quantCorpus,remove_numbers = TRUE)

summary(tokenQuantCorpus)
summary(noNumQuantCorpus)
