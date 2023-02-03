# stopwords

library(tm)

# create sample text
myText <- "Stopwords are nice words for humans.
They make sentences pleasant to read and sometimes clarify 
the context of associated words, but for the most part, 
they aren't important for natural language processing. 
An important part of text mining is removing these 
extraneous words; it's called stopword removal."

removeWords(myText, stopwords("english"))

# Use the appropriate dictionary
dir(system.file("stopwords", package = "tm"))
stopwords("italian") # show contents of a dictionary

# Build a custom dictionary 
moreWords <- c("associated", "clarify")
myStopwords <- c(stopwords("english"), moreWords)
myNewText <- removeWords(myText, myStopwords)
myNewText <- stripWhitespace(myNewText)
myNewText <- removePunctuation(myNewText)
myNewText

