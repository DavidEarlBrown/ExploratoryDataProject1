library(lubridate)
# set column types for data so does not have to calculate
colTypes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
powerdf <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", comment.char = "", colClasses = colTypes)
powerdfsel <- subset(powerdf,substr(powerdf$Date,1,8) == "1/2/2007"  | substr(powerdf$Date,1,8) == "2/2/2007")
powerdfsel <- cbind(datetime = 0, powerdfsel)
pwrdf <- powerdfsel
pwrdf$datetime <- dmy(pwrdf$Date) + hms(pwrdf$Time)
par(bg = "white")

plot(pwrdf$datetime,pwrdf$Sub_metering_1,type = 'l',ylab = "Energy Sub Metering",xlab = " ",main = "Energy Sub Metering By Day",type = "n")
lines(pwrdf$datetime,pwrdf$Sub_metering_1,col="black")
lines(pwrdf$datetime,pwrdf$Sub_metering_2,col="red")
lines(pwrdf$datetime,pwrdf$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"),col = c("black","red","blue"),lty = 1,lwd = 2)

dev.copy(png,"plot3.png")
dev.off()