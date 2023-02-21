# retrieve sample data ----------------------
# install.packages("gutenbergr")
library(gutenbergr)

SirMuhammadIqbal_meta <- gutenberg_works(author == "Iqbal, Muhammad, Sir")
putFilesHere_name <- "Muhammad_Iqbal"
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