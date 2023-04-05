styczen <- read.csv("JC-20161-citibike-tripdata.csv")
luty <- read.csv("JC-20162-citibike-tripdata.csv")
marzec <- read.csv("JC-20163-citibike-tripdata.csv")
kwiecien <- read.csv("JC-201604-citibike-tripdata.csv")


godzina <- function(tabela){
  library(dplyr)
  
  wybor <- function(tabela){
    tabela <- substring(tabela, 12,13)
    return(tabela)
  }
  
  select(tabela, Start.Time) %>% lapply(wybor) %>% cbind(tabela) -> wynik
  colnames(wynik) <- c("Hour","Trip.Duration", "Start.Time", "Stop.Time", "Start.Station.ID", "Start.Station.Name", "Start.Station.Latitude", "Start.Station.Longitude",
                       "End.Station.ID", "End.Station.Name", "End.Station.Latitude", "End.Station.Longitude", "Bike.ID",  "User.Type", "Birth.Year", "Gender")
  select(wynik, c("Hour", "Gender")) -> wynik
  wynik <- aggregate(x = wynik$Hour, by=wynik["Hour"], FUN = length)
  colnames(wynik) <- c("Hour", "Count")
  return(wynik)
}

godzina(kwiecien)