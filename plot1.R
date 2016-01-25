data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
filter <- data[[1]] == "1/2/2007"
filter2 <- data[[1]] == "2/2/2007"
power <- rbind(data[filter,], data[filter2,])
power$Date.Time <- paste(power$Date, power$Time, sep = " ")
power$Date.Time <- strptime(power$Date.Time, "%d/%m/%Y %H:%M:%S")
power$Global_active_power <- as.numeric(levels(power$Global_active_power))[power$Global_active_power]
png("plot1.png", width=480, height=480, type="quartz")
hist(power$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()