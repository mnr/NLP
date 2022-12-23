# quanteda sentiment analysis

# install.packages("quanteda")
# 
# install.packages("devtools")
# devtools::install_github("quanteda/quanteda.sentiment") 

library(quanteda)
library(quanteda.sentiment)

dfm(tokens(data_dictionary_geninqposneg))
dfm(tokens(data_dictionary_LoughranMcDonald))
dfm(tokens(data_dictionary_NRC))
temp <- as.matrix(dfm(tokens(data_dictionary_NRC)))[,1:5]


temp <- data_dictionary_geninqposneg[2, "features" > 0]
sample(unlist(temp), 10)
