library(tm) 

# corpus --------

newCorpus <- Corpus(DirSource(pattern = ".*.txt"))

# show structure of the new corpus
str(newCorpus)

# Here is the Corpus command with all arguments defined --------

newCorpus <- Corpus(x = DirSource(directory = "./",
                                   pattern = ".*.txt"),
                     readerControl = list(reader = readPlain, 
                                          language = "en")
                     )

# VCorpus ---------
# volatile corpus
# list the files in the local directory
list.files()

newVCorpus <- VCorpus(DirSource(pattern = ".*.txt"))

# where is a VCorpus stored?
# another list to compare with the above
list.files() # not here

# list objects in memory
ls() # there it is

# SimpleCorpus --------
docDir <- DirSource(directory = "./Muhammad_Iqbal",
                    pattern = ".*.txt")

newSimpleCorpus <- SimpleCorpus(DirSource(pattern = ".*.txt"))

summary(newSimpleCorpus)

# PCorpus ----------

newPCorpus <- PCorpus(DirSource(pattern = "*.txt"), 
                      dbControl = (list(dbName = "myPCorpus.rds", 
                                        dbType = "RDS")))

list.files() # look! there it is!
inspect(newPCorpus)
