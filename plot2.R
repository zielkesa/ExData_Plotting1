

##reading data into R and filtering for the the 1st and 2nd of Feburary 2007
x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=200000, na.strings = "?")
x <- filter(x,Date=="1/2/2007"|Date=="2/2/2007")

##making a time column
x <- mutate(x, DT = as.POSIXct(strptime(paste(Date,Time,sep=" "), "%d/%m/%Y %H:%M:%S")))

##making the plot
png(filename = "plot2.png", bg = "transparent")
plot(x$DT,x$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()