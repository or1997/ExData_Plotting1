# Exploratory Data Analysis
# Course Project 1

# Read entire data set
large_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset data to get rows for Feb 1, 2007 and Feb 2, 2007
working_data <- large_data[which(large_data$Date == "1/2/2007" | large_data$Date == '2/2/2007'), ]
working_data$datetime <- with(working_data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Plot 2
png(filename="plot2.png", width=480, height=480)
plot(working_data$datetime, working_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()




