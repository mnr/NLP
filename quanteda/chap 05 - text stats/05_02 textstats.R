# textstats

library(quanteda)
library(quanteda.textstats)

sampleCorpus <- corpus(data_corpus_inaugural)

# calculate readability
readability <- textstat_readability(sampleCorpus)
readability
readability[order(readability$Flesch), ]

# similarity and distance
load(file = "quanteda/chap 04 - dfm/mydfm.rds")

# show similiarity
heatmap(
  as.matrix(
    textstat_simil(myDFM, margin = "documents")),
  Rowv = NA, Colv = NA)

# show dissimilarity (distance)
heatmap(
  as.matrix(
    textstat_dist(myDFM, margin = "documents")),
  Rowv = NA, Colv = NA)

# summaries
textstat_summary(sampleCorpus)

# find often-used phrases
textstat_collocations(sampleCorpus, size = 4)

# where are keywords
mykwic <- kwic(tokens(data_corpus_inaugural), pattern = "government")
