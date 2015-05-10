#reading the datafile into R. 
filename <- "household_power_consumption.txt"

#Data Frame with 2 char classes, 7 numeric classes, and separated by ;.
df <- read.table(filename, header=TRUE,sep=";", 
                 colClasses=c("character", "character", 
                              rep("numeric",7)), na="?")

#Subset data for only Feb1-Feb2.
FebData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]
datetime<-strptime(paste(FebData$Date, FebData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
FebGlobal <- as.numeric(FebData$Global_active_power)

#creating Legends and submetering views
subMetering1 <-as.numeric(FebData$Sub_metering_1)
subMetering2 <-as.numeric(FebData$Sub_metering_2)
subMetering3 <-as.numeric(FebData$Sub_metering_3)


##creating final plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2)) #allowing 4 plots to print to graphics device

#creating separate plots
plot(datetime, FebGlobal, type="l",xlab="",ylab="Global Active Power", cex=0.2)
plot(datetime,as.numeric(FebData$Voltage),type="l", xlab=datetime, ylab="Voltage")

plot(datetime, as.numeric(FebData$Global_reactive_power), type="l", xlab=datetime, ylab="Global Reactive Power")

plot(datetime, subMetering1, type="l",ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=,lwd=2,col=c("black","red","blue"))
dev.off()