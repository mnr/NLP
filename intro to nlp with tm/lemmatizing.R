# lemmatization

install.packages("textstem")
library(textstem)

sampleText <- "You will rejoice to hear that no disaster has accompanied the
commencement of an enterprise which you have regarded with such evil
forebodings. I arrived here yesterday, and my first task is to assure
my dear sister of my welfare and increasing confidence in the success
of my undertaking."

lemma_dictionary <- make_lemma_dictionary(sampleText, engine = 'lexicon')
lemmatize_strings(sampleText, dictionary = lemma_dictionary)
lemmatize_strings(sampleText)
stem_strings(sampleText)
