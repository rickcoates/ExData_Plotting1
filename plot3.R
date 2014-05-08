plot3 <- function() {
  ## read in the data
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  ## convert dates to R Dates for subsetting
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  ## subset the data to the two days of interest (the dates 2007-02-01 and 2007-02-02)
  data <- data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]
  ## convert the dates and times to POSIX date/times
  data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  ## specify the PNG device
  png(file = "plot3.png", width = 480, height = 480)
  ## plot the data
  with(data, plot(Time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
  with(data, lines(Time, Sub_metering_2, type="l", col="red"))
  with(data, lines(Time, Sub_metering_3, type="l", col="blue"))
  legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))  ## write out the plot file
  dev.off()
}
