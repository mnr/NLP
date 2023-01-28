library(tm) 

# list the files in the local directory
list.files()

docDir <- DirSource(directory = "./Muhammad_Iqbal/",
                    pattern = ".*.txt")

newVCorpus <- VCorpus(docDir)

# another list to compare with the above
list.files()

# list objects in memory
ls()
