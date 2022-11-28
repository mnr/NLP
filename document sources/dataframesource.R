library(tm)
library(readtext)

DataDirectory <- "./Muhammad_Iqbal/"
fileList <- dir(path = DataDirectory, pattern = ".*.txt")


# readtext returns a data.frame
aDataframe <- readtext(paste0(DataDirectory, fileList), 
                       docvarsfrom = "filepaths")

# doc_id must be unique --------
if (nrow(aDataframe) == length(unique(aDataframe$doc_id))) {
  message("doc_id is unique")
} else {
  stop("document names are not unique")
}

aDataframeSource <- DataframeSource(aDataframe)
aCorpus <- Corpus(aDataframeSource)

summary(aCorpus)

