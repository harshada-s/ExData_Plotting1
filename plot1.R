pow<-read.table("household_power_consumption.txt",sep=";",skip=1)
c<-read.table("household_power_consumption.txt",sep=";",nrow=1)
colnames(pow)<-c
pow<-pow[pow$Date=="1/2/2007"|pow$Date=="2/2/2007",]
pow$Date<-format(as.Date(pow$Date, format="%d/%m/%Y"),"%y/%m/%d")
pow$Time=format(strptime(pow$Time, format="%H:%M:%S"),"%H:%M:%S")
png("plot1.png")
hist(as.numeric(pow$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()