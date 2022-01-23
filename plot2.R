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
png("plot2.png", width = 480, height = 480)

#Plot graph
plot(dateTime, 
    power$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts")

dev.off
