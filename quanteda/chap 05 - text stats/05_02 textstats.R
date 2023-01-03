# textstats

library(quanteda)
library(quanteda.textstats)

# calculate readability
readability <- textstat_readability(data_corpus_inaugural)
readability
readability[order(readability$Flesch, decreasing = TRUE), ]

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
textstat_summary(data_corpus_inaugural)

# find often-used phrases
textstat_collocations(data_corpus_inaugural, size = 4)

# where are keywords
mykwic <- kwic(tokens(data_corpus_inaugural), pattern = "government")
mykwic
