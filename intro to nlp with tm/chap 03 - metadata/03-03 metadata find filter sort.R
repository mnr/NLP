# create useful metadata
library(tm, quietly = TRUE) 

# retrieve corpus from previous session --------
newVCorpus <- readRDS("newVCorpus.RDS")

# Use base R subsetting: newVCorpus[1] shows the first element of newVCorpus
newVCorpus[1]

# Use base R subsetting: newVCorpus[[1]] shows the contents of the first element of newVCorpus")
meta(newVCorpus[[1]])

# tm addressing: type=local is equivalent to newVCorpus[[1]]
meta(newVCorpus[1], type = "local")

# How to use metadata to sort documents
meta(newVCorpus, type = "corpus") # show corpus level metadata
# ...then filter by specific metadata content
meta(newVCorpus, type = "corpus", tag = "contributor") %in% "MNR"
# use metadata to sort which documents to work on
byMNR <- meta(newVCorpus, type = "corpus", tag = "contributor") %in% "MNR"

print(c("byMNR contains ", byMNR))
meta(newVCorpus[byMNR], type = "local", tag = "id")
meta(newVCorpus[byMNR], type = "local")
