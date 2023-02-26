# find and filter on metadata
library(tm, quietly = TRUE) 

# retrieve corpus from previous session --------
newVCorpus <- readRDS("newVCorpus.RDS")

# Use base R subsetting: 
# newVCorpus[1] shows the first element of newVCorpus meta dataframe (indexed)
meta(newVCorpus[1])
meta(newVCorpus[1])$author
meta(newVCorpus, type = "indexed")


# Use base R subsetting: 
# newVCorpus[[1]] shows the contents of the first element of newVCorpus"
meta(newVCorpus[[1]])
meta(newVCorpus[[1]])$AssignedReader
meta(newVCorpus, type = "local")


# How to use metadata to filter documents
assigned2Sarah <- meta(newVCorpus, type = "local", tag = "AssignedReader") %in% "Sarah"

# subset a corpus by filter
filteredCorpus <- tm_filter(newVCorpus,
                            FUN = function(x) meta(x, type = "local", tag = "AssignedReader") %in% "Sarah")
summary(filteredCorpus)
meta(filteredCorpus, type = "local", tag = "AssignedReader")
meta(filteredCorpus, type = "indexed", tag = "title")

