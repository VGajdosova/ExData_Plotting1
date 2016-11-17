#Reading data
file<-"household_power_consumption.txt"
Data <- read.table(file, header = TRUE, sep = ";", dec = ".", stringsAsFactors=FALSE, na.strings = "?")

#Subsetting Dates between 1/2/2007 and 2/2/2007
Date_subset <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#Global active power -> conversion to numeric
Global_active_power_num <- as.numeric(Date_subset$Global_active_power)

png("plot1.png", width=480, height=480)
hist(Global_active_power_num, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()