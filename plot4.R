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
png("plot4.png", width = 480, height = 480)

#Set graphic dimensions 
par(mfrow = c(2, 2))

#plot1
plot(dataTime,
     power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

#plot 2
plot(dateTime,
     power$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#plot 3
plot(dateTime,
     power$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(dateTime, power$Sub_metering_2, col = "red")

lines(dateTime, power$Sub_metering_3, col = "blue")

legend(
  "topright",
  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

#plot 4
plot(dateTime,
     power$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()

