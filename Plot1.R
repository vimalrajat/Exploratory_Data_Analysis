library(data.table)
link <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("Module_4_Assignment_1")){dir.create("Module_4_Assignment_1")}
download.file(link, destfile = "./Module_4_Assignment_1/power.zip",method = "curl")
unzip("./Module_4_assignment_1/Power.zip", exdir = "./Module_4_assignment_1")
powerdata <- fread("./Module_4_assignment_1/household_power_consumption.txt",na.strings = "?")
powerdata[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
powerdata <- powerdata[(Date >= "2007-02-01") & (Date <= "2007-02-02")]
active_power <- as.numeric(powerdata$Global_active_power)
hist(active_power, col = "red", xlim = c(0,6),ylim = c(0,1200), xlab = "Global Active Power(kilowatts)",
     main = "Global Active Power", breaks = 20)
dev.copy(png, file = "Plot1.png")
dev.off()
