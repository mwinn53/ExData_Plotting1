rm(list = ls())

## Read in the data file and subset the rows "^1/2/2007;" and "^2/2/2007;" into their own data frame
file <- "./household_power_consumption.txt"
tbl <- read.table(file, sep = ";", header = TRUE, stringsAsFactors = FALSE)
data <- subset(tbl, grepl("^(1/2/2007)|^(2/2/2007)", tbl$Date))

## Clear the unecessary data out of memory
rm(tbl)

data$Global_active_power <- (as.numeric(data$Global_active_power))

png(filename = "plot1.png",
    width = 480, 
    height = 480, 
    units = "px"
)

hist(data$Global_active_power, 
     main = "Global Active Power", 
     ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red"
)

dev.off()

