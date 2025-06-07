
library(tidyverse)
library(tm)

# This function get the anime data and clean it.
# @return anime data.frame
getAnimeData <- function(){
  #Getting anime data  
  anime <- read.csv("./data/anime.csv")
  
  #Paste all relevant data and remove unnecessary punctuation
  anime$dataForIA <- paste(anime$genre,anime$type,anime$episodes) %>%
    removePunctuation()
  return(anime)
}
  
