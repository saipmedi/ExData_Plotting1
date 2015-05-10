#reading the datafile into R 
filename <- "household_power_consumption.txt"

#DF with 2 char classes, 7 numeric classes, and separated by ;
df <- read.table(filename, header=TRUE,sep=";", 
                 colClasses=c("character", "character", 
                 rep("numeric",7)), na="?")

#subset data for only feb1-feb2
FebData <- df[df$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width=480, height=480)

hist(FebData$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()

