# create useful metadata
library(tm, quietly = TRUE) 
library(readtext)


DataDirectory <- "./Muhammad_Iqbal/"
fileList <- dir(path = DataDirectory, pattern = ".*.txt")

# readtext returns a data.frame
aDataframe <- readtext(file.path(DataDirectory, fileList))

# find metadata and add to aDataframe
# with stringr
# install.packages("stringr")
library(stringr, quietly = TRUE)
aDFtags <- str_match_all(string = aDataframe$text,
              pattern = "(Title:|Author:|Release Date:|Language:|Character set encoding:) (.+)\\R")
for (eachRow in 1:nrow(aDataframe)) {
  for (eachListItem in 1:nrow(aDFtags[[1]])) {
    aDataframe[eachRow, aDFtags[[eachRow]][eachListItem, 2]] <-
      aDFtags[[eachRow]][eachListItem, 3]
  }
}

newVCorpus <- VCorpus(DataframeSource(aDataframe))

# add metadata by hand
meta(newVCorpus, type="corpus", tag="contributor") <- c("MNR","Jules")
meta(newVCorpus, type="corpus")

# assigning metadata
meta(newVCorpus, type="local", tag="reader") <- c("Azrah","Berezat")
meta(newVCorpus, type="local")

# use metadata to sort which documents to work on
byMNR <- meta(newVCorpus, type = "corpus", tag = "contributor") %in% "MNR"

print(c("byMNR contains ", byMNR))
meta(newVCorpus[byMNR], type = "local", tag = "id")
meta(newVCorpus[byMNR], type = "indexed")

newVCorpus[1]
meta(newVCorpus[[1]])
meta(newVCorpus[1], type = "local")
