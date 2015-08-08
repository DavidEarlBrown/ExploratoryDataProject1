library(lubridate)
# set column types for data so does not have to calculate
colTypes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
pwrdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", comment.char = "", colClasses = colTypes)
powerdfsel <- pwrdata[pwrdata$Date == "1/2/2007" | pwrdata$Date == "2/2/2007",]
png(file = "plot1.png", width = 480, height =480)
par(bg = "white")
# Initial histogram for plot1
hist(as.numeric(powerdfsel$Global_active_power)/1000,col = "red",main = "Global Active Power",xlab = "Global Active Power" ~'('~ "Kilowatts/1000" ~')')
# create plot1.png and then close the device to store on disk
# done in file dev.copy(png,"plot1.png")
dev.off()
# This file was created in the workspace for the project but 
# then copied into my local github repository to synchronize with the github courser project repository.
