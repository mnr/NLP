# Lemmatization and Stemming

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

library(textstem)

sampleText <- "You will rejoice to hear that no disaster has accompanied the
commencement of an enterprise which you have regarded with such evil
forebodings. I arrived here yesterday, and my first task is to assure
my dear sister of my welfare and increasing confidence in the success
of my undertaking."

lemma_dictionary <- make_lemma_dictionary(sampleText, engine = 'hunspell')

lemmatize_strings(sampleText, dictionary = lemma_dictionary)

# Lemmatize and Stemming

# Compare the original text to the effects of lemmatizing and stemming. With
# lemmatizing, words are replaced. With stemming, words are shortened. Both
# methods have their advantages.

lemma_dictionary <- make_lemma_dictionary(sampleText, engine = 'hunspell')
lemma_dictionary

# The Lemma Dictionary 
# The result is a printout of lemma_dictionary which is
# nothing more than a data.frame. It has two columns: token and lemma. token
# contains the original word. lemma contains the word resulting from a lookup in
# the hunspell dictionary. Look again at the text resulting from lemmatizing the
# original text, then the lemmatized version, then compare these two paragraphs
# to lemma_dictionary. These are the words which have been replaced. Adding
# words to the dictionary would be a simple case of adding a matching data.frame
# with rbind( ).
