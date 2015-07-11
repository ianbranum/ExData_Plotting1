plot1 <- function() {
     if(length(dat1) == 0) {
          loaddata()
     }
     
     hist(dat1$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")
     dev.copy(png, file="plot1.png")
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



