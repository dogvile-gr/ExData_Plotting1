
setwd("~/GitHub/ExData_Plotting1")###setting working directory
consumption_data <- read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?");
consumption_data$Date <- as.Date(consumption_data$Date, format="%d/%m/%Y")#converting dates characters
library(dplyr)
filter_consumption_data <- filter(consumption_data, consumption_data$Date >= as.Date("2007-02-01"), 
                                  consumption_data$Date <= as.Date("2007-02-02"))##conditional subseting

## Plot 1
hist(filter_consumption_data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")####histogram

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


    