setwd("~/GitHub/ExData_Plotting1")###setting working directory
consumption_data <- read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?");
consumption_data$Date <- as.Date(consumption_data$Date, format="%d/%m/%Y")#converting dates characters
library(dplyr)
filter_consumption_data <- filter(consumption_data, consumption_data$Date >= as.Date("2007-02-01"), 
                                  consumption_data$Date <= as.Date("2007-02-02"))##conditional subseting

## Plot 1

datetime <- paste(as.Date(filter_consumption_data$Date), filter_consumption_data$Time)
filter_consumption_data$Datetime <- as.POSIXct(datetime)
## Plot 2
plot(filter_consumption_data$Global_active_power~filter_consumption_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
