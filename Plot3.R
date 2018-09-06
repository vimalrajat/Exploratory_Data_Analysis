library(data.table)
link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("Module_4_Assignment_1")){dir.create("Module_4_Assignment_1")}
download.file(link, destfile = "./Module_4_Assignment_1/power.zip",method = "curl")
unzip("./Module_4_assignment_1/Power.zip", exdir = "./Module_4_assignment_1")
powerdata <- fread("./Module_4_assignment_1/household_power_consumption.txt",na.strings = "?")
powerdata[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerdata[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerdata <- powerdata[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
png("plot3.png", width=480, height=480)
plot(powerdata[, dateTime], powerdata[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerdata[, dateTime], powerdata[, Sub_metering_2],col="red")
lines(powerdata[, dateTime], powerdata[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
