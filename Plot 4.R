#### Exploratory Data Analysis - Week 1 Project
## Plot 4

#### Set Up ####
## Clear workspace
rm(list=ls())

## Packages
library(tidyverse)


#### Directories

myPrj <- dirname(rstudioapi::getSourceEditorContext()$path)
    myPrj <- paste0(myPrj,"/")

        
#### Data Input ####

dfpower <- read.table(paste0(myPrj,"household_power_consumption.txt"), 
                      header=TRUE,
                      na.strings = "?",
                      sep=";")

dfp1 <- dfpower %>%
    mutate_at(vars(3:9), as.numeric) %>%
    mutate(Date = as.Date(Date, format = "%d/%m/%Y")) %>%
    filter(Date >= "2007-02-01" & Date <= "2007-02-02") %>%
    mutate(datetime = as.POSIXct(paste(Date, Time)))
    
    
#### Plots ####

imain <- "Global Active Power"
iaxis <- "Global Active Power (kilowatts)"


#### Plot 4

## Save
png(paste0(myPrj, "Plot 4.png"), height=480, width=480)

## Parameters
par(mfrow=c(2,2))

## Top Left
plot(Global_active_power ~ datetime,
     data = dfp1,
     type = "l",
     ylab = iaxis,
     xlab = NA)

## Top Right
plot(Voltage ~ datetime,
     data = dfp1,
     type = "l",
     ylab = "Voltage (volt)")

## Bottom Left
plot(Sub_metering_1 ~ datetime,
     data = dfp1,
     type = "l",
     ylab = iaxis,
     xlab = NA)

lines(Sub_metering_2 ~ datetime,
      data = dfp1,
      col = 'Red')

lines(Sub_metering_3 ~ datetime,
      data = dfp1,
      col = 'Blue')

legend("topright", 
       col = c("black", "red", "blue"), 
       lwd = c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Bottom Right
plot(Global_reactive_power ~ datetime,
     data = dfp1,
     type = "l",
     ylab = "Global Reactive Power (kilowatts)")
dev.off()



