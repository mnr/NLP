# Lemmatization and Stemming

# install.packages("textstem")
library(textstem)

# some text to experiment with
myText <- "Before the Altar, bowed, he stands
          With empty hands;
          Upon it perfumed offerings burn
          Wreathing with smoke the sacrificial urn.
          Not one of all these has he given,
          No flame of his has leapt to Heaven
          Firesouled, vermilion-hearted,
          Forked, and darted,
          Consuming what a few spare pence
          Have cheaply bought, to fling from hence
          In idly-asked petition."


# Lemmatization
# Synonyms are different words that mean the same thing. For example; “Ball,”
# “orb,” “globe,” and “sphere” indicate a similar object. Indicating the
# relationship between these words may enhance a statistical result. This is
# called Lemmatization - a process which groups words according to meanings. 

# For example: 
## Mice and Mouse 
## Good, Better, and Best 
## Now and Today
## see or saw (depending on its use as a verb or a noun.)

# This is in contrast to stemming which is simply looking for the root of a
# word. For example; walk, walked and walking can be stemmed from the root
# word walk. This can often be accomplished with an algorithm to compare the
# overlap of different words.
#
# Lemmatization requires some sort of dictionary to identify groupings of words
# by meaning. tm does not have a built-in method for lemmatization, but there
# are several R packages with this capability: 
## textstem - Tools for Stemming and Lemmatizing Text 
## udpipe - Tokenization, Parts of Speech Tagging, Lemmatization, and Dependency Parsing with the 'UDPipe' 'NLP' Toolkit 
## koRpus provides access to treetagger

# Lemmatize and Stemming

# Compare the original text to the effects of lemmatizing and stemming. With
# lemmatizing, words are replaced. With stemming, words are shortened. Both
# methods have their advantages.

# The Lemma Dictionary 
# The result is a printout of lemma_dictionary which is
# nothing more than a data.frame. It has two columns: token and lemma. token
# contains the original word. lemma contains the word resulting from a lookup in
# the hunspell dictionary. Look again at the text resulting from lemmatizing the
# original text, then the lemmatized version, then compare these two paragraphs
# to lemma_dictionary. These are the words which have been replaced. Adding
# words to the dictionary would be a simple case of adding a matching data.frame
# with rbind( ).

lemma_dictionary <- make_lemma_dictionary(myText, engine = 'hunspell')

lemma_dictionary

lemmatize_strings(myText, dictionary = lemma_dictionary)
stemDocument(myText)

