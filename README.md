## Introduction
## Download the raw data file
## Loading the Data
> household_power_consumption <- read.csv("~/household_power_consumption.txt", header=FALSE, sep=";")
>   View(household_power_consumption)
> print
> data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
> summary(data)

## Creating Datasubset
> subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
> GlobalActivePower <- as.numeric(subsetdata$Global_active_power)
> GlobalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
> voltage <- as.numeric(subsetdata$Voltage)
> subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
> subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
> subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

## Create a Histogram
> hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
> ![image](https://github.com/user-attachments/assets/335665de-4495-43f7-83fc-7e9778165c32)


## Create a Time Series Plot
> timeseries <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
> plot(timeseries, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
>![image](https://github.com/user-attachments/assets/9989a059-85d7-48eb-8a6d-52a3f39a8ed5)


## Create Submetering Plots
> plot(timeseries, subMetering1, type="l", ylab="Energy Submetering", xlab="")
> lines(timeseries, subMetering2, type="l", col="red")
> lines(timeseries, subMetering3, type="l", col="blue")
> legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
> ![image](https://github.com/user-attachments/assets/1898a183-9493-455c-be98-c7a354cfca91)

## Create Multiple Dot
> par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
> # First plot
> plot(timeseries, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
> # Second plot
> plot(timeseries, voltage, type="l", xlab="datetime", ylab="Voltage")
> # Third plot
> plot(timeseries, subMetering1, type="l", ylab="Energy Submetering", xlab="")
> lines(timeseries, subMetering2, type="l", col="red")
> lines(timeseries, subMetering3, type="l", col="blue")
> legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
> # Fourth plot
> plot(timeseries, GlobalActivePower, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)
> ![image](https://github.com/user-attachments/assets/98a51e15-3c88-418a-8e38-0fde42d016ea)









