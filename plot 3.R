# importing files
data = read.table("household_power_consumption.txt" , sep = ";",header = TRUE)

# subsetting data and changing into datetime category 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data1 = subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

# changing into numeric
data1$Sub_metering_1 = as.character(data1$Sub_metering_1)
data1$Sub_metering_1 = as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 = as.character(data1$Sub_metering_2)
data1$Sub_metering_2 = as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 = as.character(data1$Sub_metering_3)
data1$Sub_metering_3 = as.numeric(data1$Sub_metering_3)

# plotting
png(file="plot3.png", height=480, width=480 )
plot( data1$Datetime , data1$Sub_metering_1,col= "black ",xlab="",ylab = "Energy sub metering",type="l" )
lines(data1$Datetime ,data1$Sub_metering_2 , col="red",type="l")
lines(data1$Datetime ,data1$Sub_metering_3 , col="blue",type="l")


legend("topright" , col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1))
dev.off()