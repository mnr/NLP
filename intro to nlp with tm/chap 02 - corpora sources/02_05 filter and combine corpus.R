library(tm)

# setup for demonstration -------
newVCorpus <- VCorpus(DirSource(pattern = ".*.txt"))
B_VCorpus <- VCorpus(DirSource(pattern = ".*.txt"))

# combine corpora ---------
# note: "c" doesn't work with simpleCorpus. 
# c(simpleCorpus, anotherCorpus) is converted to a list
combinedCorpora <- c(newVCorpus, B_VCorpus)
summary(combinedCorpora)

# tm_filter and tm_index ---------

# create a function -----
searchForThis <- function(x) {
  grepl("Computer Terminal Systems", x)
}
searchForCTS(c("This isnt CTS", "Computer Terminal Systems"))

# Note: content() is supplied by NLP library and returns
# content of a corpus
tm_filter(acq, 
          FUN = function(x) grepl("Computer Terminal Systems", content(x)))

tm_index(acq, 
         FUN = function(x) grepl("Computer Terminal Systems", x))

acq[tm_index(acq, 
             FUN = function(x) grepl("Computer Terminal Systems", x))
]
