dat <- read.csv('household_power_consumption.txt', sep=';',
                colClass = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'),
                na.strings = c('?'))
dat <- subset(dat, Date %in% c('1/2/2007', '2/2/2007'))
dat$DateTime <- strptime(paste(dat$Date, dat$Time, sep=' '), '%d/%m/%Y %H:%M:%S')

png('plot2.png')
plot(dat$DateTime, dat$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()
