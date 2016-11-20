#Plot 1 from Exploring Data Week 1 
#2016//11/19
#plotting histogram of global active power

#read in data file
#dates 01/02/2007 and 02/02/2007 start line 66638 end line 69517. 2880 records
data <- read.table(file = "household_power_consumption.txt", header = FALSE, col.names = c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep=";", na.strings = "?", stringsAsFactors = FALSE,skip = 66637, nrows = 2880)

#convert text dates to Date and POSIXlt dates.
fulldate <- paste(data$Date,data$Time,sep=":")
posixdate <- strptime(fulldate,format="%d/%m/%Y:%H:%M:%S")
data$Time <- posixdate
 
data$Date <- as.Date(data$Date,"%d/%m/%Y")


#open png device
png(filename="plot3.png",width = 480, height = 480, units = "px")
#windows()

#initial plot
with(data,plot(Time, Sub_metering_1,col="black", xlab="", ylab="Global Active Power (kW)", type="l"))
#use lines for second two to overlay
with(data,lines(Time, Sub_metering_2,col="red",  type="l"))
with(data,lines(Time, Sub_metering_3,col="blue", type="l"))

#Create legend
legend("topright",lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Graph Complete, close graphics device
dev.off()