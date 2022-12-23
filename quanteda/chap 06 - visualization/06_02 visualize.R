# quanteda.textplots

# install.packages("quanteda")
# install.packages("quanteda.textplots")

library(quanteda)
library(quanteda.textplots)

load(file = "quanteda/chap 04 - dfm/mydfm.rds")

# wordcloud
textplot_wordcloud(myDFM)

# wordcloud with changes
smallerDFM <- dfm_subset(myDFM, subset = myDFM$Year > 2000)
ndoc(smallerDFM)

textplot_wordcloud(smallerDFM, 
                   min_count = 10, 
                   color = topo.colors(20))

# compare one document against others
mykey <- textstat_keyness(smallerDFM, target = 3)
textplot_keyness(mykey, n = 10)

# plot xray - where are keywords
mykwic <- kwic(tokens(data_corpus_inaugural), pattern = "government")
textplot_xray(mykwic)
