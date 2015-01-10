library(data.table) ##So that fread can be used
library(lubridate) ##Makes working with dates and times easy. See the swirl lesson from Getting and Cleaning Data

powerData<-fread("household_power_consumption.txt", na.strings="?", stringsAsFactors=FALSE,skip="1/2/2007", nrows = 2880) ##Load data

GlobalActivePower <- powerData$V3
Day<-dmy(powerData$V1)
Time<-hms(powerData$V2)
Time<-Time+hours(1) ##Done so that the times starting with 0H show up properly

DateTime <- paste(Day, Time) ##Put together the day and time into one column

DateTime<-ymd_hms(DateTime) ##Convert into the proper format
DateTime<-ymd_hms(DateTime)-hours(1) ##Subtract off the extra hour that was added on earlier

png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
par(bg = "transparent")
plot(DateTime,GlobalActivePower,type="l",ylab="Global Active Power (kilowatts)")
dev.off()