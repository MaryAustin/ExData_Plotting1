plot1 <- function(){
  
  myData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), strip.white=TRUE, na.strings =c("?", ""))

  myData$DateTime = strptime( apply( myData[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

  mySubdata <- subset(myData, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

  png("plot1.png",width=480,height=480,units = "px")
  with(mySubdata, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
  dev.off()
  
}