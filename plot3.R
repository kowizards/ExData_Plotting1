dat <- read.csv('household_power_consumption.txt', sep=';',
                colClass = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
                na.strings = c('?'))
dat <- subset(dat, Date %in% c('1/2/2007', '2/2/2007'))
dat$DateTime <- strptime(paste(dat$Date, dat$Time, sep=' '), '%d/%m/%Y %H:%M:%S')

png('plot3.png')
plot(dat$DateTime, dat$Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
points(dat$DateTime, dat$Sub_metering_2, type='l', col='red')
points(dat$DateTime, dat$Sub_metering_3, type='l', col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'))
dev.off()
