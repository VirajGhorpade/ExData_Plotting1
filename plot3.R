#Read the file
entiredata <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

#convert the date-time to standard format
entiredata$Datetime <- strptime(paste(entiredata$Date, entiredata$Time), "%d/%m/%Y %H:%M:%S")

#operate only on the required part of the data
partdata <- subset(entiredata, as.character(entiredata$Date)== "1/2/2007")
subdata <- rbind(partdata,subset(entiredata, as.character(entiredata$Date)== "2/2/2007"))
data <- subdata
rm(entiredata)

#----------------------------------------------------
png(file="plot3.png", width=480, height=480)
plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))
dev.off()
#-----------------------------------------
