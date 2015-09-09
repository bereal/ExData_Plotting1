library(sqldf)

query = 'select * from file where Date in ("1/2/2007", "2/2/2007")'
rawData <- read.csv.sql('household_power_consumption.txt', sql = query, sep = ';')
data <- transform(rawData,
                  Timestamp = strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S'))

png('plot2.png', width = 480, height = 480)

with(data, plot(Global_active_power ~ Timestamp,
                type = 'l', col = 'black',
                ylab = 'Global Active Power (kilowatts)'))

dev.off()
