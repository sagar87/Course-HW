household  <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
household$Date  <- as.Date(household$Date, "%d/%m/%Y")
subdata  <- subset(household, household$Date == "2007-02-01" | household$Date == "2007-02-02")


png(file="plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
DT  <- strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
subdata  <-  cbind(subdata, DT) 
subdata$Global_active_power  <- as.numeric(subdata$Global_active_power)
subdata$Sub_metering_1  <- as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2  <- as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3  <- as.numeric(subdata$Sub_metering_3)
subdata$Voltage  <- as.numeric(subdata$Voltage)
subdata$Global_reactive_power  <- as.numeric(subdata$Global_reactive_power)

plot(Global_active_power ~ DT, subdata, type="l", ylab="Global Active Power", xlab="")
plot(Voltage ~ DT, subdata, type="l", ylab="Voltage", xlab="datetime")

with(subdata, {
    plot(DT, Sub_metering_1, type="l", ylab="Energy sub metering")
    lines(DT, Sub_metering_2, type="l", col="red")
    lines(DT, Sub_metering_3, type="l", col="blue") 
    legend("topright", pch=21, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    #plot(DT, Sub_metering_2, type="l", col="red") 
    #plot(DT, Sub_metering_3, type="l", col="blue") 
})
plot(Global_reactive_power ~ DT, subdata, type="l", ylab="Voltage", xlab="datetime")

dev.off()
