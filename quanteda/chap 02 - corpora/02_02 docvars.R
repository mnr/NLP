library(quanteda)

# corpus document variables
# can be created along with corpus
# ...or with docvars
# ...or with meta

# retrieve sample corpus
sampleCorpus <- readRDS("sampleCorpus.RDS")

summary(sampleCorpus)

# display existing document variables
docvars(sampleCorpus)

# or...in traditional notation
sampleCorpus$someInfo

# assign a new variable
docvars(sampleCorpus, field = "charcount") <- nchar(sampleCorpus)
summary(sampleCorpus)

# meta for corpus 
meta(sampleCorpus, type = "system") # assigned at time of corpus creation
meta(sampleCorpus, type = "user") # user provided
meta(sampleCorpus, type = "object")

# assign meta
meta(sampleCorpus, field = "Letters") <- c("A", "B", "C", "D")
meta(sampleCorpus, type = "all") # Letters now appears
summary(sampleCorpus) # Letters isn't listed ... summary shows document level

# What happened to charcount?
meta(sampleCorpus, field = "charcount") # NULL ??
sampleCorpus$charcount # but it's still there
# answer: charcount is at document level.
# meta doesn't list it because meta is for corpus level metadata
