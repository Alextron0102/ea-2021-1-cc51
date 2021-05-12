#Carga de datos
housing <- read.csv("../data/hotel_bookings_miss.csv", header= TRUE, stringsAsFactors = FALSE)
#Pre-procesar datos
#identificación de datos NA:
sin_valor <- function(x){
  sum = 0
  for(i in 1:ncol(x))
  {
    cat("En la columna",colnames(x[i]),"total de valores NA:",colSums(is.na(x[i])),"\n")
  }
}
sin_valor(housing)
#identificación de datos NULL:
sin_valor <- function(x){
  sum = 0
  for(i in 1:ncol(x))
  {
    cat("En la columna",colnames(x[i]),"total de valores NULL:",colSums(x[i]=="NULL"),"\n")
  }
}
sin_valor(housing)