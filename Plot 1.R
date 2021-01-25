#### Exploratory Data Analysis - Week 1 Project
## Plot 1

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


#### Plot 1

png(paste0(myPrj, "Plot 1.png"), height=480, width=480)
hist(dfp1$Global_active_power,
     col = "red",
     main = imain,
     xlab = iaxis)
dev.off()    
    
