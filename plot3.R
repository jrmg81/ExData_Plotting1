electric <- read.table('./r/household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', as.is = 1:9)
electric$DateTime <- paste(electric[, 1], electric[, 2], sep = ' ')
electric$DateTime <- strptime(electric[, 10], '%d/%m/%Y %H:%M:%S')
datos <- electric[electric$DateTime >= strptime('01/02/2007 00:00:00', '%d/%m/%Y %H:%M:%S') & electric$DateTime <= strptime('03/02/2007 00:00:00', '%d/%m/%Y %H:%M:%S'),]
Sys.setlocale('LC_TIME', 'en_US.UTF-8')
daterange <- c(min(datos$DateTime), max(datos$DateTime))

png(filename = './r/plot3.png')
plot(datos$DateTime, datos$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '', xaxt = 'n', col = 'BLACK')
lines(datos$DateTime, datos$Sub_metering_2, col = 'RED')
lines(datos$DateTime, datos$Sub_metering_3, col = 'BLUE')
axis.POSIXct(1, at = seq(daterange[1], daterange[2], by = 'day'))
legend('topright', lty = 1, col = c('BLACK','RED', 'BLUE'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()
