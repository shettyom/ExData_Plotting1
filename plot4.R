data<-read.table("household_power_consumption.txt", header=T,sep=";",
                 na.strings="?")
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data$DateTime<-strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")

#################### Plot 4 ##################################################
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par (mfrow = c(2,2))

plot(data$DateTime,data$Global_active_power,type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

plot(data$DateTime,data$Voltage,type="l", 
     xlab="datetime", ylab="Voltage")

plot(data$DateTime,data$Sub_metering_1,type="l",col="black",
     xlab="", ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(data$DateTime,data$Global_reactive_power,type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()