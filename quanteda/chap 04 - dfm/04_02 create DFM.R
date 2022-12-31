# Create and Modify DFM
# dfm
# dfm_compress, dfm_group, dfm_lookup, dfm_match
# dfm_sort

library(quanteda)

# create a tokens object
scTokens <- tokens(corpus(data_corpus_inaugural), 
                   remove_numbers = TRUE,
                   remove_punct = TRUE,
                   remove_symbols = TRUE)

scTokens <- tokens_remove(scTokens, pattern = stopwords(source = "smart"))

# create a document-feature matrix
dfm(scTokens) # what it looks like

# save as a dfm object
myDFM <- dfm(scTokens) # save the DFM for next steps

# dfm_sort
dfm_sort(dfm(scTokens[1]), margin = "features") #sort features of simplified example

sortedDFM <- dfm_sort(myDFM, margin = "features") # sort features of all documents
sortedDFM

# frequency of all features
head(featfreq(sortedDFM))
# or...
featfreq(dfm_select(sortedDFM, "people")) # appearances of "people"

# save the dfm for use in next sessions
save(myDFM, file = "quanteda/chap 04 - dfm/mydfm.rds")

