#reading the datafile into R. 
filename <- "household_power_consumption.txt"

#Data Frame with 2 char classes, 7 numeric classes, and separated by ;.
df <- read.table(filename, header=TRUE,sep=";", 
                 colClasses=c("character", "character", 
                              rep("numeric",7)), na="?")

#Subset data for only Feb1-Feb2.
FebData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

#Further subsetting of day/time and for Column Global_active_power
datetime <- strptime(paste(FebData$Date, FebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
FebGlobal <- as.numeric(FebData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, FebGlobal, type="l", xlab=datetime, ylab="Global Active Power (kilowatts)")
dev.off()