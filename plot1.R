#Read the file
entiredata <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?")

#convert the date-time to standard format
entiredata$Datetime <- strptime(paste(entiredata$Date, entiredata$Time), "%d/%m/%Y %H:%M:%S")

#operate only on the required part of the data
partdata <- subset(entiredata, as.character(entiredata$Date)== "1/2/2007")
subdata <- rbind(partdata,subset(entiredata, as.character(entiredata$Date)== "2/2/2007"))
data <- subdata
rm(entiredata)

#---------------------------------------------------------
#plot the histogram
png(file="plot1.png", width=480, height=480)
hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, 
     ylim = c(0,1200), xlim = c(0, 6), xaxp = c(0, 6, 3))
dev.off()

#---------------------------------------------------------
