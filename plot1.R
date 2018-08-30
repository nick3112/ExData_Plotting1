##Plot1

#get directory
setwd("C:/Nick/07 R/6JohnHopkins/4 Exploratory Data Analysis/Assignment1")

hhPower<-read.delim("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hhPower$dt<-as.Date(hhPower$Date,'%d/%m/%Y')
hhPower<-hhPower[(hhPower$dt>=as.Date("2007-02-01") & hhPower$dt <= as.Date("2007-02-02")),]

##plot1
png(filename="Plot1.PNG",width=480, height=480)
hist(as.numeric(hhPower$Global_active_power),col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
mtext("Plot1", side=3, at=0)
dev.off()