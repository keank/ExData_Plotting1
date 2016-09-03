##Overall
setwd('./R/Exploratory Data Analysis/Week 1')
data<-read.table('household_power_consumption.txt', header=TRUE,sep=";", na.strings="?")
data$Date2<-dmy(data$Date)
cdata<-subset(data, Date2 >= as.Date('2007-02-01') & Date2 <= as.Date('2007-02-02'))

##Figure 2
if(!require(lubridate)){
  install.packages("lubridate")
  library(lubridate)
}
cdata$datetime<-dmy_hms(paste(cdata$Date,cdata$Time))
png(filename="plot2.png", width= 480, height= 480)
plot(cdata$datetime,cdata$Global_active_power,type='l',xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
