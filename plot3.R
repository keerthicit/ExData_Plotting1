#Author: Keerthi Murugesan Date: 22-Apr-18 

#plot3.R script to generate plot3.png for Exploratory Data Analysis Week 1 Course Porject

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


##Generating plot3 png device

png(filename = "plot3.png", width = 480, height = 480, units = "px")

##generating plot3

##plot sub_metering_1
with(readings, 
     plot(x = date, y = sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
     
##plot sub_metering_2
with(readings, 
     lines(date,sub_metering_2, type = "l" , col = "red"))
     
##plot sub_metering_3
with(readings, 
     lines(date,sub_metering_3, type = "l" , col = "blue"))

##add legend
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

        
##closing png device
dev.off()
