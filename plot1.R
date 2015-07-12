f <- file("household_power_consumption.txt")
powerdf <- read.csv(f, sep = ";")
dim(powerdf)
#now modify date and time and subset to month
# use strptime() and as.Date() functions.
library(tidyr)
library(dplyr)
powerdfsel <- subset(powerdf,substr(powerdf$Date,1,8) == "1/2/2007"  | substr(powerdf$Date,1,8) == "2/2/2007")
# no mutate(powerdf,Date = as.Date(Date)) memory issue
# date format is 6/12/2006;17:24:00
hist(as.numeric(powerdfsel$Global_active_power)/1000,col = "red",main = "Global Active Power",xlab = "Global Active Power" ~'('~ "Kilowatts/1000" ~')')
dev.copy(png,"plot1.png")
dev.off()