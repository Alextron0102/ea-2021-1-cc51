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
#Tecnicas de normalización
#Omision
housing.limpio.omision <- housing[complete.cases(housing),]
#Generacion de valores a partir del MAS:
random.df <- function(df, cols){ 
  nombres <- names(df) 
  for (col in cols) {
    df[nombres[col]] <- rand.valor(df[,col])
  }
  df
}
rand.valor <- function(x){ 
  faltantes <- is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  valorado <- x
  valorado[faltantes] <- sample(x.obs, tot.faltantes, replace = TRUE)
  return (valorado)
}
housing.limpio.mas <- random.df(housing, c(3,4,5,6,7,8,9,10,11,12,26))
write.table(housing.limpio.mas, file = "../outputs/housinglimpiomas.txt", sep = "\t",row.names = TRUE, col.names = NA)
sin_valor(housing.limpio.mas)
#Generacion de valores con la media de la población
media.poblacion <- function(df, cols){
  nombres <- names(df)
  for(col in cols){
    df[nombres[col]] <- ifelse(is.na(df[,col]), mean(df[,col], na.rm = TRUE), df[,col])
  }
  df
}
housing.limpio.media <- media.poblacion(housing, c(3,4,6,7,8,9,10,11,12,26))
write.table(housing.limpio.media, file = "../outputs/housinglimpiomedia.txt", sep = "\t",row.names = TRUE, col.names = NA)
sin_valor(housing.limpio.media)

