# Transformations
library(tm)
data("acq") # call up sample data from tm package

# list transformations available in tm ------
getTransformations()

# Remove whitespace with stripWhitespace ----
# Before removing whitespace
head(acq[[1]]$content)

# After removing whitespace
head(stripWhitespace(acq[[1]]$content))

# Remove numbers with removeNumbers
# Before removing numbers
head(acq[[1]]$content)

# After removing numbers
head(removeNumbers(acq[[1]]$content))

# Remove punctuation with removePunctuation

# Before removing punctuation
head(acq[[1]]$content)

# After removing punctuation
head(removePunctuation(acq[[1]]$content))
