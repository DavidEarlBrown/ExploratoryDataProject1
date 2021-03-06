 library(lubridate)
# library(tidyr)
# library(dplyr)
   # set column types for data so does not have to calculate
  colTypes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
  pwrdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = "?", comment.char = "", colClasses = colTypes)
  selectedData <- pwrdata[pwrdata$Date == "1/2/2007" | pwrdata$Date == "2/2/2007",]
  selectedData <- cbind(datetime = 0, selectedData)
 selectedData$datetime <- dmy(selectedData$Date) + hms(selectedData$Time)
# selectedData$datetime <- strptime(paste(pdata$date,pdata$time),format="%d/%m/%Y %H:%M:%S")
# selectedData$datetime <- parse_date_time(selectedData$date,selectedData$time,c("%d%m%Y %H%M%S"))
 png(file = "plot2.png", width = 480, height =480)
  par(bg = "white")
  plot(selectedData$datetime, selectedData$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
  dev.off()
