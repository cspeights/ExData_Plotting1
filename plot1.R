library(data.table) ##So that fread can be used
powerData<-fread("household_power_consumption.txt", na.strings="?", stringsAsFactors=FALSE,skip="1/2/2007", nrows = 2880) ##Load data

GlobalActivePower <- powerData$V3

png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(GlobalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") ##Plot the data
dev.off()