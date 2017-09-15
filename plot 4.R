# importing files
data = read.table("household_power_consumption.txt" , sep = ";",header = TRUE)

# subsetting data and changing into datetime category 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data1 = subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# plotting
png(file="plot4.png", height=480, width=480)

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

#plot1
data1$Global_active_power = as.character(data1$Global_active_power)
data1$Global_active_power= as.numeric(data1$Global_active_power)
plot(data1$Global_active_power~data1$Datetime ,type="l", xlab="", ylab="Global Active Power (kilowatts)")

#PLOT2
data1$Voltage = as.character(data1$Voltage)
data1$Voltage = as.numeric(data1$Voltage)
plot(data1$Voltage~data1$Datetime,ylab="Voltage", xlab="Datetime",type="l")

#PLOT3
data1$Sub_metering_1 = as.character(data1$Sub_metering_1)
data1$Sub_metering_1 = as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 = as.character(data1$Sub_metering_2)
data1$Sub_metering_2 = as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 = as.character(data1$Sub_metering_3)
data1$Sub_metering_3 = as.numeric(data1$Sub_metering_3)


plot( data1$Datetime , data1$Sub_metering_1,col= "black ",xlab="",ylab = "Energy sub metering" ,type="l")
lines(data1$Datetime ,data1$Sub_metering_2 , col="red",type="l")
lines(data1$Datetime ,data1$Sub_metering_3 , col="blue",type="l")
legend("topright" , col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1))

#PLOT4
data1$Global_reactive_power= as.character(data1$Global_reactive_power)
data1$Global_reactive_power= as.numeric(data1$Global_reactive_power)
plot( data1$Global_reactive_power ~ data1$Datetime ,ylab="Global Rective Power",xlab="datetime",type="l")

dev.off()