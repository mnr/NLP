# Hierarchical Clustering with NLP

library(tm)

# build up a library of poetry
# install.packages("gutenbergr")
library(gutenbergr)
gb_poets <- gutenberg_metadata[
  gutenberg_metadata$gutenberg_bookshelf %in% "Poetry" ,]

# initialize data frame and download process -------
buildPoetCorpus <- data.frame()
pb <- txtProgressBar(min = 0,
                     initial = 0,
                     max = nrow(gb_poets),
                     style = 3)

for (poetID in gb_poets$gutenberg_id) { 
  muchPoetry <- gutenberg_download(poetID, 
                                   verbose = FALSE,
                                   strip = TRUE)
  poetText <- data.frame(
    doc_id = poetID,
    text = iconv(paste(muchPoetry$text, collapse = " "),
                 to = "UTF-8")
  )
  buildPoetCorpus <- rbind(buildPoetCorpus,poetText)
  setTxtProgressBar(pb, nrow(buildPoetCorpus))
}
close(pb)
buildPoetCorpus <- merge(x = buildPoetCorpus, 
                         y = gb_poets, 
                         by.x = "doc_id",
                         by.y = "gutenberg_id")
poetCorpus <- Corpus(DataframeSource(buildPoetCorpus))
# summary(poetCorpus)
# meta(poetCorpus)

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
