# NOTE: many of these sources are for demonstration only
# This code will show many are not available

library(tm)

#MBoxSource -------
# https://takeout.google.com
# install.packages("tm.plugin.mail")
library(tm.plugin.mail)
aMBoxCorpus <- Corpus(MBoxSource("../../Downloads/All mail Including Spam and Trash.mbox"))
aMBoxCorpus[[1]]$content

# Alceste -----
# French news format
# http://www.image-zafar.com/sites/default/files/telechargements/formatage_alceste.pdf
# install.packages("tm.plugin.alceste")
library(tm.plugin.alceste)

anAlcesteCorpus <- Corpus(AlcesteSource("fictionalAlceste"))

# Europresse -------
library(tm.plugin.europresse)

aEuropresseCorpus <- Corpus(EuropressSource("fictionalEuropresse"))

# LexisNexis --------------
library(tm.plugin.lexisnexis)

aLexisNexisCorpus <- Corpus(LexisNexisSource("fictionalLexisNexis"))

