#assume the data file located in working directory

#read data file
fn <- "household_power_consumption.txt"
df <- read.csv(fn, sep=";", na.string = "?", stringsAsFactors=FALSE)

#convert to Date type, then filter
df$date <- as.Date(df$Date, format="%d/%m/%Y")
df <- df[df$date >= as.Date("2007-02-01") & df$date <= as.Date("2007-02-02"), ]

#plot and save graph
png(filename="plot1.png", width=480, height=480, units="px", bg="transparent")
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


