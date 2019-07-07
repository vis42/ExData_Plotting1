
# read in power consumption data
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# subset it to just the two days
power <- subset(power, power$Date == '1/2/2007' | power$Date == '2/2/2007')

# convert dates and times
power$DateTime <- strptime(paste(power$Date, power$Time),"%d/%m/%Y %H:%M:%S", tz="")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# subplots
par(mfrow = c(2,2))

# subplot 1
with(power, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# subplot 2
with(power, plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime"))

# subplot 3
with(power, {
  plot(DateTime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
  points(DateTime, Sub_metering_1, type="l")
  points(DateTime, Sub_metering_2, type="l", col="red")
  points(DateTime, Sub_metering_3, type="l", col="blue")
})
legend("topright", lty=1, bty="n", col=c("black","red","blue"), legend=c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'))

# subplot 4
with(power, plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))

dev.copy(png, file="plot4.png")
dev.off()

