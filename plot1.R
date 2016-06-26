# load libaries
library(dplyr)

# Read input data
powerData <- read.table("household_power_consumption.txt",sep=";",header = TRUE)

#Create subset of data for two days
powerData$Date <- as.Date(powerData$Date , "%d/%m/%Y")
powerDataMini <- filter(powerData, Date ==as.Date("2007-02-01") | Date == as.Date("2007-02-02")) 

hist(as.numeric(as.character(powerDataMini$Global_active_power)),main="Global Active Power",xlab="Global Active Power(Kilowatts)",col="orange")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
