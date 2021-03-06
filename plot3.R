library(datasets)

consume <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
consume$Date <- as.Date(consume$Date, format="%d/%m/%Y") ## Fix Date column to Date Class

consume <- consume[consume$Date >= as.Date("2007-02-01") & consume$Date <= as.Date("2007-02-02"),]  ## Cut down data to only the days we care about
consume$Date <- as.POSIXlt(paste(as.Date(consume$Date, format= "%d/%m/%Y"), consume$Time, sep=" ")) ## convert over columns to POSIXlt


png("plot3.png", width = 480, height = 480) ## open png device and save plot to file.
plot(consume$Date, consume$Sub_metering_1, type="n", lwd=1, 
     ylim=c(0, max(c(consume$Sub_metering_1, consume$Sub_metering_2, consume$Sub_metering_3))),
     xlab=" ", ylab="Energy Sub metering")

lines(consume$Date, consume$Sub_metering_1, col="black") ## Put in the lines
lines(consume$Date, consume$Sub_metering_2, col="red")
lines(consume$Date, consume$Sub_metering_3, col="blue")

legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() ## Turn the lights off