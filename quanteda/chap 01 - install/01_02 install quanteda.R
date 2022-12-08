# install quanteda
# https://quanteda.io/articles/pkgdown/quickstart.html#currently-available-corpus-sources

install.packages("quanteda")
install.packages("quanteda.textmodels")
install.packages("quanteda.textstats")
install.packages("quanteda.textplots")

# these are also recommended
install.packages("readtext")
install.packages("spacyr") # requires python
install.packages("stopwords")

# the following packages require devtools for installation
install.packages("devtools")
devtools::install_github("quanteda/quanteda.corpora")
devtools::install_github("quanteda/quanteda.sentiment") 
devtools::install_github("quanteda/quanteda.tidy")
devtools::install_github("kbenoit/quanteda.dictionaries")

library(quanteda)
library(quanteda.textmodels)
library(quanteda.textstats)
library(quanteda.textplots)
library(quanteda.sentiment) 
library(quanteda.tidy)
library(quanteda.corpora)
library(quanteda.dictionaries)
library(readtext)
library(spacyr)
library(stopwords)
