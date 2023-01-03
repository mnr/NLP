# Real-World DFM with Quanteda
library(quanteda)
library(readtext)
# compare US inaugural speeches against the US Bill of Rights
# are there interesting insights?

# retrieve US Bill of Rights, tokenize, and stem
billOfRights <- readtext(file = "https://gutenberg.org/cache/epub/2/pg2.txt")
billOfRights$text <- substring(billOfRights$text, 
                              first = regexpr("The United States Bill of Rights.", billOfRights$text))
billOfRights_token <- tokens(corpus(billOfRights), 
                            remove_numbers = TRUE,
                            remove_punct = TRUE,
                            remove_symbols = TRUE)
billOfRights_token <- tokens_remove(billOfRights_token, stopwords(source = "smart"))
billOfRights_token <- tokens_wordstem(billOfRights_token)
billOfRights_dictionary <- dictionary(as.list(billOfRights_token))
names(billOfRights_dictionary) <- "BillOfRights"

# examine Bill of Rights Dictionary
billOfRights_dictionary

# stemming the 2015 Lexicoder Sentiment Dictionary
LSD2015_stemmed <- dictionary(
                      as.list(
                        tokens_wordstem(
                          as.tokens(data_dictionary_LSD2015
))))

LSD2015_stemmed

# combine two dictionaries
billOfRights_dictionary <- c(billOfRights_dictionary, LSD2015_stemmed)
billOfRights_dictionary$neg_positive <- NULL
billOfRights_dictionary$neg_negative <- NULL

# retrieve DFM of inaugural speeches from previous lesson
load(file = "quanteda/chap 04 - dfm/mydfm.rds")
myDFM_stemmed <- dfm_wordstem(myDFM)

# lookup words from dictionary
dfm_lookup(x = myDFM_stemmed, dictionary = billOfRights_dictionary)

# find major features across all documents
dfm_trim(myDFM_stemmed, min_termfreq = 400)

# look ahead to textstats
# install.packages("quanteda.textstats")
library(quanteda.textstats)
head(textstat_frequency(myDFM_stemmed), 20)

# subset features starting with "free"
dfm_select(myDFM_stemmed, pattern = startsWith(featnames(myDFM_stemmed), "free"))

# subset documents older than 1800
dfm_subset(myDFM_stemmed,
           unlist(
             lapply(
              strsplit(docnames(myDFM_stemmed), split = "-"),
              FUN = function(x, y) {x[1] < 1800}
           )))
# or...random documents
dfm_sample(myDFM_stemmed) # random sample of documents

