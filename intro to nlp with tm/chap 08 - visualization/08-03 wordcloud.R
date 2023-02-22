# wordclouds

library(tm)
# install.packages("wordcloud")
library(wordcloud)

# sample data
poetCorpus <- readRDS("poetCorpus.RDS")
poetTDM <- TermDocumentMatrix(poetCorpus,
                              control = list(
                                removePunctuation = TRUE,
                                stopwords = TRUE,
                                removeNumbers = TRUE,
                                removeSparseTerms = TRUE
                              ))

# make a wordcloud -----------
poetCorpus[1:10] |>
  tolower() |>
  removeWords(words = stopwords("english")) |>
  removePunctuation() |>
  removeNumbers() |>
  wordcloud(min.freq = 50,
            max.words = 100)

# wordcloud 2 ------------
# more features, but more fidgety
install.packages("wordcloud2")
library(wordcloud2)

poetCorpus$content[1:10] |>
  tolower() |>
  removeWords(words = stopwords("english")) |>
  removePunctuation() |>
  removeNumbers() |>
  termFreq() |>
  as.data.frame() |>
  (\(x) { cbind(x,row.names(x))})() |>
  setNames(c("Frequency","Terms")) |>
  (\(x) {x[order(x["Frequency"], decreasing = TRUE), c("Terms","Frequency")]})() |>
  wordcloud2(size = .5,
             shape = "star")

