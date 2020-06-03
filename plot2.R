pow<-read.table("household_power_consumption.txt",sep=";",skip=1)
c<-read.table("household_power_consumption.txt",sep=";",nrow=1)
colnames(pow)<-c
pow<-pow[pow$Date=="1/2/2007"|pow$Date=="2/2/2007",]
pow$Date<-format(as.Date(pow$Date, format="%d/%m/%Y"),"%y/%m/%d")
pow$Time=format(strptime(pow$Time, format="%H:%M:%S"),"%H:%M:%S")
png("plot2.png")
plot(as.POSIXct(paste(pow$Date,pow$Time)),pow$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()