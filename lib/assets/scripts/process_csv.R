library("tidyr")  
library("dplyr")
process_csv <- function()
{
  class_names <- c("Druid","Hunter","Mage","Paladin","Priest","Rogue","Shaman","Warlock","Warrior")
  class_data = list()
  for(i in 1:length(class_names))
  {
    path = paste("./lib/assets/csv/",tolower(class_names[i]),".csv", sep = "")
    class_name = class_names[i]
    class_data[[class_name]] <- read.csv(path, header = FALSE, stringsAsFactors = FALSE)
    
    names <- c("name","value")
    beyond_great <- class_data[[class_name]][,2:3]
    names(beyond_great) <- names
    great <- class_data[[class_name]][,4:5]
    names(great) <- names
    good <- class_data[[class_name]][,6:7]
    names(good) <- names
    above_average <- class_data[[class_name]][,8:9]
    names(above_average) <- names
    average <- class_data[[class_name]][,10:11]
    names(average) <- names
    below_average <- class_data[[class_name]][,12:13]
    names(below_average) <- names
    bad <- class_data[[class_name]][,14:15]
    names(bad) <- names
    terrible <- class_data[[class_name]][,16:17]
    names(terrible) <- names
    beyond_terrible <- class_data[[class_name]][,18:19]
    names(beyond_terrible) <- names
    
    class_data[[class_name]] <- bind_rows(beyond_great, great, good, above_average, average, below_average, bad, terrible, beyond_terrible)
    class_data[[class_name]]$value <- gsub("[^0-9]","",class_data[[class_name]]$value)
    class_data[[class_name]]$value <- as.numeric(class_data[[class_name]]$value)
    class_data[[class_name]] <- class_data[[class_name]] %>%
      filter(value != "") %>%
      arrange(desc(value))
  }

  write_csv(class_data)
  class_data
}

write_csv <- function(data)
{
  url = "./lib/assets/csv/scores.csv"
  write.csv(data, url, row.names = FALSE, quote=FALSE, na = "")
}
