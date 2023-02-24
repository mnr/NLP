library(tm) 

# corpus --------

newCorpus <- Corpus(DirSource(directory = "poetry",
                              pattern = "*.txt"))

# show structure of the new corpus
str(newCorpus)
class(newCorpus)

# VCorpus ---------
# volatile corpus
# list the files in the local directory
list.files()

newVCorpus <- VCorpus(DirSource(directory = "poetry",
                                pattern = "*.txt"))

# where is a VCorpus stored?
# another list to compare with the above
list.files() # not here

# list objects in memory
ls() # there it is

# SimpleCorpus --------
# Optimized for common usage. 
# punctuation is stripped
# only DataframeSource, DirSource and VectorSource are supported
newSimpleCorpus <- SimpleCorpus(DirSource(directory = "poetry",
                                          pattern = "*.txt"))

summary(newSimpleCorpus)

# PCorpus ----------
# permanent corpus
# not limited by volatile memory
# but...you can't (easily) access it after a session ends
newPCorpus <- PCorpus(DirSource(directory = "poetry", 
                                pattern = "*.txt"),
                      dbControl = (list(dbName = "myPCorpus.rds", 
                                        dbType = "RDS")))

list.files() # look! there it is!
inspect(newPCorpus)
