# remove tokens
library(quanteda)

# retrieve sample corpus
sampleCorpus <- corpus(data_corpus_inaugural)

sampleCorpus

# create a tokens object
scTokens <- tokens(sampleCorpus, 
                   remove_numbers = TRUE,
                   remove_punct = TRUE,
                   remove_symbols = TRUE)

# tokens_select -------
# Just keep the word "citizens"
tokens_select(scTokens, 
              pattern = "citizens",
              selection = "keep")


# tokens_remove and stopwords ---------
# tokens_remove() is short for tokens_select(x, pattern, selection="remove")
# tokens_keep() is short for tokens_select(x, pattern, selection="keep")

# regular expression for citizens. 1 preceeding and following word
tokens_keep(scTokens, 
            pattern = "[Cc]?itizen[s?]",
            valuetype = "regex",
            window = 1)

# remove stopwords
tokens_remove(scTokens, pattern = stopwords("english"))
