electric <- read.table('./r/household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?', as.is = 1:9)
electric$DateTime <- paste(electric[, 1], electric[, 2], sep = ' ')
electric$DateTime <- strptime(electric[, 10], '%d/%m/%Y %H:%M:%S')
datos <- electric[electric$DateTime >= strptime('01/02/2007 00:00:00', '%d/%m/%Y %H:%M:%S') & electric$DateTime <= strptime('03/02/2007 00:00:00', '%d/%m/%Y %H:%M:%S'),]

png(filename = './r/plot1.png')
hist(datos$Global_active_power, main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', col = 'RED')
dev.off()
