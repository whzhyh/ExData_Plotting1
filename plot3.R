#assume the data file located in working directory

#read data file
fn <- "household_power_consumption.txt"
df <- read.csv(fn, sep=";", na.string = "?", stringsAsFactors=FALSE)

#convert Date, Time togeter to Time type, then filter
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df <- subset(df, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#plot and save graph
png(filename="plot3.png", width=480, height=480, units="px", bg="transparent")
with(df, {
    plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    points(DateTime, Sub_metering_2, type="l", col="red")
    points(DateTime, Sub_metering_3, type="l", col="blue")    
    legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

