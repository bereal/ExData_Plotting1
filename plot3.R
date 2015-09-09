library(sqldf)

query = 'select * from file where Date in ("1/2/2007", "2/2/2007")'
rawData <- read.csv.sql('household_power_consumption.txt', sql = query, sep = ';')
data <- transform(rawData,
                  Timestamp = strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S'))

png('plot3.png', width = 480, height = 480)

with(data, {
    plot(Sub_metering_1 ~ Timestamp, type = 'l', col = 'black',
         ylab = 'Energy sub metering', xlab = ' ');
    lines(Sub_metering_2 ~ Timestamp, type = 'l', col = 'red');
    lines(Sub_metering_3 ~ Timestamp, type = 'l', col = 'blue')})

legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lwd = 1)

dev.off()
