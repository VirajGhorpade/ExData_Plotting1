#Read the file
entiredata <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

#convert the date-time to standard format
entiredata$Datetime <- strptime(paste(entiredata$Date, entiredata$Time), "%d/%m/%Y %H:%M:%S")

#subset only the required part of the data
partdata <- subset(entiredata, as.character(entiredata$Date)== "1/2/2007")
subdata <- rbind(partdata,subset(entiredata, as.character(entiredata$Date)== "2/2/2007"))
data <- subdata
rm(entiredata)

#---------------------------------------------------------
#plot
png(file="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# plot 1 (NW)
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")

# plot 2 (NE)
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3 (SW)
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab = "", col = "black")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
       col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot 4 (SE)
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))
dev.off()
#---------------------------------------------------------
