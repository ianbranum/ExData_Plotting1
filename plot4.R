plot4 <- function() {
     if(length(dat1) == 0) {
          loaddata()
     }
     
     par(mfcol=c(2,2))
     plot2()
     plot3()
     
     ## Upper right plot
     xdata <- as.POSIXct(as.POSIXct(paste(dat1$Date, dat1$Time), format="%Y-%m-%d %H:%M:%S"))
     ydata <- dat1$Voltage
     
     plot(xdata, ydata, type="l", xlab="datetime", ylab="Voltage")
     
     ## Lower right plot
     ydata <- dat1$Global_reactive_power
     
     plot(xdata, ydata, type="l", xlab="datetime", ylab="Global reactive Power (kilowatts)")
     
     
         
     dev.copy(png, file="plot4.png")
     dev.off()
}


loaddata <- function() {
     ## Download and unzip file
     download.file(url= "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./data.zip")
     unzip("data.zip")
     
     ## Read file in
     dat <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, na.strings = c("?"))
     
     ## Convert String date into a Date
     dat[,1] <- as.Date(dat[,1], format="%d/%m/%Y")
     
     ##Subset data to get only 1-2Feb2007 readings
     dat1 <<- subset(dat, Date == as.Date("1/2/2007", format="%d/%m/%Y") | Date == as.Date("2/2/2007", format="%d/%m/%Y"))
}



