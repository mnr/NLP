# ngrams

library(tm)

# what is an ngram?
someText <- "Twas brillig and the slithey toves"
ngram_tokens <- Boost_tokenizer(someText)
someNgrams <- ngrams(ngram_tokens, 3)
someNgrams
# ngrams are phrases


# why are ngrams useful?
library(gutenbergr)

downloadThese <- gutenberg_subjects[grepl("politic", gutenberg_subjects$subject), ] 
downloadedBooks <-  gutenberg_download(downloadThese, strip = TRUE)

downloadedBooks$text |>
  paste(collapse = " ") |>
  removePunctuation() |>
  removeNumbers() |>
  stripWhitespace() |>
  Boost_tokenizer() |>
  ngrams(n = 3) |>
  vapply(paste, "", collapse=" ") |>
  table() |>
  sort(decreasing = TRUE) |>
  head()


