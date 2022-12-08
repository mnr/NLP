#tokenizers

library(tm, quietly=TRUE)

sampleText <- as.String("Call me Ishmael. Some years ago - never mind how 
long precisely - having little or no money in my purse, and 
nothing particular to interest me on shore, I thought I would sail 
about a little and see the watery part of the world.")

myTokenizer <- Regexp_Tokenizer(pattern = "(\\S+)")
indexesof <- myTokenizer(sampleText)

sampleText[indexesof]
sampleText[wordpunct_tokenizer(sampleText)]
