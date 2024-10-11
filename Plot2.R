##Loading the Data
household_power_consumption <- read.csv("~/household_power_consumption.txt", header=FALSE, sep=";") 
View(household_power_consumption) 
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
summary(data)

##Creating Data Subset
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),] 
GlobalActivePower <- as.numeric(subsetdata$Global_active_power) 
GlobalReactivePower <- as.numeric(subsetdata$Global_reactive_power) 
voltage <- as.numeric(subsetdata$Voltage) 
subMetering1 <- as.numeric(subsetdata$Sub_metering_1) 
subMetering2 <- as.numeric(subsetdata$Sub_metering_2) 
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

##Creating the Time Series Plot
timeseries <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(timeseries, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
