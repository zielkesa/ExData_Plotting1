

##reading data into R and filtering for the the 1st and 2nd of Feburary 2007
x <- read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=200000, na.strings = "?")
x <- filter(x,Date=="1/2/2007"|Date=="2/2/2007")

##making a time column
x <- mutate(x, DT = as.POSIXct(strptime(paste(Date,Time,sep=" "), "%d/%m/%Y %H:%M:%S")))

##making plot
png(filename = "plot3.png", bg = "transparent")
par(yaxp = c(0,30,3))
with(x, plot(x$DT,x$Sub_metering_1, col="black",type="l", ylab="Energy sub metering", xlab=""))
with(x, lines(x$DT,x$Sub_metering_2, col="red"))
with(x, lines(x$DT,x$Sub_metering_3, col="blue"))
legend("topright",lty,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()