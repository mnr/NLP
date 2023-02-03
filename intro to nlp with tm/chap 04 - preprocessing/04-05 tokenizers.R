# Understanding tokenization 

library(tm)

sampleText <- as.String("Call me Ishmael. Some years ago - never mind how 
long precisely - having little or no money in my purse, and 
nothing particular to interest me on shore, I thought I would sail 
about a little and see the watery part of the world.")

Boost_tokenizer(sampleText)

# It's not hard to see the results of Boost_tokenizer; the text has been broken
# into words. This is often referred to as “bag of words” and allows analysis
# such as word frequency, but sacrifices context. For example, is the word
# "interest" a relational term or a financial term. In the above context it is
# obvious the author is talking about their involvement in their life on shore.
# If the context was a quarterly report from a public company, "interest" would
# have an entirely different meaning. More sophisticated tokenization such as
# phrase or sentence recognition will might preserve the difference between
# “useful” and “not useful.” This is why there are different tokenizers. tm
# provides a function to list tokenizers included with the package.

getTokenizers()

# These three tokenizers are similar in behavior:
## Boost_tokenizer implements the Boost tokenizer from the boost library. It
# breaks strings up by spaces and punctuation.
## MC_tokenizer implements a tokenizer from the MC Toolkit. Unfortunately,
# documentation and source code has become elusive.
## scan_tokenizer is an alias for scan(..., what = "character").

# Use regular expressions to tokenize

# Regexp_Tokenizer is actually part of the nlp package which is loaded by tm.
# Regexp_Tokenizer is based on base R gregexpr( ) and allows for extra function
# arguments such as ignore.case. 

# note: sampleText is as.string (special class provided by NLP)
myTokenizer <- Regexp_Tokenizer(pattern = "(\\S+)") # create a regexp function
myIndexes <- myTokenizer(sampleText) 
myIndexes
sampleText[myIndexes]

# Use other tokenizers from tm
whitespace_tokenizer(sampleText) # tokenizes by treating any sequence of whitespace characters as a separator.
blankline_tokenizer(sampleText) # tokenizes by treating any sequence of blank lines as a separator.
wordpunct_tokenizer(sampleText) # tokenizes by matching sequences of alphabetic characters and sequences of (non-whitespace) non-alphabetic characters.

# Tokenizers from other packages
# tokenize is a function included with the tau: Text Analysis Utilities package. 
# The tokenizers package includes shingled n-grams, skip n-grams, words, word stems, sentences, paragraphs, characters, shingled characters, lines, tweets, Penn Treebank, and regular expressions, as well as functions for counting characters, words, and sentences, and a function for splitting longer texts into separate documents,from tokenizers. 
# The textreuse package provides shingled n-gram, skip n-gram, and other tokenizers.
