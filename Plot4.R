coreset<-read.delim("household_power_consumption.txt",sep=';')
justdate<-coreset$Date
justdate<-as.Date(justdate,"%d/%m/%Y")
chkdate<-(as.integer(justdate)>=as.integer(as.Date("2007-02-01")))&(as.integer(justdate)<=as.integer(as.Date("2007-02-02")))
useset<-coreset[chkdate,]?hist
useset$DateTime <- strptime(paste(coreset$Date, coreset$Time),format="%d/%m/%Y %H:%M:%S")
useset$weekday<-weekdays(as.Date(useset$Date,"%d/%m/%Y"))
write.csv(useset,"expassgn1set.csv")

##fourth graph multiple plots
useset<-read.csv("expassgn1set.csv")
par(mfrow=c(2,2))
with(useset, {
  plot(as.POSIXct(DateTime),Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  plot(as.POSIXct(DateTime),Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(as.POSIXct(DateTime), useset$Sub_metering_1,col="black", type="l",ylab="Energy sub metering",xlab="")
  lines(as.POSIXct(DateTime),Sub_metering_2, type="l",col="red")
  lines(as.POSIXct(DateTime),Sub_metering_3, type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
  plot(as.POSIXct(DateTime),Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})


png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
with(useset, {
  plot(as.POSIXct(DateTime),Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  plot(as.POSIXct(DateTime),Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(as.POSIXct(DateTime), useset$Sub_metering_1,col="black", type="l",ylab="Energy sub metering",xlab="")
  lines(as.POSIXct(DateTime),Sub_metering_2, type="l",col="red")
  lines(as.POSIXct(DateTime),Sub_metering_3, type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
  plot(as.POSIXct(DateTime),Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})
dev.off()