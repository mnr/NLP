# explore mastodon

# install rtoot for access to mastodon and fediverse
# https://CRAN.R-project.org/package=rtoot
# install.packages("rtoot")
# install.packages("htm2txt")
# install.packages("stringr")
library(rtoot)
library(tibble)
library(htm2txt)
library(tm)
library(quanteda)
library(stringr)

# search all mastodon instances for use of #climatechange
# masto_instances <- get_fedi_instances(token = rstudioapi::askForPassword("token from instances.social/api/token"),
#                    n = 10000)
#saveRDS(masto_instances, file = "nlp climate change/mastodon_instances.RDS")
masto_instances <- readRDS(file = "nlp climate change/mastodon_instances.RDS")

masto_all_instance <- tibble()

for (anInstance in masto_instances$name) {
  print(anInstance)
  try(expr = {
      masto_anInstance <- get_timeline_hashtag(instance = anInstance,hashtag = "climatechange")
      masto_all_instance <- rbind(masto_all_instance,masto_anInstance)
    },
      )
}

# convert masto_all_instance$content from html to text
masto_all_instance$content <- htm2txt(masto_all_instance$content)

# extract interesting parts of URL
url_parts <- str_split(string = masto_all_instance$"url",
          pattern = "/")
masto_all_instance$instance <- sapply(url_parts, "[[", 3)
masto_all_instance$contributor <- sapply(url_parts, "[[", 4)

# don't use this. Use above str_split instead -----
# extract user names
# masto_all_instance$contributor <- str_extract(string = masto_all_instance$url,
#             pattern = "\\@[[:alpha:]]+")
# 
# # extract instance
# masto_all_instance$instance <- str_extract(string = masto_all_instance$URL,
#                                           pattern = "https:\/\/[[:alpha:]]+.[[:alpha:]]+")

# clean out duplicate lines
masto_all_instance <- unique(masto_all_instance)

# 1st column = doc_id. 2nd column = text
masto_col_names <- c("id","content","created_at",
"reblogs_count","favourites_count",
"replies_count","url","instance",
"contributor")
masto_all_instance <- masto_all_instance[ , masto_col_names]
# prep column names for quanteda
masto_col_names[1] <- "doc_id"
masto_col_names[2] <- "text"
names(masto_all_instance) <- masto_col_names

# # abandoned - unable to remove all punctuation except "#" --------
# # create corpus with tm and find top hashtags
# remove_punctuation_except_hash <- function(text) {
#   # unfortunately, this regex doesn't work
#   cleaned_text <- gsub("[^\\w\\s#]", "", text)
#   return(cleaned_text)
# }
# 
# climateChange_terms <- VCorpus(DataframeSource(masto_all_instance)) |>
#   DocumentTermMatrix(control = list(stopwords = TRUE,
#                      removePunctuation = remove_punctuation_except_hash)) |>
#                        #   removeSparseTerms(sparse = .1) |>
#                        as.matrix() |>
#                        colSums() |>
#                        sort(decreasing = TRUE) |>
#                        head(n = 10)

# quanteda solution ---------
climateChange_tokens <- corpus(masto_all_instance, 
                                 docid_field = "doc_id",
                                 text_field = "text",
                                 unique_docnames = FALSE) |>
  tokens(remove_punct = TRUE, remove_numbers = TRUE) |>
  tokens_remove(pattern = stopwords("en")) |>
  tokens_remove(pattern = "#*") |>
  #tokens_wordstem() |>
  dfm()

topfeatures(climateChange_tokens, n=50)

  
# use quanteda's dfm_keep to keep only hashtags ("#*")
climateChange_hashtags <- corpus(masto_all_instance, 
                               docid_field = "doc_id",
                               text_field = "text",
                               unique_docnames = FALSE) |>
  tokens() |>
  dfm() |>
  dfm_keep(pattern = "#*") |>
#  dfm_group(contributor)
# ...or...
  dfm_group(instance)

# Excellent - now I have a list of hashtags related to #climatechange
featnames(climateChange_hashtags)
topfeatures(climateChange_hashtags)
docfreq(climateChange_hashtags)
head(sort(ntoken(climateChange_hashtags), decreasing = TRUE))
head(sort(featfreq(climateChange_hashtags), decreasing = TRUE))

# identify top instances
#install.packages("quanteda.textstats")
library("quanteda.textstats")
climateChange_TopInstance <- corpus(masto_all_instance, 
                                 docid_field = "doc_id",
                                 text_field = "text",
                                 unique_docnames = FALSE) |>
  tokens() |>
  dfm() |>
  dfm_keep(pattern = "#*") |>
  dfm_group(instance) |>
  textstat_frequency(groups = instance) |>
  (\(x) {table(x$group)})() |>
  sort(decreasing = TRUE) 

climateChange_frequency <- textstat_frequency(climateChange_TopInstance,
                                              groups = instance)
table(climateChange_frequency$group)

only_climateChange <- climateChange_frequency[climateChange_frequency$feature %in% c("#climatechange"),]
only_climateChange <- only_climateChange[order(only_climateChange$frequency, decreasing = TRUE),]
head(only_climateChange, n = 15)
