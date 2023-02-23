# trim a corpus with corpus_trim

library(quanteda)

# retrieve sample corpus
sampleCorpus <- readRDS("sampleCorpus.RDS")

summary(sampleCorpus)

# remove sentences shorter than 6 words
corpus_trim(sampleCorpus,
            what = "sentences",
            min_ntoken = 6
            )

# remove sentences starting with "T"
corpus_trim(sampleCorpus,
            what = "sentences",
            exclude_pattern = "^T.*"
)
