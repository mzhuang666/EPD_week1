#Loading the data
power <- read.table("household_power_consumption.txt",
                    skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power",
                  "Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1",
                  "Sub_metering_2","Sub_metering_3")

#data from the dates 2007-02-01 and 2007-02-02.
data <- subset(power,Date %in% c("1/2/2007","2/2/2007"))


data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


png("plot2.png", width=480, height=480)

plot(data$Datetime,as.numeric(data$Global_active_power),
     type="l",xlab="",
     ylab="Global Active Power (kilowatts)") 

dev.off()
