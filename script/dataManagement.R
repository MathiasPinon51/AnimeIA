
library(tidyverse)
library(tm)
library(textstem)

# This function get the anime data and clean it.
# @return anime data.frame
getAnimeData <- function(){
  #Getting anime data  
  anime <- read.csv("./data/anime.csv")
  
  #Paste all relevant data and clean it
  anime$dataForIA <- paste(anime$Genre, anime$Type, anime$numEpisode, anime$KeyWord) %>%
    tolower() %>%
    removePunctuation() %>%
    removeWords(stopwords("en")) %>%
    stripWhitespace() %>%
    strsplit(split = " ") %>%
    lapply(lemmatize_words) %>%
    sapply(paste, collapse = " ")
  
  return(anime)
}
  
