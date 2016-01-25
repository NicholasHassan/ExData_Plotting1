data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
filter <- data[[1]] == "1/2/2007"
filter2 <- data[[1]] == "2/2/2007"
power <- rbind(data[filter,], data[filter2,])
power$Date.Time <- paste(power$Date, power$Time, sep = " ")
power$Date.Time <- strptime(power$Date.Time, "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480, type="quartz")
with(power, plot(Date.Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(power, lines(Date.Time, Sub_metering_2, col = "red"))
with(power, lines(Date.Time, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()

#The peaks of line graph extend much higher for low values. They still represent the correct data but are visually very confusing.
#I couldn't figure out how to fix this.