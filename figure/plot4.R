# Code for generating plot4.png

# First, set up an appropriate working directory with setwd() in which the file household_power_consumption.txt must be contained, then run the code

colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data <- read.csv2(file = "household_power_consumption.txt", dec = ".", header = FALSE, col.names = colNames, na.strings = "?", skip = 66637, nrows = 2880)

datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", height = 480, width = 480)

par(mfrow = c(2, 2))

plot(x = datetime, y = data$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(x = datetime, y = data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(x = datetime, y = data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(x = datetime, y = data$Sub_metering_2, col = "red")

lines(x = datetime, y = data$Sub_metering_3, col = "blue")

legend("topright", lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

plot(x = datetime, y = data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()