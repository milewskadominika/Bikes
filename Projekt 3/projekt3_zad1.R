styczen <- read.csv("JC-20161-citibike-tripdata.csv")
luty <- read.csv("JC-20162-citibike-tripdata.csv")
marzec <- read.csv("JC-20163-citibike-tripdata.csv")

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




roznica(najwiecej_start(styczen), najwiecej_stop(styczen))
roznica(najwiecej_start(luty), najwiecej_stop(luty))
roznica(najwiecej_start(marzec), najwiecej_stop(marzec))
