
# read in power consumption data
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# subset it to just the two days
power <- subset(power, power$Date == '1/2/2007' | power$Date == '2/2/2007')

# convert dates and times
power$DateTime <- strptime(paste(power$Date, power$Time),"%d/%m/%Y %H:%M:%S", tz="")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# create chart and save it to a png file
par(mfrow = c(1,1))
plot(power$DateTime, power$Sub_metering_1, type="n", ylab="", xlab="")
points(power$DateTime, power$Sub_metering_1, type="l")
points(power$DateTime, power$Sub_metering_2, type="l", col="red")
points(power$DateTime, power$Sub_metering_3, type="l", col="blue")
title(ylab="Energy sub metering")

legend("topright", lty=1, col=c("black","red","blue"), legend=c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'))

dev.copy(png, file="plot3.png")
dev.off()
