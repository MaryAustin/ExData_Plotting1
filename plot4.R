plot4 <- function(){
  
  myData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), strip.white=TRUE, na.strings =c("?", ""))

  myData$DateTime = strptime( apply( myData[ , c("Date","Time") ], 1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

  mySubdata <- subset(myData, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

  png("plot4.png",width=480,height=480,units = "px")
  
  par(mfrow=c(2,2))
  
  with(mySubdata, plot(DateTime, Global_active_power, ylab = "Global Active Power", xlab= "", type = "l"))
  
  with(mySubdata, plot(DateTime, Voltage, type ="l", col = "black", xlab = "datetime"))
  
  with(mySubdata, plot(DateTime, Sub_metering_1, ylab = "Energy sub metering", xlab= "", type = "n"))
  
  with(mySubdata,lines(DateTime, Sub_metering_1, col = "black"))
  with(mySubdata,lines(DateTime, Sub_metering_2, col = "red"))
  with(mySubdata,lines(DateTime, Sub_metering_3, col = "blue"))
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue" ), lty=c(1,1), bty = "n"
  )
  
  with(mySubdata, plot(DateTime, Global_reactive_power, type ="l", col = "black", xlab = "datetime"))
  
  dev.off()
  
  
  
}