# compare tm, quanteda, tidytext

# Note: you'll need to change the working directory
# for example...
# setwd("Exercise Files/poetry")

# Compare different NLP tools
# task: what are most popular words used in poetry?

# Base R with tm ---------
library(tm)

topPoetryTerms <- Corpus(DirSource(pattern = "./*txt")) |>
  DocumentTermMatrix( control = list(tolower = TRUE,
                                    removePunctuation = TRUE, 
                                    stopwords = TRUE,
                                    removeNumbers = TRUE)) |>
  removeSparseTerms(sparse = .1) |>
  as.matrix() |>
  colSums() |>
  sort(decreasing = TRUE) |>
  head(n = 10)

topPoetryTerms
