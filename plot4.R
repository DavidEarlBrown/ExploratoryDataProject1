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
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
#plot # 1
plot(factor(pwrdf$daytime),as.numeric(pwrdf$Global_active_power),typ = 'l',,ylab = "Global Active Power" ~'('~ "Kilowatts/1000" ~')',main = "Active Power By Day")
# plot # 2
plot(factor(pwrdf$daytime),as.numeric(pwrdf$Voltage),typ = 'l',,ylab = "Voltage By Day",main = "Voltage By Day")
# plot # 3
plot(factor(pwrdf$daytime),as.numeric(pwrdf$Sub_metering_1),type = 'l',ylab = "Energy Sub Metering",main = "Energy Sub Metering By Day",xaxt = "n")
> lines(factor(pwrdf$daytime),as.numeric(pwrdf$Sub_metering_1),col="black")
> lines(factor(pwrdf$daytime),as.numeric(pwrdf$Sub_metering_2),col="green")
> lines(factor(pwrdf$daytime),as.numeric(pwrdf$Sub_metering_3),col="blue")
> legend("topright",legend = c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"),col = c("black","green","blue"))
# plot # 4
plot(factor(pwrdf$daytime),as.numeric(pwrdf$Global_reactive_power),typ = 'l',,ylab = "Global Reactive Power" ~'('~ "Kilowatts/1000" ~')',main = "Reactive Power By Day")
# save plot to plot4.png for assignment
dev.copy(png,"plot4.png")
dev.off()