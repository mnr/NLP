# textstats

library(quanteda)
library(quanteda.textstats)

sampleCorpus <- corpus(data_corpus_inaugural)

# calculate readability
readability <- textstat_readability(sampleCorpus)
readability
readability[order(readability$Flesch), ]
