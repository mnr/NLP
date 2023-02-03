# Use Stemming to Concentrate Meaning

# Consider the following words:
# walked
# walking
# walker
# walk
# These are derivatives of "walk." 

# When you calculate word frequency on text containing these words, 
# you may not want them to appear as individual instances. 
# Rather, it might make more sense for them to count as four 
# instances of "walk." Stemming is the process of reducing words 
# to the stem of the word.

library(tm)

# some text to experiment with
myText <- "It was in July, 1805, and the speaker was the 
well-known Anna Pavlovna Scherer, maid of honor and 
favorite of the Empress Marya Fedorovna. With these words 
she greeted Prince Vasili Kuragin, a man of high rank 
and importance, who was the first to arrive at her reception. 
Anna Pavlovna had had a cough for some days. 
She was, as she said, suffering from la grippe; 
grippe being then a new word in St. Petersburg, used
only by the elite."

stemDocument(myText)

# Stemming: wins and losses
# Win
## favorite - favorites becomes favorit
## word - words becomes word
## arrive - arrival - arrived - arriving becomes arriv
## being - be becomes be

# Loss
# grippe becomes gripp (mistaken for gripping or gripped)
# Prince becomes Princ (mistaken for principle)

# Stemming in tm is based on Porter's Stemming Algorithm. This algorithm is
# described in detail in Porter, M. "An algorithm for suffix stripping."
# Sometimes the algorithm works well, but sometimes it doesn't correctly
# interpret the context of the word. 

#Stemming language 
# stemDocument allows for
# the specification of a language for the stemming algorithm. Either ISO-639
# language codes or single words can be used. The complete list of languages is
# updated periodically and a link to the current list is included in the
# appendix. 
# Presently this list includes: Basque, Catalan, Danish, Dutch,
# English, Finnish, French, German, Hindi, Hungarian, Indonesian, Irish, Greek,
# Italian, Lithuanian, Norwegian, Portuguese, Romanian, Russian, Spanish,
# Swedish, and Turkish. 

stemDocument(myText, language = "turkish")

# As you might conclude, stemming isn't an exact science. It will take a bit of
# experimentation to produce useful results.
