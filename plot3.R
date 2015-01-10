library(data.table) ##So that fread can be used
library(lubridate) ##Makes working with dates and times easy. See the swirl lesson from Getting and Cleaning Data

powerData<-fread("household_power_consumption.txt", na.strings="?", stringsAsFactors=FALSE,skip="1/2/2007", nrows = 2880) ##Load data

Sub1<-powerData$V7
Sub2<-powerData$V8
Sub3<-powerData$V9
Day<-dmy(powerData$V1)
Time<-hms(powerData$V2)
Time<-Time+hours(1) ##Done so that the times starting with 0H show up properly

DateTime <- paste(Day, Time) ##Put together the day and time into one column
DateTime<-ymd_hms(DateTime) ##Convert into the proper format
DateTime<-ymd_hms(DateTime)-hours(1) ##Subtract off the extra hour that was added on earlier

png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
plot(DateTime,Sub1,type="l", ylab = "Energy sub metering", xlab ="")
lines(DateTime,Sub2,col="red")
lines(DateTime,Sub3,col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
