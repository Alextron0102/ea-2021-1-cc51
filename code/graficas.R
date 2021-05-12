hotel_data <- read.csv("hotel_bookings.csv", header = TRUE, sep = ",")
View(hotel_data)

# a
reservas <- table(hotel_data$hotel)
View(reservas)
a <- barplot(reservas, main="Reservas por hotel", yaxt='n', col=rgb(0.1, 0.1, 0.8, 0.2))
text(a, reservas, labels=as.character(reservas))

# b, c, d
counts <- table(hotel_data$arrival_date_month, hotel_data$arrival_date_year)
counts <- counts[c(5, 4, 8, 1, 9, 7, 6, 2, 12, 11, 10, 3),]
barplot(counts, main="Reservas por mes y año", legend=rownames(counts), beside=TRUE,args.legend=list(x="topleft",inset=0.02))

# e
menores <- table(hotel_data$babies|hotel_data$children)
menores <- menores[c(2, 1)]
a <- barplot(menores, main="Menores en la reserva", names.arg=c("SI", "NO"), yaxt='n', col=rgb(0.8, 0.4, 0.0))
text(a, menores, labels=as.character(menores))

# f
estacionamiento <- table(hotel_data$required_car_parking_spaces>0)
a <- barplot(estacionamiento, main="Estacionamiento requerido", names.arg=c("SI", "NO"), yaxt='n', col=rgb(0.8, 0.1, 0.6))
text(a, estacionamiento, labels=as.character(estacionamiento))

# g
cancel <- table(hotel_data$arrival_date_month, hotel_data$is_canceled)
cancel <- cancel[,2]
cancel <- cancel[c(5, 4, 8, 1, 9, 7, 6, 2, 12, 11, 10, 3)]
barplot(cancel, main="Cancelaciones por año", yaxt='n', col=rgb(0.0, 0.5, 0.5))






