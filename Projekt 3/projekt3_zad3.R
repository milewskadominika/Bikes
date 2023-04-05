marzec16 <- read.csv("JC-20163-citibike-tripdata.csv")
marzec17 <- read.csv("JC-201703-citibike-tripdata.csv")
marzec18 <- read.csv("JC-201803-citibike-tripdata.csv")
colnames(marzec18)<- c("Trip.Duration", "Start.Time", "Stop.Time", "Start.Station.ID", "Start.Station.Name", "Start.Station.Latitude", "Start.Station.Longitude",
                       "End.Station.ID", "End.Station.Name", "End.Station.Latitude", "End.Station.Longitude", "Bike.ID",  "User.Type", "Birth.Year", "Gender")

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
  return(result)
  
}

wiek(marzec16)
wiek(marzec17)
wiek(marzec18)


