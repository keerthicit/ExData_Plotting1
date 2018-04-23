#Author: Keerthi Murugesan Date: 22-Apr-18 

#plot2.R script to generate plot2.png for Exploratory Data Analysis Week 1 Course Porject

##Load library
library(data.table)
library(dplyr)


##Read the file in data folder only for rows containing data for 1/2/2007 and 2/2/2007 and assing to readings

readings <- tbl_df(fread("./data/household_power_consumption.txt", header = FALSE, na.strings = "?", skip = 66637, nrows = 2880))

##reading names from the file and converting all names to lowercase and assign names to readings

names(readings) <- tolower(fread("./data/household_power_consumption.txt", header = FALSE, na.strings = "?", nrows = 1)[1,])

##convert date variable to date class

readings$date <- strptime(paste(readings$date, readings$time), "%d/%m/%Y %H:%M:%S")

##Drop time column

readings <- select(readings, -time)


##Generating plot2 png device

png(filename = "plot2.png", width = 480, height = 480, units = "px")

##generating plot2

with(readings, plot(x = date, y = global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

##closing png device
dev.off()