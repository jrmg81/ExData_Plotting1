electric <- read.table('./r/household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', as.is = 1:9)
electric$DateTime <- paste(electric[, 1], electric[, 2], sep = ' ')
electric$DateTime <- strptime(electric[, 10], '%d/%m/%Y %H:%M:%S')
datos <- electric[electric$DateTime >= strptime('01/02/2007 00:00:00', '%d/%m/%Y %H:%M:%S') & electric$DateTime <= strptime('03/02/2007 00:00:00', '%d/%m/%Y %H:%M:%S'),]
Sys.setlocale('LC_TIME', 'en_US.UTF-8')
daterange <- c(min(datos$DateTime), max(datos$DateTime))

png(filename = './r/plot2.png')
plot(datos$DateTime, datos$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '', xaxt = 'n')
axis.POSIXct(1, at = seq(daterange[1], daterange[2], by = 'day'))
dev.off()