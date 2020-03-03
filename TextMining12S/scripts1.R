#wlaczenie bibliotek

library(tm)
#zmienie katalog roboczy

workDir <- "D:\\Przetwarzanie języka naturalnego\\DS\\PIN\\TextMining12S"

setwd(workDir)

#defencja katalogów proektów
inputDir <- ".\\data"
outpurDir <- ".\\results"
scriptsDir  <- ".\\script"


#utwozrenie katalogu syjscowego

dir.create(outpurDir, showWarnings = FALSE)

#utwozrenia korpusu dokumentu
corpusDir <- paste(
  inputDir,"\\",
  "Literatura - streszczenia - preprocessed",
  sep = ""
  
  )

corpus <-  VCorpus (
  DirSource(
    corpusDir,
    pattern = "*.txt",
    encoding = "UTF-8"
  
  ),
  
readerControl = list(
    language = "pl_PL"
  )
)

#artttw

corpus  <- tm_map(VCorpus, removeNumbers)
corpus  <- tm_map(VCorpus, removePunctuation)
corpus  <- tm_map(VCorpus,stripWhitespace)
corpus  <- tm_map(VCorpus,content_transformer(tolower))

stoplistFle <- paste(inputDir,"\\",
                     "stopwords_pl.txt",
                     sep = ""
            
                     )
stopList <- readLines(stoplistFle, enoding = "UTF-8"
                      )

corpus <- tm_map(corpus,removeWords,stopList)
corpus <- tm_map(corpus,stripWhitespace)
                 
                 
