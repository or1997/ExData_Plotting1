# Exploratory Data Analysis
# Course Project 1

# Read entire data set
large_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset data to get rows for Feb 1, 2007 and Feb 2, 2007
working_data <- large_data[which(large_data$Date == "1/2/2007" | large_data$Date == '2/2/2007'), ]
working_data$datetime <- with(working_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(working_data, {
  plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(datetime, Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_2, type="l", col="red")
  lines(datetime, Sub_metering_3, type="l", col="blue")
  legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")
  plot(datetime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})
dev.off()



