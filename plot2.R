# load libaries
library(dplyr)

# Read input data
powerData <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

#Create subset data for 2 days
#Create x axis labes with both date and time
powerDataNew <- mutate(powerData,xaxis = paste(powerData$Date,powerData$Time,sep=":"))
powerDataNew$Date <- as.Date(powerDataNew$Date , "%d/%m/%Y")
powerDataMini <- filter(powerDataNew, Date ==as.Date("2007-02-01") | Date == as.Date("2007-02-02")) 

powerDataMini$xaxis <- strptime(powerDataMini$xaxis,format = "%d/%m/%Y:%H:%M:%S")

with(powerDataMini,plot(xaxis,as.numeric(as.character(Global_active_power)),type ="l",xlab="",ylab="Global Active Power(kilowatts"))
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()


