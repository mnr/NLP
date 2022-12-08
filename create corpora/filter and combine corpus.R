# tm_filter and tm_index

newVCorpus[[1]]$content
grepl("the conception of Love is", newVCorpus$content)

tm_filter(newVCorpus, 
          FUN = function(x) grepl("the conception of Love is", content(x)))

tm_index(newVCorpus, 
          FUN = function(x) grepl("the conception of Love is", x))

tm_filter(acq, 
          FUN = function(x) grepl("Computer Terminal Systems", content(x)))

tm_index(acq, 
         FUN = function(x) grepl("Computer Terminal Systems", x))
