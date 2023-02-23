# Corpus subsets and groups
# corpus_subset, corpus_sample, corpus_group

library(quanteda)

# retrieve sample corpus
sampleCorpus <- readRDS("sampleCorpus.RDS")

# subsetting via corpus_subset ----------
# list documents with someInfo starting with the letter "T"
corpus_subset(sampleCorpus, startsWith(sampleCorpus$someInfo, "T"))

# any R command with a logical return works
corpus_subset(sampleCorpus, c(TRUE, FALSE, TRUE, FALSE))

# random sample a corpus -----------
corpus_sample(sampleCorpus, 
              size = ndoc(sampleCorpus)/2)

# "by" provides an extra dimension for corpus_sample
sampleCorpus$charcount <- nchar(sampleCorpus)

corpus_sample(sampleCorpus, 
              size = 1,
              by = charcount < 31)
# this results in samples from two groups:
# ... charcount >= 31 (docs 1 and 2)
# ... charcount < 31 (docs 3 and 4)
# size = 1 means 1 random sample from each group

# group (concatenate) documents in a corpus
groupedSampleCorpus <- corpus_group(sampleCorpus, groups = c("myDoc", "myDoc", "yourDoc", "nobody"))
summary(sampleCorpus) # ungrouped
summary(groupedSampleCorpus) # grouped by myDoc/yourDoc etc
# notice tokens(myDoc) == 13, which is tokens(text 1) + tokens(text 2)
sampleCorpus[1] # show original first document
groupedSampleCorpus[1] # equivalent to c(sampleCorpus[1], sampleCorpus[2])
