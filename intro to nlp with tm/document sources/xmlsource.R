library(tm)
library(XML)
library(xml2)


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

anXMLCorpus <- Corpus(XMLSource(x = "https://www.nasa.gov/rss/dyn/earth.rss",
                      reader = myXMLReader))

summary(anXMLCorpus)
