library(quanteda)

# create quanteda corpus

# ...from a named character vector ---------
# here's what a named vector looks like

myNamedVector <- c("Twas brillig and the slithey toves", 
                   "did gyre and gimbel in the wabes",
                   "all mimsy were the borogoves",
                   "and the mome raths outgrabe")
names(myNamedVector) <- c("first", "second", "third", "fourth")
myNamedVector

myCorpus <- corpus(myNamedVector)
summary(myCorpus)

# ...from a data.frame ----------
myData.frame <- as.data.frame(myNamedVector)
myData.frame$docid <- c(1:4)
myData.frame$someInfo <- c("This","That","Another","One More")

# columns must be identified by doc_id and text
myCorpus <- corpus(myData.frame, 
                   docid_field = "docid",
                   text_field = "myNamedVector",
                   meta = list(thisCameFrom = "I made this myself")
                   )
# meta = will come up in docvars

summary(myCorpus)
# notice how extra data.frame columns are added as extra variables

# appendix: This is how I saved example file
saveRDS(myCorpus, file = "quanteda/sampleCorpus.RDS")
