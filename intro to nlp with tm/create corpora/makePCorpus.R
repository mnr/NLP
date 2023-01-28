library(tm) 
docDir <- DirSource(directory = "./Muhammad_Iqbal/")

newPCorpus <- PCorpus(docDir, 
                      dbControl = (list(dbName = "myPCorpus.rds", 
                                        dbType = "RDS")))

list.files()
summary(newPCorpus)
