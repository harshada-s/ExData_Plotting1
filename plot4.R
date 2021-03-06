pow<-read.table("household_power_consumption.txt",sep=";",skip=1)
c<-read.table("household_power_consumption.txt",sep=";",nrow=1)
colnames(pow)<-c
pow<-pow[pow$Date=="1/2/2007"|pow$Date=="2/2/2007",]
pow$Date<-format(as.Date(pow$Date, format="%d/%m/%Y"),"%y/%m/%d")
pow$Time=format(strptime(pow$Time, format="%H:%M:%S"),"%H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2))
plot(as.POSIXct(paste(pow$Date,pow$Time)),pow$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(as.POSIXct(paste(pow$Date,pow$Time)),pow$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(as.POSIXct(paste(pow$Date,pow$Time)),pow$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(as.POSIXct(paste(pow$Date,pow$Time)),pow$Sub_metering_2,col="red")
lines(as.POSIXct(paste(pow$Date,pow$Time)),pow$Sub_metering_3,col="blue")
legend("topright",lwd=c(2,2,2),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(as.POSIXct(paste(pow$Date,pow$Time)),pow$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()