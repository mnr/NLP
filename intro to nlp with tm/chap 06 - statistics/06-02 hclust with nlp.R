# Hierarchical Clustering with NLP

library(tm)
poetCorpus <- readRDS("poetCorpus.RDS")

# create a DTM from the corpus
poetDTM <- DocumentTermMatrix(poetCorpus,
                              control = list(stopwords = TRUE, 
                                             removePunctuation = TRUE,
                                             removeNumbers = TRUE,
                                             stemming = TRUE)
)

# create a hierarchical cluster ----------
poetClust <- hclust(dist(poetDTM))
poetClust
plot(poetClust) # take a look at the graph

# Do the clusters make sense?
# Let's take a look at the titles

getTitle <- function(docid) {
  meta(poetCorpus, type = "indexed", tag = "title") |>
    subset(Docs(poetDTM) %in% docid)
}

getTitle(c(13223, 13224))
getTitle(c(4800,13310))
getTitle(c(2039,15390))
getTitle(c(9700,12924))

