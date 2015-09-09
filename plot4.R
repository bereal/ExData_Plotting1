library(sqldf)

query = 'select * from file where Date in ("1/2/2007", "2/2/2007")'
rawData <- read.csv.sql('household_power_consumption.txt', sql = query, sep = ';')
data <- transform(rawData,
                  Timestamp = strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S'))

png('plot4.png', width = 480, height = 480)
par(mfrow = c(2, 2))


with(data, {
    plot(Global_active_power ~ Timestamp, type = 'l',
         xlab = ' ', ylab = 'Global active power');

    plot(Voltage ~ Timestamp, type = 'l', xlab = '');

    plot(Sub_metering_1 ~ Timestamp, type = 'l', col = 'black',
         xlab = '', ylab = 'Energy sub metering');
    lines(Sub_metering_2 ~ Timestamp, type = 'l', col = 'red');
    lines(Sub_metering_3 ~ Timestamp, type = 'l', col = 'blue');

    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), lwd = 1);

    plot(Global_reactive_power ~ Timestamp, type = 'l',
         xlab = '', ylab = 'Global reactive power');
})

dev.off()
