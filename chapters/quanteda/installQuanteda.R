# install quanteda

install.packages("quanteda")
install.packages("quanteda.textmodels")
install.packages("quanteda.textstats")
install.packages("quanteda.textplots")

# devtools package required to install quanteda from Github 
devtools::install_github("quanteda/quanteda.sentiment") 
devtools::install_github("quanteda/quanteda.tidy")

library(quanteda)
library(quanteda.textmodels)
library(quanteda.textstats)
library(quanteda.textplots)
library(quanteda.sentiment) 
library(quanteda.tidy)
