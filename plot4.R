data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
filter <- data[[1]] == "1/2/2007"
filter2 <- data[[1]] == "2/2/2007"
power <- rbind(data[filter,], data[filter2,])
power$Date.Time <- paste(power$Date, power$Time, sep = " ")
power$Date.Time <- strptime(power$Date.Time, "%d/%m/%Y %H:%M:%S")
power$Voltage <- as.numeric(levels(power$Voltage))[power$Voltage]
power$Global_reactive_power <- as.numeric(levels(power$Global_reactive_power))[power$Global_reactive_power]
png("plot3b.png", width=480, height=480, type="quartz")
par(mfcol = c(2,2), mai = c(1, 1, 0.7, 0.3))
plot(power$Date.Time, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
with(power, plot(Date.Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(power, lines(Date.Time, Sub_metering_2, col = "red"))
with(power, lines(Date.Time, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), xjust = 0, lty = 1, cex = 1, bty = "n")
plot(power$Date.Time, power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(power$Date.Time, power$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()