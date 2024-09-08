###Exploratory data analysis project assignment 1
##Plot 2
#Load the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- download.file(url = url, destfile = "hh_power.zip")
unzip("hh_power.zip")
data <- read.table(file = "household_power_consumption.txt", header = FALSE, 
                   sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
head(data)
tail(data)

#Tidy dataset to work
library(dplyr)
library(lubridate)
names <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
names(data) <- names
data <- data |> mutate(date_time = as.POSIXct(dmy_hms(paste(date, time))))
str(data)

#Plot 2
png("plot2.png", width=480, height=480)
plot(data$date_time, data$global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()