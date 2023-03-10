# compare tm, quanteda, tidytext

# Note: you'll need to change the working directory
# for example...
# setwd("Exercise Files")

# Compare different NLP tools
# task: what are most popular words used in poetry?

# Quanteda --------

# install.packages("quanteda")
# install.packages("readtext")

library(quanteda)
library(readtext)

# first, using |> -------------
topPoetryFeatures <- readtext("poetry/*.txt", docvarsfrom = "filenames") |>
  corpus() |>
  tokens(remove_numbers = TRUE, remove_punct = TRUE) |>
  tokens_remove(pattern = stopwords("english")) |> 
  tokens_tolower() |>
  dfm() |> 
  topfeatures()

topPoetryFeatures

# second, what code looks like without |> ---------
textDF <- readtext("poetry/*.txt", docvarsfrom = "filenames")

poetCorpus <- corpus(textDF)

poetCorpus_tokens <- tokens(poetCorpus, 
                             remove_numbers = TRUE,
                             remove_punct = TRUE)
poetCorpus_tokens <- tokens_remove(poetCorpus_tokens, pattern = stopwords("english"))
poetCorpus_tokens <- tokens_tolower(poetCorpus_tokens)

poetCorpus_DFM <- dfm(poetCorpus_tokens)

topfeatures(poetCorpus_DFM)

