#Import libraries
library(data.table)
library(lubridate)


#Import the dataset
power <- fread("household_power_consumption.txt", na.strings = "?")

#filter data
power <- power[power$Date %in% c("1/2/2007", "2/2/2007")]

#View dataset
head(power)


#Place to png
png("plot1.png", width = 480, height = 480)

hist(power$Global_active_power,
     col = "Red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts")

dev.off()
