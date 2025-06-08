
source("script/vectorize_anime.r")
library(text2vec)
library(lsa)
library(textstem)

# This function processes the user's input prompt and returns the anime 
# whose description has the highest similarity based on common words.
promptManagement <- function(promptUser){
  dtmAndVectorizer <- GenerateDTMAndVectorizer()
  
  #Clean the user pompt
  promptClean <- tolower(promptUser) %>%
    tolower() %>%
    removePunctuation() %>%
    removeWords(stopwords("en")) %>%
    stripWhitespace() %>%
    strsplit(split = " ") %>%
    lapply(lemmatize_words) %>%
    sapply(paste, collapse = " ")

  prompt_vec <- create_dtm(itoken(promptClean), dtmAndVectorizer$vectorizer)
  
  similarity <- sim2(dtmAndVectorizer$dtm, prompt_vec, method = "cosine")
  similarity_matrix <- as.matrix(similarity)

  # Identify the index of the anime with the highest similarity score
  top_indices <- order(similarity_matrix[,1], decreasing = TRUE)[1]
  
  anime <- read.csv("./data/anime.csv")
  
  
  return(anime$Anime_name[top_indices])
}


