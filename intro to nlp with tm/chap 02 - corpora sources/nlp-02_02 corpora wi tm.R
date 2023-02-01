library(tm) 

# corpus --------

docDir <- DirSource(directory = "./Muhammad_Iqbal",
                    pattern = ".*.txt")

newCorpus <- Corpus(docDir)

# show structure of the new corpus
str(newCorpus)

# Here is the Corpus command with all arguments defined --------

newVCorpus <- Corpus(
  x = DirSource(directory = "./Muhammad_Iqbal/", 
                pattern = ".*.txt"),
  readerControl = list(reader = readDataframe, 
                       language = "en")
)

# VCorpus ---------
# list the files in the local directory
list.files()

docDir <- DirSource(directory = "./Muhammad_Iqbal",
                    pattern = ".*.txt")

newVCorpus <- VCorpus(docDir)

# another list to compare with the above
list.files()

# list objects in memory
ls()

# SimpleCorpus --------
docDir <- DirSource(directory = "./Muhammad_Iqbal",
                    pattern = ".*.txt")

newSimpleCorpus <- SimpleCorpus(docDir)

summary(newSimpleCorpus)

# PCorpus ----------
docDir <- DirSource(directory = "./Muhammad_Iqbal",
                    pattern = ".*.txt")

newPCorpus <- PCorpus(docDir, 
                      dbControl = (list(dbName = "myPCorpus.rds", 
                                        dbType = "RDS")))

list.files()
inspect(newPCorpus)