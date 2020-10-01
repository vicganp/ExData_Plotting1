# Code for generating plot2.png

# First, set up an appropriate working directory with setwd() in which the file household_power_consumption.txt must be contained, then run the code

colNames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data <- read.csv2(file = "household_power_consumption.txt", dec = ".", header = FALSE, col.names = colNames, na.strings = "?", skip = 66637, nrows = 2880)

datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", height = 480, width = 480)

plot(x=datetime, y = data$Global_active_power, type= "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()