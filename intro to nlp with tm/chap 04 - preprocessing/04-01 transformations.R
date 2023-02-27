# Transformations clean text
library(tm)

# create a demonstration corpus ------------
newVCorpus <- VCorpus(DirSource(directory = "poetry", pattern = "*.txt"))

# list transformations available in tm ------
getTransformations()

# Remove whitespace with stripWhitespace ----
# Before removing whitespace
newVCorpus[[1]]$content

# After removing whitespace
stripWhitespace(newVCorpus[[1]]$content)

# Remove numbers with removeNumbers
# Before removing numbers
newVCorpus[[1]]$content

# After removing numbers
removeNumbers(newVCorpus[[1]]$content)

# Remove punctuation with removePunctuation

# Before removing punctuation
newVCorpus[[1]]$content

# After removing punctuation
removePunctuation(newVCorpus[[1]]$content)
