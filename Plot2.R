library(data.table)
link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("Module_4_Assignment_1")){dir.create("Module_4_Assignment_1")}
download.file(link, destfile = "./Module_4_Assignment_1/power.zip",method = "curl")
unzip("./Module_4_assignment_1/Power.zip", exdir = "./Module_4_assignment_1")
powerdata <- fread("./Module_4_assignment_1/household_power_consumption.txt",na.strings = "?")
powerdata[, datetime := as.POSIXct(paste0(Date,Time), format = "%d/%m/%Y %H:%M:%S")]
powerdata <- powerdata[(datetime >= "2007-02-01") & (datetime<= "2007-02-02")]

plot(x = powerdata[,datetime]
     , y = powerdata[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "Plot2.png")
dev.off()
