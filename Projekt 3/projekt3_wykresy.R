source("projekt3_funkcje.R")


# #najwiecej start styczen 2016
# library(ggplot2)
# library(dplyr)
# a <- najwiecej_start(styczen)
# ggplot(data=a) + geom_bar(aes(x=Count_start, y=Station.Name), stat="Identity") + xlab("Liczba wypożyczeń") + ylab("Stacja") + ggtitle("Największa liczba wypożyczeń styczeń 2016")
           

# #najwiecej start luty 2016
# library(ggplot2)
# library(dplyr)
# b <- najwiecej_start(luty)
# ggplot(data=b) + geom_bar(aes(x=Count_start, y=Station.Name), stat="Identity") + xlab("Liczba wypożyczeń") + ylab("Stacja") + ggtitle("Największa liczba wypożyczeń luty 2016")


# #najwiecej start marzec 2016
# library(ggplot2)
# library(dplyr)
# c <- najwiecej_start(marzec16)
# ggplot(data=c) + geom_bar(aes(x=Count_start, y=Station.Name), stat="Identity") + xlab("Liczba wypożyczeń") + ylab("Stacja") + ggtitle("Największa liczba wypożyczeń marzec 2016")


# #najwiecej oddań styczen 2016
# library(ggplot2)
# library(dplyr)
# a <- najwiecej_stop(styczen)
# ggplot(data=a) + geom_bar(aes(x=Count_stop, y=Station.Name), stat="Identity") + xlab("Liczba zwrotów") + ylab("Stacja") + ggtitle("Największa liczba zwrotów styczeń 2016")


# #najwiecej oddań luty 2016
# library(ggplot2)
# library(dplyr)
# b <- najwiecej_stop(luty)
# ggplot(data=b) + geom_bar(aes(x=Count_stop, y=Station.Name), stat="Identity") + xlab("Liczba zwrotów") + ylab("Stacja") + ggtitle("Największa liczba zwrotów luty 2016")
# 
# #najwięcej oddań marzec 2016
# library(ggplot2)
# library(dplyr)
# c <- najwiecej_stop(marzec16)
# ggplot(data=c) + geom_bar(aes(x=Count_stop, y=Station.Name), stat="Identity") + xlab("Liczba zwrotów") + ylab("Stacja") + ggtitle("Największa liczba zwrotów marzec 2016")


# library(ggplot2)
# library(dplyr)
# a <- roznica(najwiecej_start(styczen),najwiecej_stop(styczen))
# ggplot(data=a) + geom_bar(aes(x=Result, y=Station.Name), stat="Identity") + xlab("Różnica") + ylab("Stacja") + ggtitle("Różnica liczby zwrotów i wypożyczeń styczeń 2016")

# library(ggplot2)
# library(dplyr)
# b <- roznica(najwiecej_start(luty),najwiecej_stop(luty))
# ggplot(data=b) + geom_bar(aes(x=Result, y=Station.Name), stat="Identity") + xlab("Różnica") + ylab("Stacja") + ggtitle("Różnica liczby zwrotów i wypożyczeń luty 2016")
# 
# library(ggplot2)
# library(dplyr)
# c <- roznica(najwiecej_start(marzec16),najwiecej_stop(marzec16))
# ggplot(data=c) + geom_bar(aes(x=Result, y=Station.Name), stat="Identity") + xlab("Różnica") + ylab("Stacja") + ggtitle("Różnica liczby zwrotów i wypożyczeń marzec 2016")



# #procent subskrybentów 2018
# x <- procent(marzec18)
# pie(x, labels = c("Klienci", "Subskrybenci"), main = "Stosunek klientów do subskrybentów 2018")

# #procent subskrybentów 2017
# x <- procent(marzec17)
# pie(x, labels = c("Klienci", "Subskrybenci"), main = "Stosunek klientów do subskrybentów 2017")

# #procent subskrybentów 2016
# x <- procent(marzec16)
# pie(x, labels = c("Klienci", "Subskrybenci"), main = "Stosunek klientów do subskrybentów 2016")






#wiek razem marzec 18
# e <- wiek(marzec18)
# e <- e[,-1]
#  barplot(as.matrix(e),
#          main = "Udział poszczególnych wieków i płci",
#          xlab = "Wiek",
#          col = c("pink","lightblue", "grey")
#  )
#  legend("topleft",
#         c("Kobiety","Mężczyźni", "Brak danych"),
#         fill = c("pink","lightblue", "grey")
#  )
 
 #wiek razem marzec 17
 # f <- wiek(marzec17)
 # f <- f[,-1]
 # barplot(as.matrix(f),
 #         main = "Udział poszczególnych wieków i płci",
 #         xlab = "Wiek",
 #         col = c("pink","lightblue", "grey")
 # )
 # legend("topleft",
 #        c("Kobiety","Mężczyźni", "Brak danych"),
 #        fill = c("pink","lightblue", "grey")
 # )
 
 
 #wiek razem marzec 16
  g <- wiek(marzec16)
  g <- g[,-1]
  barplot(as.matrix(g),
          main = "Udział poszczególnych wieków i płci",
          xlab = "Wiek",
          col = c("pink","lightblue", "grey")
  )
  legend("topleft",
         c("Kobiety","Mężczyźni", "Brak danych"),
         fill = c("pink","lightblue", "grey")
  )
 




#płeć subskrybentów 2018
# x <- wiek(marzec18)
# x[8] = x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
# dplyr::rename(x, suma=Do20.1) ->x
# pie(as.vector(x$suma), labels = c("Kobiety", "Mężczyźni", "Brak danych"),col = c("pink","lightblue", "grey"), main = "Płeć subskrybentów 2018")

#płeć subskrybentów 2017
# x <- wiek(marzec17)
# x[8] = x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
# dplyr::rename(x, suma=Do20.1) ->x
# pie(as.vector(x$suma), labels = c("Kobiety", "Mężczyźni", "Brak danych"),col = c("pink","lightblue", "grey"), main = "Płeć subskrybentów 2017")
# 
# #płeć subskrybentów 2016
# x <- wiek(marzec16)
# x[8] = x[2]+x[3]+x[4]+x[5]+x[6]+x[7]
# dplyr::rename(x, suma=Do20.1) ->x
# pie(as.vector(x$suma), labels = c("Kobiety", "Mężczyźni", "Brak danych"),col = c("pink","lightblue", "grey"), main = "Płeć subskrybentów 2016")



#godziny szczytów styczeń
# a <-godzina(styczen)
# a <- a[, -1]
# barplot(t(as.matrix(a)),
#         main = "Godziny szczytów w styczniu",
#         xlab = "Godziny", names.arg = c(0:23))
# 
# #godziny szczytów luty
# b <-godzina(luty)
# b <- b[, -1]
# barplot(t(as.matrix(b)),
#         main = "Godziny szczytów w lutym",
#         xlab = "Godziny", names.arg = c(0:23))
# 
# #godziny szczytów marzec
# c <-godzina(marzec16)
# c <- c[, -1]
# barplot(t(as.matrix(c)),
#         main = "Godziny szczytów w marcu",
#         xlab = "Godziny", names.arg = c(0:23))
# 
# #godziny szczytów kwiecień
# d <-godzina(kwiecien)
# d <- d[, -1]
# barplot(t(as.matrix(d)),
#         main = "Godziny szczytów w kwietniu",
#         xlab = "Godziny", names.arg = c(0:23))

