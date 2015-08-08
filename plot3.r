rm(list = ls())

## Read in the data file and subset the rows "^1/2/2007;" and "^2/2/2007;" into their own data frame
file <- "./household_power_consumption.txt"
tbl <- read.table(file, sep = ";", header = TRUE, stringsAsFactors = FALSE)
data <- subset(tbl, grepl("^(1/2/2007)|^(2/2/2007)", tbl$Date))

## Clear the unecessary data out of memory
rm(tbl)

data$Sub_metering_1 <- (as.numeric(data$Sub_metering_1))
data$Sub_metering_2 <- (as.numeric(data$Sub_metering_2))
data$Sub_metering_3 <- (as.numeric(data$Sub_metering_3))

png(filename = "plot3.png",
     width = 480, 
      height = 480, 
      units = "px"
)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data$datetime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

plot(data$datetime, 
     data$Sub_metering_1, 
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")

lines(data$datetime, data$Sub_metering_1, col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

