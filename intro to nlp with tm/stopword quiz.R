library(tm)
noWhiteSpaceOrStopWords <- function(myText) {
  myText <- removeWords(myText, stopwords("english"))
  myText <- stripWhitespace(myText)
  return(myText)
}

noWhiteSpaceOrStopWords("somestring")
noWhiteSpaceOrStopWords("string  two")
noWhiteSpaceOrStopWords("string the third")
