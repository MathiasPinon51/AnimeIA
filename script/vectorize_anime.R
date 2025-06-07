source("script/dataManagement.R")
library(text2vec)

# This function generates a Document-Term Matrix from 
# all anime data 
GenerateDTMAndVectorizer <- function(){
  #Using getAnimeData() function to get all cleaning anime data 
  animeData <- getAnimeData()
  
  #Creation of the Document-Term Matrix 
  it <- itoken(animeData)
  vocabulary <- create_vocabulary(it)
  vectorizer <- vocab_vectorizer(vocabulary())
  dtm <- create_dtm(it,vectorizer)
  return(list(dtm = dtm, vectorizer = vectorizer))
}
