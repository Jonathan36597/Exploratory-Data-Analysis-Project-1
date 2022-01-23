#Import libraries
library(data.table)
library(lubridate)


#Import the dataset
power <- fread("household_power_consumption.txt", na.strings = "?")

#filter data
power <- power[power$Date %in% c("1/2/2007", "2/2/2007")]

#View dataset
head(power)

#Converting date column to date time 
dateTime <- dmy_hms(paste(power$Date, power$Time, sep = " "), tz = "UTC")

#Place to png
png("plot3.png", width = 480, height = 480)

#Plot graph
plot(dateTime, 
     power$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(dateTime, power$Sub_metering_2, col = "red")
lines(dateTime, power$Sub_metering_3, col = "blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()

