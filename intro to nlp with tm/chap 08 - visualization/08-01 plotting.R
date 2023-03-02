# plotting nlp

library(tm)
install.packages("BiocManager")
BiocManager::install("Rgraphviz")

poetCorpus <- readRDS("poetCorpus.RDS")
poetTDM <- TermDocumentMatrix(poetCorpus,
                              control = list(
                                removePunctuation = TRUE,
                                stopwords = TRUE,
                                removeNumbers = TRUE,
                                removeSparseTerms = TRUE
                              ))

plot(poetTDM)

# obtain most frequent terms from 10 documents
freqTerms <- poetCorpus$content[1:10] |>
  tolower() |>
  removeWords(words = stopwords("english")) |>
  removePunctuation() |>
  removeNumbers() |>
  termFreq() |>
  findMostFreqTerms() |>
  names()

# note: Most frequent terms are connected. zweites is not
plot(poetTDM, 
     terms = c(freqTerms, "zweites"),
     weighting = TRUE)

# create a barplot
poetTDM |>
  as.matrix() |>
  rowSums() |>
  sort(decreasing = TRUE) |>
  (\(x) {x[1:10]})() |> 
  barplot(main = "Frequent Terms")

