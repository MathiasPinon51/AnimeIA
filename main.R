source("script/userPromptManagement.R")  

#Script to send a prompt 

prompt <- ""

while (tolower(prompt) != "stop") {
  print("What kind of anime do you want? (Type 'stop' to quit): ") 
  prompt <- readline()
  
  if (tolower(prompt) != "stop") {
    animeResult <- promptManagement(prompt)
    print(animeResult)
  } else {
    cat("Goodbye!\n")
  }
}