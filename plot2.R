plot2 <- function() {
  ## read in the data
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  ## convert dates to R Dates for subsetting
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  ## subset the data to the two days of interest (the dates 2007-02-01 and 2007-02-02)
  data <- data[(data$Date >= as.Date("2007-02-01")) & (data$Date <= as.Date("2007-02-02")), ]
  ## convert the dates and times to POSIX date/times
  data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  ## specify the PNG device
  png(file = "plot2.png", width = 480, height = 480)
  ## plot the data
  with(data, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
  ## write out the plot file
  dev.off()
}
