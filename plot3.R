#Loading the data
data_full <- read.csv("household_power_consumption.txt", 
                      header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, 
                      stringsAsFactors=F, comment.char="", 
                      quote='\"')

#data from the dates 2007-02-01 and 2007-02-02.
data <- subset(data_full,Date %in% c("1/2/2007","2/2/2007"))

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Datetime,data$Sub_metering_1,
     type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
     lines(data$Datetime,data$Sub_metering_2,col='Red')
     lines(data$Datetime,data$Sub_metering_3,col='Blue') 

     legend("topright"
            , col=c("black","red","blue")
            , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
            ,lty=c(1,1), lwd=c(1,1))
     
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
