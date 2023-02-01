library(tm)

# setup for demonstration -------
docDir <- DirSource(directory = "./Muhammad_Iqbal",
                    pattern = ".*.txt")

A_Corpus <- Corpus(docDir)
vectorOfText <- c("twas brillig and the slithey toves", 
                  "did gyre and gimble in the wabes")
names(vectorOfText) <- c("firstLine", "secondLine")

B_Corpus <- Corpus(VectorSource(vectorOfText))

# combine corpora ---------
combinedCorpora <- c(A_Corpus, B_Corpus)
summary(combinedCorpora)

# tm_filter and tm_index ---------
data("acq") # a sample VCorpus included with tm

# create a function -----
searchForCTS <- function(x) {
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
