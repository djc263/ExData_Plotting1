coreset<-read.delim("household_power_consumption.txt",sep=';')
justdate<-coreset$Date
justdate<-as.Date(justdate,"%d/%m/%Y")
chkdate<-(as.integer(justdate)>=as.integer(as.Date("2007-02-01")))&(as.integer(justdate)<=as.integer(as.Date("2007-02-02")))
useset<-coreset[chkdate,]?hist
useset$DateTime <- strptime(paste(coreset$Date, coreset$Time),format="%d/%m/%Y %H:%M:%S")
useset$weekday<-weekdays(as.Date(useset$Date,"%d/%m/%Y"))
write.csv(useset,"expassgn1set.csv")
##first graph 
useset<-read.csv("expassgn1set.csv")
with(useset,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))


png(filename = "plot1.png",width = 480, height = 480)
with(useset,hist(Global_active_power,col="firebrick2",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.off()
