# importing files 
data = read.table("household_power_consumption.txt" , sep = ";",header = TRUE)
# subsetting data and changing into datetime category 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data1 = subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

 # changing into numeric
data1$Global_active_power = as.character(data1$Global_active_power)
data1$Global_active_power= as.numeric(data1$Global_active_power)
 # plotting 
png(file="plot1.png", height=480, width=480)
hist(data1$Global_active_power,col = "red" , main = "Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()


