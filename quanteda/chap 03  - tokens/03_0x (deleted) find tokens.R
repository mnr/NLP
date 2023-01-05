# find tokens - tokens_lookup()

library(quanteda)

# create a tokens object
scTokens <- tokens(data_corpus_inaugural, 
                   remove_numbers = TRUE,
                   remove_punct = TRUE,
                   remove_symbols = TRUE)

myDictionary <- dictionary(list(citizen = "[Cc]?itizen[s?]"))
  
tokens_lookup(scTokens, 
            dictionary = myDictionary,
            valuetype = "regex")
