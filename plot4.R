library(lubridate)
# set column types for data so does not have to calculate
colTypes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
powerdf <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", comment.char = "", colClasses = colTypes)
powerdfsel <- subset(powerdf,substr(powerdf$Date,1,8) == "1/2/2007"  | substr(powerdf$Date,1,8) == "2/2/2007")
powerdfsel <- cbind(datetime = 0, powerdfsel)
pwrdf <- powerdfsel
pwrdf$datetime <- dmy(pwrdf$Date) + hms(pwrdf$Time)
png(file = "plot4.png", width = 480, height =480)
par(mfrow = c(2, 2),bg = "white",mar = c(3, 2, 4, 2) + 0.1)
#plot # 1
plot(pwrdf$datetime,pwrdf$Global_active_power,type = 'l',xlab = "day",ylab = "Global Active Power" ~'('~ "Kilowatts/1000" ~')',main = "Active Power By Day")
# plot # 2
plot(pwrdf$datetime,pwrdf$Voltage,typ = 'l',ylab = "Voltage By Day",xlab = "day",main = "Voltage By Day")
# plot # 3
plot(pwrdf$datetime,pwrdf$Sub_metering_1,type = 'l',xlab = "day",ylab = "Energy Sub Metering",main = "Energy Sub Metering By Day")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2)
lines(pwrdf$datetime,pwrdf$Sub_metering_1,col="black")
lines(pwrdf$datetime,pwrdf$Sub_metering_2,col="red")
lines(pwrdf$datetime,pwrdf$Sub_metering_3,col="blue")
# plot # 4
plot(pwrdf$datetime,pwrdf$Global_reactive_power,typ = 'l',xlab = "Day",ylab = "Global Reactive Power" ~'('~ "Kilowatts/1000" ~')',main = "Reactive Power By Day")
dev.off()