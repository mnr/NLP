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

stemDocument(myText)

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
