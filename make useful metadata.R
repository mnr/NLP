# create useful metadata
library(tm) 
library(readtext)


DataDirectory <- "./Muhammad_Iqbal/"
fileList <- dir(path = DataDirectory, pattern = ".*.txt")

# readtext returns a data.frame
aDataframe <- readtext(paste0(DataDirectory, fileList))

# find metadata and add to aDataframe
# with stringr
# install.packages("stringr")
library(stringr)
aDFtags <- str_match_all(string = aDataframe$text,
              pattern = "(Title:|Author:|Release Date:|Language:|Character set encoding:) (.+)\\R")
for (eachRow in 1:nrow(aDataframe)) {
  for (eachListItem in 1:nrow(aDFtags[[1]])) {
    aDataframe[eachRow, aDFtags[[eachRow]][eachListItem, 2]] <-
      aDFtags[[eachRow]][eachListItem, 3]
    # aDataFrame[ea]
  }
}

newVCorpus <- VCorpus(DataframeSource(aDataframe))

# show the new metadata
meta(newVCorpus)
meta(newVCorpus, type = "indexed")

# ...but not much corpus level data
meta(newVCorpus, type = "corpus")

# here's the structure:
str(newVcorpus, max.level=1)
str(newVCorpus$content, max.level=1)
str(newVCorpus$meta, max.level=1)
str(newVCorpus$dmeta, max.level=1)


# add metadata by hand
meta(newVCorpus, type="corpus", tag="contributor") <- c("MNR","Jules")
meta(newVCorpus, type="corpus")

# assigning metadata
meta(newVCorpus, type="local", tag="reader") <- c("Azrah","Berezat")
meta(newVCorpus, type="local")


# use metadata to sort which documents to work on
meta(newVCorpus, type = "corpus")
meta(newVCorpus, type = "corpus", tag = "contributor") %in% "MNR"

# dublincore
DublinCore(newVCorpus)
