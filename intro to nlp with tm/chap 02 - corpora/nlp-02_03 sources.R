library(tm)
library(readtext)

DataDirectory <- "./Muhammad_Iqbal"
fileList <- dir(path = DataDirectory, pattern = ".*.txt")

# dataframesource ----------

# readtext returns a data.frame
aDataframe <- readtext(paste0(DataDirectory, fileList))

# This code confirms the doc_id is unique 
if (nrow(aDataframe) == length(unique(aDataframe$doc_id))) {
  message("doc_id is unique")
} else {
  stop("doc_id is not unique")
}

aCorpus <- Corpus(DataframeSource(aDataframe))

summary(aCorpus)

# dirSource -----------

docDir <- DirSource(directory = "./Muhammad_Iqbal",
                    pattern = ".*.txt")

newCorpus <- Corpus(docDir)

summary(newVCorpus)

# URISource ----------

newCorpus <- Corpus(URISource(c("https://www.gutenberg.org/files/57317/57317-0.txt", 
                                "https://www.gutenberg.org/files/41707/41707-0.txt")))

summary(newCorpus)

# vectorSource ------------

vectorOfText <- c("twas brillig and the slithey toves", 
                  "did gyre and gimble in the wabes")
names(vectorOfText) <- c("firstLine", "secondLine")

aCorpus <- Corpus(VectorSource(vectorOfText))

summary(aCorpus)

# XMLSource -----------
library(XML)
library(xml2)

# set up an XMLreader
myXMLReader <- readXML(
  spec = list(
    author = list("node", "writer"),
    content = list("node", "description"),
    datetimestamp = list("function",
                         function(x)
                           as.POSIXlt(Sys.time(), tz = "GMT")),
    description = list("node", "@short"),
    heading = list("node", "caption"),
    id = list("function", function(x)
      tempfile()),
    origin = list("unevaluated", "My private bibliography"),
    type = list("node", "type")
  ),
  doc = PlainTextDocument()
)

# Import the XML and create a corpus
anXMLCorpus <- Corpus(XMLSource(x = "https://www.nasa.gov/rss/dyn/earth.rss",
                                reader = myXMLReader))

summary(anXMLCorpus)

# zipsource -----------
library(tm)

aZipCorpus <- Corpus(ZipSource("./Muhammad_Iqbal/Archive.zip"))

summary(aZipCorpus)

