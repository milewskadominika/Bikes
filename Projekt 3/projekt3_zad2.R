marzec16 <- read.csv("JC-20163-citibike-tripdata.csv")
marzec17 <- read.csv("JC-201703-citibike-tripdata.csv")
marzec18 <- read.csv("JC-201803-citibike-tripdata.csv")
colnames(marzec18)<- c("Trip.Duration", "Start.Time", "Stop.Time", "Start.Station.ID", "Start.Station.Name", "Start.Station.Latitude", "Start.Station.Longitude",
                       "End.Station.ID", "End.Station.Name", "End.Station.Latitude", "End.Station.Longitude", "Bike.ID",  "User.Type", "Birth.Year", "Gender")




procent <- function(tabela){
  przejazdy <- nrow(tabela)
  tabela <- tabela[tabela$User.Type == "Customer", ]
  klienci <- nrow(tabela)
  wynik <- klienci/przejazdy * 100
  print(klienci)
  print(przejazdy)
  return(wynik)
}




