# create useful metadata
library(tm, quietly = TRUE) 
library(readtext)

newVCorpus <- readRDS("newVCorpus.RDS")

# use metadata to sort which documents to work on
meta(newVCorpus, type = "corpus") # show corpus level metadata
# ...then filter by specific metadata content
meta(newVCorpus, type = "corpus", tag = "contributor") %in% "MNR"
# use metadata to sort which documents to work on
byMNR <- meta(newVCorpus, type = "corpus", tag = "contributor") %in% "MNR"

print(c("byMNR contains ", byMNR))
meta(newVCorpus[byMNR], type = "local", tag = "id")
meta(newVCorpus[byMNR], type = "local")
