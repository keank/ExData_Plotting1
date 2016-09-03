##Overall
setwd('./R/Exploratory Data Analysis/Week 1')
data<-read.table('household_power_consumption.txt', header=TRUE,sep=";", na.strings="?")
data$Date2<-dmy(data$Date)
cdata<-subset(data, Date2 >= as.Date('2007-02-01') & Date2 <= as.Date('2007-02-02'))

##Figure 4
if(!require(lubridate)){
  install.packages("lubridate")
  library(lubridate)
}
cdata$datetime<-dmy_hms(paste(cdata$Date,cdata$Time))
png(filename="plot4.png", width= 480, height= 480)
par(mfrow=c(2,2))

#subFig 1
plot(cdata$datetime,cdata$Global_active_power,type='l',xlab="",ylab="Global Active Power")

#subFig 2
plot(cdata$datetime,cdata$Voltage,type='l',xlab="datetime",ylab="Voltage")

#subFig 3
plot(cdata$datetime,cdata$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering")
lines(cdata$datetime,cdata$Sub_metering_2,type='l',col="red")
lines(cdata$datetime,cdata$Sub_metering_3,type='l',col="blue")
legend("topright", lty=c(1,1,1),col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

#subFig 4
plot(cdata$datetime,cdata$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()
