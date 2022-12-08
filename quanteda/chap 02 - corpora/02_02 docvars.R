library(quanteda)

# corpus document variables
# can be created along with corpus
# ...or with docvars

# retrieve sample corpus
sampleCorpus <- readRDS("quanteda/sampleCorpus.RDS")

summary(sampleCorpus)

# display existing document variables
docvars(sampleCorpus)

# assign a new variable
docvars(sampleCorpus, field = "charcount") <- nchar(sampleCorpus)
summary(sampleCorpus)
