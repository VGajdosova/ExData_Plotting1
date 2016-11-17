#Reading data
file<-"household_power_consumption.txt"
Data <- read.table(file, header = TRUE, sep = ";", dec = ".", stringsAsFactors=FALSE)

#Subsetting Dates between 1/2/2007 and 2/2/2007
Date_subset <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#Global active power & Sub_metering_1-3 -> conversion to numeric
Global_active_power_num <- as.numeric(Date_subset$Global_active_power)
Sub_metering_1_num <- as.numeric(Date_subset$Sub_metering_1)
Sub_metering_2_num <- as.numeric(Date_subset$Sub_metering_2)
Sub_metering_3_num <- as.numeric(Date_subset$Sub_metering_3)
Voltage_num <- as.numeric(Date_subset$Voltage)
Global_reactive_power_num <- as.numeric(Date_subset$Global_reactive_power)
#Date_time conversion
Date_time <- strptime(paste(Date_subset$Date, Date_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plotting to png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# Topleft plot
plot(Date_time, Global_active_power_num, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
# Topright plot
plot(Date_time, Voltage_num, type = "l", xlab="datetime", ylab="Voltage")
# Bottomleft plot
plot(Date_time, Sub_metering_1_num, type = "l", xlab="", ylab="Energy sub metering")
lines(Date_time, Sub_metering_2_num, type = "l", col = "red")
lines(Date_time, Sub_metering_3_num, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)
# Bottomright plot
plot(Date_time, Global_reactive_power_num, type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()



