f <- file("household_power_consumption.txt")
powerdf <- read.csv(f, sep = ";")
dim(powerdf)
#now modify date and time and subset to month
# use strptime() and as.Date() functions.
library(tidyr)
library(dplyr)
powerdfsel <- subset(powerdf,substr(powerdf$Date,1,8) == "1/2/2007"  | substr(powerdf$Date,1,8) == "2/2/2007")
# no mutate(powerdf,Date = as.Date(Date)) memory issue
# 16/12/2006;17:24:00
powerdfdays$Date <- weekdays(as.Date(powerdfdays$Date))

plot(factor(pwrdf$daytime),as.numeric(pwrdf$Global_active_power),typ = 'l',,ylab = "Global Active Power" ~'('~ "Kilowatts/1000" ~')',main = "Active Power By Day")
dev.copy(png,"plot2.png")
dev.off()