##Plot4

#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment1")

#hhPower<-read.delim("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE,nrows=100)
hhPower<-read.delim("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hhPower$dt<-as.Date(hhPower$Date,'%d/%m/%Y')
hhPower<-hhPower[(hhPower$dt>=as.Date("2007-02-01") & hhPower$dt <= as.Date("2007-02-02")),]

##Plot4
hhPower$wk<-substr(weekdays(hhPower$dt),1,3)
png(filename="Plot4.PNG",width=480, height=480)
par(mfrow=c(2,2))

#(1,1) global active power
plot(as.numeric(hhPower$Global_active_power),type="l",xaxt="n",xlab="",ylab="Global Active Power")
mtext("Plot4", side=3, at=0)
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))

#(1,2) volatage
plot(as.numeric(hhPower$Voltage),type="l",xaxt="n",xlab="date/time",ylab="Voltage")
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))

#(2,1) plot3
plot(as.numeric(hhPower$Sub_metering_1),xaxt="n",yaxt="n",type="l",xlab="",ylab="Energy sub metering")
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
lines(as.numeric(hhPower$Sub_metering_2), col = "red")
lines(as.numeric(hhPower$Sub_metering_3), col = "blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n")
axis(2, at=c(0,10,20,30), lab=c(0,10,20,30))

#(2,2)
plot(as.numeric(hhPower$Global_reactive_power),type="l",xaxt="n",xlab="date/time",ylab="Global_reactive_power")
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
dev.off()
