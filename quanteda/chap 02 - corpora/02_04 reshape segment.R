# reshape and segment a corpus
library(quanteda)

# retrieve sample corpus
myCorpus <- corpus(data_char_sampletext)

summary(myCorpus)
myCorpus[2] # error - only one document

# corpus_reshape -------
# change units to documents, paragraphs, or sentences
reshapedCorpus <- corpus_reshape(myCorpus, to = "sentences")
summary(reshapedCorpus)
reshapedCorpus[2] # now works because reshapedCorpus is by sentence

# corpus_segment --------
# create sample data
data("data_corpus_inaugural")
data_corpus_inaugural
washSpeech <- data_corpus_inaugural[1] 

# segment sample data by \n\n
segmentedCorpus <- corpus_segment(washSpeech, 
                       pattern = "\n\n",
                       valuetype = "regex",
                       pattern_position = "after")

as.character(washSpeech) # before segmentation by \n
as.character(segmentedCorpus)[1] # after segmentation by \n
as.character(segmentedCorpus)[2]
