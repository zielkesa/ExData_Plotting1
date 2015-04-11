
##reading data into R and filtering for the the 1st and 2nd of Feburary 2007
x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=200000, na.strings = "?")
x <- filter(x,Date=="1/2/2007"|Date=="2/2/2007")

##making the plot
png(filename = "plot1.png", bg = "transparent")
hist(as.numeric(x$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()