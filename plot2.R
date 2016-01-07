#assume the data file located in working directory

#read data file
fn <- "household_power_consumption.txt"
df <- read.csv(fn, sep=";", na.string = "?", stringsAsFactors=FALSE)

#convert Date, Time togeter to Time type, then filter
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
df <- subset(df, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

#plot and save graph
png(filename="plot2.png", width=480, height=480, units="px", bg="transparent")
plot(df$DateTime, df$Global_active_power, type="l" ,xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

