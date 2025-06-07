
library(tidyverse)
library(tm)


getAnimeData <- function(){
  #Getting anime data  
  anime <- read.csv("./data/anime.csv")
  
  anime$dataForIA <- paste(anime$genre,anime$type,anime$episodes) %>%
    removePunctuation()
  return(anime)
}
  