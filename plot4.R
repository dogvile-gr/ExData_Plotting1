setwd("~/GitHub/ExData_Plotting1")###setting working directory
consumption_data <- read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?");
consumption_data$Date <- as.Date(consumption_data$Date, format="%d/%m/%Y")#converting dates characters
library(dplyr)
filter_consumption_data <- filter(consumption_data, consumption_data$Date >= as.Date("2007-02-01"), 
                                  consumption_data$Date <= as.Date("2007-02-02"))##conditional subseting

## Plot 4
datetime <- paste(as.Date(filter_consumption_data$Date), filter_consumption_data$Time)
filter_consumption_data$Datetime <- as.POSIXct(datetime)

par(mfrow = c(2, 2))


plot(filter_consumption_data$Global_active_power~filter_consumption_data$Datetime, type="l",
     ylab="Global Active Power", xlab="")
plot(filter_consumption_data$Voltage~filter_consumption_data$Datetime, type="l",
     ylab="Voltage", xlab="datetime")

plot(filter_consumption_data$Datetime,filter_consumption_data$Sub_metering_1,type="l",
     col="black",ylab="Energy sub metering", xlab="")

lines(filter_consumption_data$Datetime,filter_consumption_data$Sub_metering_2,col="blue")
lines(filter_consumption_data$Datetime,filter_consumption_data$Sub_metering_3,col="red")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(filter_consumption_data$Global_reactive_power~filter_consumption_data$Datetime, type="l",
     ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
