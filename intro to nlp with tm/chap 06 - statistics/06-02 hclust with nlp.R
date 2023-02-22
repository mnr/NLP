# Hierarchical Clustering with NLP

library(tm)



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

# what just happened?
dist(poetDTM) # calculates "distance" between rows.


# Do the clusters make sense?
# Let's take a look at the titles
buildPoetCorpus[buildPoetCorpus$doc_id %in% c(13223,13224), "title"]
buildPoetCorpus[buildPoetCorpus$doc_id %in% c(4800, 13310), "title"]
buildPoetCorpus[buildPoetCorpus$doc_id %in% c(2039,15390), "title"]

# save poetDTM for next session
saveRDS(poetDTM, file = "poetDTM.RDS")
saveRDS(poetCorpus, file = "poetCorpus.RDS")
