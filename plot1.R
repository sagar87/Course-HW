household  <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
household$Date  <- as.Date(household$Date, "%d/%m/%Y")

png(file="plot1.png", width=480, height=480)
subdata  <- subset(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")
subdata$Global_active_power  <- as.numeric(subdata$Global_active_power)
hist(subdata$Global_active_power/1000, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")
dev.off()
