#Carga de datos
housing <- read.csv("../data/hotel_bookings_miss.csv", header= TRUE, stringsAsFactors = FALSE)
#Inspeccion de datos
View(housing)
write.table(head(housing), file = "../outputs/head.txt", sep = "\t",row.names = TRUE, col.names = NA)
write.table(tail(housing), file = "../outputs/tail.txt", sep = "\t",row.names = TRUE, col.names = NA)
write.table(names(housing), file = "../outputs/names.txt", sep = "\t",row.names = TRUE, col.names = NA)
str(housing)
write.table(summary(housing), file = "../outputs/summary.txt", sep = "\t",row.names = TRUE, col.names = NA)











