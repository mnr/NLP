# how to create and use metadata
library(tm) 
library(readtext)

# build a sample dataframe ------------
DataDirectory <- "poetry"
fileList <- dir(path = DataDirectory, pattern = "*.txt")

# readtext returns a data.frame
aDataframe <- readtext(file.path(DataDirectory, fileList))

# find metadata and add to aDataframe -------------
# with stringr
# install.packages("stringr")
library(stringr)
# aDFtags will contain a list of title, author, etc

language <- str_match(string = aDataframe$text,
                         pattern = "(Language:) (.+)\\R")

titles <- str_match(string = aDataframe$text,
                         pattern = "(Title:) (.+)\\R")

releaseDate <- str_match(string = aDataframe$text,
                         pattern = "(Release Date:) (.+)(?:\\[EBook.+\\])\\R")

authors <- str_match(string = aDataframe$text,
                         pattern = "(Author:) (.+)\\R")

# then add information to dataframe
aDataframe <- cbind(aDataframe, 
                    language = language[,3], 
                    title = titles[,3], 
                    release = releaseDate[,3], 
                    author = authors[,3])


# use dataframe to build a VCorpus. ------------
# Anything other than doc_id and text are stored as document metadata
newVCorpus <- VCorpus(DataframeSource(aDataframe))

# show the new metadata
meta(newVCorpus, type = "indexed") # data.frame is stored here
meta(newVCorpus, type = "local")
meta(newVCorpus, type = "corpus")

# add corpus metadata by hand ------------
meta(newVCorpus, type = "corpus", tag = "compiler") <- c("MNR")
meta(newVCorpus, type = "corpus")

# add document (local) metadata by hand ----------------
meta(newVCorpus, type = "local", tag = "AssignedReader") <- sample(c("Azrah","Berezat","Sarah"), 
                                                                   length(newVCorpus),
                                                                   replace = TRUE)
meta(newVCorpus, type = "local")

# save this for the next session
saveRDS(newVCorpus, file = "newVCorpus.RDS")

