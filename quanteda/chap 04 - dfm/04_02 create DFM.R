# Create and Modify DFM
# dfm
# dfm_compress
# dfm_group
# dfm_lookup
# dfm_match
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

myDFM <- dfm(scTokens) # save the DFM for next steps
save(myDFM, file = "quanteda/chap 04 - dfm/mydfm.rds")

# dfm_sort
sortedDFM <- dfm_sort(myDFM, margin = "features")



