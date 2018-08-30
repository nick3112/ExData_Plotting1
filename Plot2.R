##Plot2

#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment1")

hhPower<-read.delim("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hhPower$dt<-as.Date(hhPower$Date,'%d/%m/%Y')
hhPower<-hhPower[(hhPower$dt>=as.Date("2007-02-01") & hhPower$dt <= as.Date("2007-02-02")),]

##Plot2
hhPower$wk<-substr(weekdays(hhPower$dt),1,3)
png(filename="Plot2.PNG",width=480, height=480)
plot(as.numeric(hhPower$Global_active_power),type="l",xaxt="n",xlab="",ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
mtext("Plot2", side=3, at=0)
dev.off()