styczen <- read.csv("JC-20161-citibike-tripdata.csv")
luty <- read.csv("JC-20162-citibike-tripdata.csv")
marzec16 <- read.csv("JC-20163-citibike-tripdata.csv")
marzec17 <- read.csv("JC-201703-citibike-tripdata.csv")
marzec18 <- read.csv("JC-201803-citibike-tripdata.csv")
kwiecien <- read.csv("JC-201604-citibike-tripdata.csv")
colnames(marzec18)<- c("Trip.Duration", "Start.Time", "Stop.Time", "Start.Station.ID", "Start.Station.Name", "Start.Station.Latitude", "Start.Station.Longitude",
                       "End.Station.ID", "End.Station.Name", "End.Station.Latitude", "End.Station.Longitude", "Bike.ID",  "User.Type", "Birth.Year", "Gender")

najwiecej_start <- function(tabela){
  x <- aggregate(x = tabela$Start.Station.Name, by = tabela["Start.Station.Name"], FUN = length)
  x <- x[order(x$x, decreasing = TRUE), ]
  rownames(x) <-NULL
  colnames(x) <- c("Station.Name", "Count_start")
  return(x)
}

najwiecej_stop <- function(tabela){
  x <- aggregate(x = tabela$End.Station.Name, by = tabela["End.Station.Name"], FUN = length)
  x <- x[order(x$x, decreasing = TRUE), ]
  rownames(x) <-NULL
  colnames(x) <- c("Station.Name", "Count_stop")
  return(x)
}

roznica <- function(start, stop){
  library("dplyr")
  x <- full_join(start, stop, by="Station.Name")
  x$Count_start[is.na(x$Count_start)] <- 0
  x$Count_stop[is.na(x$Count_stop)] <- 0
  x[4] <- x[3]-x[2]
  colnames(x) <- c("Station.Name","Taken", "Returned", "Result")
  return(x)
}


procent <- function(tabela){
  przejazdy <- nrow(tabela)
  tabela <- tabela[tabela$User.Type == "Customer", ]
  klienci <- nrow(tabela)
  wynik <- c(klienci, przejazdy-klienci)
  return(wynik)
}

wiek <- function(tabela){
  library("dplyr")
  rok <-as.numeric(substring(tabela[2,2], 1, 4))
  tabela <- tabela[tabela$User.Type == "Subscriber", ]
  
  do20 <- tabela[tabela$Birth.Year >= (rok-20), c("Gender", "User.Type")]
  do20 <- aggregate(x = do20$Gender, by=do20["Gender"], FUN = length)
  colnames(do20)<-c("Gender", "Do20")
  
  do30 <- tabela[tabela$Birth.Year >= (rok-30) & tabela$Birth.Year < (rok-20), c("Gender", "User.Type")]
  do30 <- aggregate(x = do30$Gender, by=do30["Gender"], FUN = length)
  colnames(do30)<-c("Gender", "Do30")
  
  do40 <- tabela[tabela$Birth.Year >= (rok-40) & tabela$Birth.Year < (rok-30), c("Gender", "User.Type")]
  do40 <- aggregate(x = do40$Gender, by=do40["Gender"], FUN = length)
  colnames(do40)<-c("Gender", "Do40")
  
  do50 <- tabela[tabela$Birth.Year >= (rok-50) & tabela$Birth.Year < (rok-40), c("Gender", "User.Type")]
  do50 <- aggregate(x = do50$Gender, by=do50["Gender"], FUN = length)
  colnames(do50)<-c("Gender", "Do50")
  
  do60 <- tabela[tabela$Birth.Year >= (rok-60) & tabela$Birth.Year < (rok-50), c("Gender", "User.Type")]
  do60 <- aggregate(x = do60$Gender, by=do60["Gender"], FUN = length)
  colnames(do60)<-c("Gender", "Do60")
  
  powyzej60 <- tabela[tabela$Birth.Year < (rok-60) , c("Gender", "User.Type")]
  powyzej60 <- aggregate(x = powyzej60$Gender, by=powyzej60["Gender"], FUN = length)
  colnames(powyzej60)<-c("Gender", "Powyzej60")
  
  full_join(do20, do30, by="Gender") %>% full_join(do40, by="Gender") %>% 
    full_join(do50, by="Gender") %>%full_join(do60, by="Gender") %>%full_join(powyzej60, by="Gender") -> result
  result[is.na(result)] <- 0
  result <- result[order(result$Gender, decreasing = TRUE), ]
  rownames(result) <- NULL
  return(result)
  
}

godzina <- function(tabela){
  library(dplyr)
  
  wybor <- function(tabela){
    tabela <- substring(tabela, 12,13)
    return(tabela)
  }
  
  select(tabela, Start.Time) %>% lapply(wybor) %>% lapply(as.integer)  %>% cbind(tabela)-> wynik
   
  colnames(wynik) <- c("Hour","Trip.Duration", "Start.Time", "Stop.Time", "Start.Station.ID", "Start.Station.Name", "Start.Station.Latitude", "Start.Station.Longitude",
                        "End.Station.ID", "End.Station.Name", "End.Station.Latitude", "End.Station.Longitude", "Bike.ID",  "User.Type", "Birth.Year", "Gender")
  select(wynik, c("Hour", "Gender")) -> wynik
  wynik <- aggregate(x = wynik$Hour, by=wynik["Hour"], FUN = length)
  colnames(wynik) <- c("Hour", "Count")
  return(wynik)
}


head(roznica(najwiecej_start(styczen),najwiecej_stop(styczen)))
