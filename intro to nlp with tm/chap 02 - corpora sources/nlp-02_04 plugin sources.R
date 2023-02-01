# NOTE: many of these sources are for demonstration only
# This code will show many are not available

library(tm)

#MBoxSource -------
library(tm.plugin.mail)
aMBoxCorpus <- Corpus(MBoxSource("fictionalMailbox.mbox"))

# Alceste -----
library(tm.plugin.alceste)

anAlcesteCorpus <- Corpus(AlcesteSource("fictionalAlceste"))

# Europresse -------
library(tm.plugin.europresse)

aEuropresseCorpus <- Corpus(EuropressSource("fictionalEuropresse"))

# LexisNexis --------------
library(tm.plugin.lexisnexis)

aLexisNexisCorpus <- Corpus(LexisNexisSource("fictionalLexisNexis"))

