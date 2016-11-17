#Reading data
file<-"household_power_consumption.txt"
Data <- read.table(file, header = TRUE, sep = ";", dec = ".", stringsAsFactors=FALSE)

#Subsetting Dates between 1/2/2007 and 2/2/2007
Date_subset <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#Global active power -> conversion to numeric
Global_active_power_num <- as.numeric(Date_subset$Global_active_power)

#str(subSetData)
Date_time <- strptime(paste(Date_subset$Date, Date_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plotting to png
png("plot2.png", width=480, height=480)
plot(Date_time, Global_active_power_num, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


