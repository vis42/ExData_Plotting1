
# read in power consumption data
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# subset it to just the two days
power <- subset(power, power$Date == '1/2/2007' | power$Date == '2/2/2007')

# convert dates and times
power$DateTime <- strptime(paste(power$Date, power$Time),"%d/%m/%Y %H:%M:%S", tz="")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# create chart and save it to a png file
par(mfrow = c(1,1))
plot(power$DateTime, power$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png")
dev.off()
