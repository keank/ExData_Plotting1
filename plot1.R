##Overall
setwd('./R/Exploratory Data Analysis/Week 1')
data<-read.table('household_power_consumption.txt', header=TRUE,sep=";", na.strings="?")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
cdata<-subset(data, Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02'))

##Figure 1
png(filename="plot1.png", width= 480, height= 480)
hist(cdata$Global_active_power, breaks=seq(0,8,0.5), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

