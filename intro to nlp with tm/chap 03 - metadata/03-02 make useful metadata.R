# how to create and use metadata
library(tm) 
library(readtext)

# build a sample dataframe ------------
DataDirectory <- "./Muhammad_Iqbal/"
fileList <- dir(path = DataDirectory, pattern = "*.txt")

# readtext returns a data.frame
aDataframe <- readtext(file.path(DataDirectory, fileList))

# find metadata and add to aDataframe -------------
# with stringr
# install.packages("stringr")
library(stringr)
# aDFtags will contain a list of title, author, etc
# str_match_all uses regular expressions
aDFtags <- str_match_all(string = aDataframe$text,
              pattern = "(Title:|Author:|Release Date:|Language:|Character set encoding:) (.+)(?:\\[EBook.+\\])\\R")
# then add information from aDFtags to dataframe
for (eachRow in 1:nrow(aDataframe)) {
  for (eachListItem in 1:nrow(aDFtags[[1]])) {
    aDataframe[eachRow, aDFtags[[eachRow]][eachListItem, 2]] <-
      aDFtags[[eachRow]][eachListItem, 3]
  }
}

# use dataframe to build a VCorpus. Anything other than doc_id and text are stored as document metadata
newVCorpus <- VCorpus(DataframeSource(aDataframe))

# show the new document level metadata
meta(newVCorpus)
meta(newVCorpus, type = "local")

# ...but there isn't much corpus level data
meta(newVCorpus, type = "corpus")

# so...add corpus metadata by hand
meta(newVCorpus, type = "corpus", tag = "contributor") <- c("MNR","Jules")
meta(newVCorpus, type = "corpus")

# so...add document metadata by hand
meta(newVCorpus, type = "local", tag = "reader") <- c("Azrah","Berezat")
meta(newVCorpus, type = "local")

# Where is all this stored?
str(newVCorpus, max.level = 1) # shows class and overall structure
str(newVCorpus$content, max.level = 1) # shows content
str(newVCorpus$meta, max.level = 1) # shows corpus metadata
str(newVCorpus$dmeta, max.level = 1) # shows document metadata

# dublincore is a wrapper for suggested/additional metadata tags
DublinCore(newVCorpus)

# save this for the next session
saveRDS(newVCorpus, file = "newVCorpus.RDS")

