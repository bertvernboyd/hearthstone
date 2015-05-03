library("jsonlite")
library("tidyr")  
library("dplyr")

process_json <- function()
{
  data <- fromJSON(txt = "../json/AllSets.json", flatten = TRUE)
  
  set_names <- names(data)
  
  data[[1]]$set <- rep(set_names[1],nrow(data[[1]]))
  aggregate_data <- data[[1]]
  for(i in 2:length(names(data)))
  {
    data[[i]]$set <- rep(set_names[i],nrow(data[[i]]))
    aggregate_data <- aggregate_data %>% bind_rows(data[[i]])
  }
  
  aggregate_data <- aggregate_data %>%
    filter(type != "Enchantment" & type != "Hero" & type != "Hero Power" & collectible == TRUE & set != "Promotion") %>%
    select(id, name, type, rarity, cost, attack, health, playerClass) %>%
    arrange(name)
  
  download_card_images(aggregate_data %>% select(id))
  aggregate_data
}

download_card_images <- function(ids)
{
  for(i in 1:length(ids))
  {
    #url = paste("http://wow.zamimg.com/images/hearthstone/cards/enus/original/",aggregate_data$id[i],".png", sep="")
    #dest = paste("../images/",aggregate_data$id[i],".png",sep="")
    #download.file(url, dest, method = "curl")
  }
}
