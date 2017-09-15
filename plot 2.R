data = read.table("household_power_consumption.txt" , sep = ";",header = TRUE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data1 = subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

data1$Global_active_power = as.character(data1$Global_active_power)
data1$Global_active_power= as.numeric(data1$Global_active_power)

png(file="plot2.png", height=480, width=480)
plot(data1$Global_active_power~data1$Datetime ,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()