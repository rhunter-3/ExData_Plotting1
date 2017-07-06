power<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
power2<-subset(power,Date=="1/2/2007" | Date=="2/2/2007")
power2$datetime<-paste(power2$Date,power2$Time)
power2$datetime2 <- strptime(power2$datetime, format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
#Top Left
plot(power2$datetime2,power2$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(power2$datetime2,power2$Global_active_power)
#Top Right
plot(power2$datetime2,power2$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(power2$datetime2,power2$Voltage)
#Bottom Left
plot(power2$datetime2,power2$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(power2$datetime2,power2$Sub_metering_1)
lines(power2$datetime2,power2$Sub_metering_2, col="red")
lines(power2$datetime2,power2$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), box.lty=0, y.intersp = .1, xjust=0,yjust=0, inset=.02,cex=.8)
#Bottom Right
plot(power2$datetime2,power2$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(power2$datetime2,power2$Global_reactive_power)
dev.copy(png,filename="plot4.png")
dev.off()
