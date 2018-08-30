##Plot3

#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment1")

hhPower<-read.delim("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hhPower$dt<-as.Date(hhPower$Date,'%d/%m/%Y')
hhPower<-hhPower[(hhPower$dt>=as.Date("2007-02-01") & hhPower$dt <= as.Date("2007-02-02")),]
hhPower$wk<-substr(weekdays(hhPower$dt),1,3)

##Plot3
png(filename="Plot3.PNG",width=480, height=480)
plot(as.numeric(hhPower$Sub_metering_1),xaxt="n",yaxt="n",type="l",xlab="",ylab="Energy sub metering")
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
lines(as.numeric(hhPower$Sub_metering_2), col = "red")
lines(as.numeric(hhPower$Sub_metering_3), col = "blue")
legend("topright", lty = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
mtext("Plot3", side=3, at=0)
axis(2, at=c(0,10,20,30), lab=c(0,10,20,30))
dev.off()