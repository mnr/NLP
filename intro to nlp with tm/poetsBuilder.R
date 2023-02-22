# This code builds a library of poetry from gutenberg

# install.packages("gutenbergr")
library(gutenbergr)

# grab a list of poetry in Gutenberg Library
gb_poets <- gutenberg_metadata[
  gutenberg_metadata$gutenberg_bookshelf %in% "Poetry" ,]

# download files to directory --------------
putFilesHere_name <- "poetry"
dir.create(putFilesHere_name)
setwd(putFilesHere_name)
putFilesHere_dir <- getwd()

for (eachWork in 1:nrow(gb_poets)) {
  print(gb_poets[eachWork, "gutenberg_id"])
  download.file(
    paste0("https://gutenberg.org/cache/epub/", 
           gb_poets[eachWork, "gutenberg_id"],
           "/pg",
           gb_poets[eachWork, "gutenberg_id"],
           ".txt"),
    destfile = paste0("poetry_", 
                      gb_poets[eachWork, "gutenberg_id"],
                      ".txt")
  )
}


# make a corpus --------------
# initialize data frame and download process -------
buildPoetCorpus <- data.frame()
pb <- txtProgressBar(min = 0,
                     initial = 0,
                     max = nrow(gb_poets),
                     style = 3)

for (poetID in gb_poets$gutenberg_id) { 
  muchPoetry <- gutenberg_download(poetID, 
                                   verbose = FALSE,
                                   strip = TRUE)
  poetText <- data.frame(
    doc_id = poetID,
    text = iconv(paste(muchPoetry$text, collapse = " "),
                 to = "UTF-8")
  )
  buildPoetCorpus <- rbind(buildPoetCorpus,poetText)
  setTxtProgressBar(pb, nrow(buildPoetCorpus))
}

close(pb)
buildPoetCorpus <- merge(x = buildPoetCorpus, 
                         y = gb_poets, 
                         by.x = "doc_id",
                         by.y = "gutenberg_id")
poetCorpus <- Corpus(DataframeSource(buildPoetCorpus))

saveRDS(poetCorpus, file = "poetCorpus.RDS")

# create and save DTM
poetDTM <- DocumentTermMatrix(poetCorpus,
                              control = list(stopwords = TRUE, 
                                             removePunctuation = TRUE,
                                             removeNumbers = TRUE,
                                             stemming = TRUE)
)
saveRDS(poetDTM, file = "poetDTM.RDS")
