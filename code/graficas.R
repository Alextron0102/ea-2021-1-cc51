hotel_data <- read.csv("hotel_bookings.csv", header = TRUE, sep = ",")
View(hotel_data)

# a
reservas <- table(hotel_data$hotel)
a <- barplot(reservas, main="Reservas por hotel", yaxt='n', col=rgb(0.1, 0.1, 0.8, 0.2),ylim=c(0,90000))
text(a, reservas, pos = 3, labels=as.character(reservas))

# b, c, d
counts <- table(hotel_data$arrival_date_month, hotel_data$arrival_date_year)
counts <- counts[c(5, 4, 8, 1, 9, 7, 6, 2, 12, 11, 10, 3),]
barplot(counts, main="Reservas por mes y año", legend=rownames(counts), beside=TRUE,args.legend=list(x="topright", inset=-0.05, cex = 0.6))

# e
menores <- table(hotel_data$babies|hotel_data$children)
menores <- menores[c(2, 1)]
a <- barplot(menores, main="Menores en la reserva", names.arg=c("SI", "NO"), yaxt='n', col=rgb(0.8, 0.4, 0.0), ylim=c(0,150000))
text(a, menores, pos = 3, labels=as.character(menores))

# f
estacionamiento <- table(hotel_data$required_car_parking_spaces>0)
estacionamiento <- estacionamiento[c(2, 1)]
a <- barplot(estacionamiento, main="Estacionamiento requerido", names.arg=c("SI", "NO"), yaxt='n', col=rgb(0.8, 0.1, 0.6), ylim=c(0,150000))
text(a, estacionamiento, pos = 3, labels=as.character(estacionamiento))

# g
cancel <- table(hotel_data$arrival_date_month, hotel_data$is_canceled)
cancel <- cancel[,2]
cancel <- cancel[c(5, 4, 8, 1, 9, 7, 6, 2, 12, 11, 10, 3)]
barplot(cancel, main="Cancelaciones por año", col=rgb(0.0, 0.5, 0.5))






