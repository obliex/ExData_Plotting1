# load libaries
library(dplyr)

# Read input data
powerData <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

powerDataNew <- mutate(powerData,xaxis = paste(powerData$Date,powerData$Time,sep=":"))
powerDataNew$Date <- as.Date(powerDataNew$Date , "%d/%m/%Y")
powerDataMini <- filter(powerDataNew, Date ==as.Date("2007-02-01") | Date == as.Date("2007-02-02")) 

powerDataMini$xaxis <- strptime(powerDataMini$xaxis,format = "%d/%m/%Y:%H:%M:%S")

# Make the plot
with(powerDataMini,plot(xaxis,as.numeric(as.character(Sub_metering_1)),type ="l",ylab="Energy Sub Metering",xlab=""))
lines(powerDataMini$xaxis,as.numeric(as.character(powerDataMini$Sub_metering_2)),col="red")
lines(powerDataMini$xaxis,as.numeric(as.character(powerDataMini$Sub_metering_3)),col="blue")
legend("topright",lwd=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_1","Sub_metering_1"),cex=0.5)

#copy to png
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()
