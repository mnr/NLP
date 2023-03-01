# Part of speech tagging

# install.packages("udpipe")
library(udpipe)
poetCorpus <- readRDS("poetCorpus.RDS")

udpipeResults <- udpipe(x = poetCorpus[[1]]$content, object = "english")

udpipeResults

# upos defined at https://universaldependencies.org/u/pos/index.html

# show the results
barplot(sort(table(udpipeResults$upos)), horiz = TRUE, las = 2)

# or...
udpipeResults$upos |>
  table() |>
  sort() |>
  barplot(horiz = TRUE, las = 2, main = "Universal Parts of Speech")
