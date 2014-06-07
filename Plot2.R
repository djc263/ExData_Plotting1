coreset<-read.delim("household_power_consumption.txt",sep=';')
justdate<-coreset$Date
justdate<-as.Date(justdate,"%d/%m/%Y")
chkdate<-(as.integer(justdate)>=as.integer(as.Date("2007-02-01")))&(as.integer(justdate)<=as.integer(as.Date("2007-02-02")))
useset<-coreset[chkdate,]?hist
useset$DateTime <- strptime(paste(coreset$Date, coreset$Time),format="%d/%m/%Y %H:%M:%S")
useset$weekday<-weekdays(as.Date(useset$Date,"%d/%m/%Y"))
write.csv(useset,"expassgn1set.csv")

## second graph
useset<-read.csv("expassgn1set.csv")
with(useset,plot(as.POSIXct(DateTime),Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))


png(filename = "plot2.png",width = 480, height = 480)
with(useset,plot(as.POSIXct(DateTime),Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()