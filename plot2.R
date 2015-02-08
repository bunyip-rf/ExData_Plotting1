library(datasets)

consume <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
consume$Date <- as.Date(consume$Date, format="%d/%m/%Y") ## Fix Date column to Date Class

consume <- consume[consume$Date >= as.Date("2007-02-01") & consume$Date <= as.Date("2007-02-02"),]  ## Cut down data to only the days we care about
consume$Date <- as.POSIXlt(paste(as.Date(consume$Date, format= "%d/%m/%Y"), consume$Time, sep=" ")) ## convert over columns to POSIXlt


png("plot2.png", width = 480, height = 480) ## open png device and save plot to file.
plot(consume$Date, consume$Global_active_power, type="l",  xlab=" ", ylab="Global Active Power (Kilowats)")
dev.off() ## Turn the lights off