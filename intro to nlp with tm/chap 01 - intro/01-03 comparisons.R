# compare tm, quanteda, tidytext

# retrieve sample data
install.packages("gutenbergr")
library(gutenbergr)

SirMuhammadIqbal_meta <- gutenberg_works(author == "Iqbal, Muhammad, Sir")
putFilesHere_name <- "SirMhumammadIqbal"
dir.create(putFilesHere_name)
setwd(putFilesHere_name)
putFilesHere_dir <- getwd()
for (eachWork in 1:nrow(SirMuhammadIqbal_meta)) {
  print(SirMuhammadIqbal_meta[eachWork, "gutenberg_id"])
  download.file(
    paste0("https://gutenberg.org/files/", 
           SirMuhammadIqbal_meta[eachWork, "gutenberg_id"],
           "/",
           SirMuhammadIqbal_meta[eachWork, "gutenberg_id"],
           "-0.txt"),
    destfile = paste0("SMI_", 
                      SirMuhammadIqbal_meta[eachWork, "gutenberg_id"],
                      ".txt")
  )
}

# Base R with tm ---------
library(tm)

newSimpleCorpus <-
  SimpleCorpus(DirSource(directory = putFilesHere_dir))

newSimpleCorpus[[2]] <- removeNumbers(newSimpleCorpus[[2]])

summary(newSimpleCorpus)

# Quanteda --------

# install.packages("quanteda")
# install.packages("readtext")

library(quanteda)
library(readtext)

textDF <- readtext(paste0(putFilesHere_dir, "/*"))


textDF <- readtext("./Muhammad_Iqbal/*.txt",
                   docvarsfrom = "filenames")

textDF <- readtext("./Muhammad_Iqbal/*.txt",
                   docvarsfrom = "filenames")

quantCorpus <- corpus(textDF)

tokenQuantCorpus <- tokens(quantCorpus)
noNumQuantCorpus <- tokens(quantCorpus, remove_numbers = TRUE)

summary(tokenQuantCorpus)
summary(noNumQuantCorpus)

# tidytext ----------
library(tidytext)
library(dplyr)

newTidyNLP <- data.frame(readLines(list.files()[1])) %>%
  rename_with(.cols = 1, ~ "theText") %>%
  unnest_tokens(eachWord, theText) %>%
  filter(is.na(as.numeric(eachWord)))

View(newTidyNLP)