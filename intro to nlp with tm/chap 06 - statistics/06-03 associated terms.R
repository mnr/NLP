# associated terms NLP

library(tm)

# Pull in a sample corpus
poetDTM <- readRDS("poetDTM.RDS")
poetCorpus <- readRDS("poetCorpus.RDS")

# find associated terms ----------
# lower correlation limit produces larger result set
# lower value means these terms overlap less frequently in documents
findAssocs(poetDTM, terms = c("love","hate","child"), 
           corlimit = .95)

# Where does "child" begin to correlate?
findAssocs(poetDTM, terms = c("child"), corlimit = .8)

# where does "child" appear?
poetCorpus_child <- tm_filter(
  poetCorpus,
  FUN = function(x)
    grepl("child", x)
)
meta(poetCorpus_child, type = "indexed", tag = "title")

# are there other interesting terms?
findMostFreqTerms(poetDTM)
