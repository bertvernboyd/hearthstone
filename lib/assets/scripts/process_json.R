library("jsonlite")
library("tidyr")  
library("dplyr")

process_json <- function()
{
  data <- fromJSON(txt = "../json/AllSets.json", flatten = TRUE)
  data <- add_set_names_as_column(data)
  data <- tidy_mechanics(data)
  
  names(data)[[1]] <- "tag"
  
  data <- data %>%
    filter(type != "Enchantment" & type != "Hero" & type != "Hero Power" & collectible == TRUE & set != "Promotion") %>%
    select(tag, name, type, rarity, cost, attack, health, mechanics, playerClass) %>%
    arrange(name)
  
  #download_card_images(data)
  
  
  write_csv(data)
  data
}

add_set_names_as_column <- function(data)
{
  set_names <- names(data)
  
  data[[1]]$set <- rep(set_names[1],nrow(data[[1]]))
  aggregate_data <- data[[1]]
  for(i in 2:length(names(data)))
  {
    data[[i]]$set <- rep(set_names[i],nrow(data[[i]]))
    aggregate_data <- aggregate_data %>% bind_rows(data[[i]])
  }
  aggregate_data
}

tidy_mechanics <- function(data)
{
  m<-data$mechanics
  m<-as.character(m)
  
  m<-gsub("NULL",NA,m)
  m<-gsub("c.\"","",m)
  m<-gsub("\", \""," ",m)
  m<-gsub("\".","",m)

  data$mechanics <- m
  data
}

download_card_images <- function(data)
{
  for(i in 1:length(data$tag))
  {
    url = paste("http://wow.zamimg.com/images/hearthstone/cards/enus/original/",data$tag[i],".png", sep="")
    dest = paste("../images/",data$tag[i],".png",sep="")
    download.file(url, dest, method = "curl")
  }
}

write_csv <- function(data)
{
  url = "../csv/cards.csv"
  write.csv(data, url, row.names = FALSE, quote=FALSE, na = "")
}
