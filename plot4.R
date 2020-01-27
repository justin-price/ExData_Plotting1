headers = read.table("household_power_consumption.txt", 
                     sep=";",header = F, nrows = 1, as.is = T)
# reading index 2007-02-01 to 2007-02-02 only
power_consumption <- read.table("household_power_consumption.txt", 
                                sep = ";", header = F, skip = 66637, nrows = 2880)
colnames(power_consumption) <- headers

power_consumption$Time <- paste(power_consumption$Date, power_consumption$Time, sep = " ") 
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
power_consumption$Time <- strptime(power_consumption$Time, "%d/%m/%Y %H:%M:%S",tz = "GMT")

png("plot4.png",width = 480, height = 480)

par(mfcol=c(2,2))

with(power_consumption,plot(Time, Global_active_power, 
                            type = "l",
                            xlab = "",
                            ylab = "Global Active Power (kilowatts)"))

with(power_consumption, plot(Time, Sub_metering_1, 
                             type = "l",
                             xlab = "",
                             ylab = "Energy sub metering"))
with(power_consumption, lines(Time, Sub_metering_2, col = "Red"))
with(power_consumption, lines(Time, Sub_metering_3, col = "Blue"))
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("Black","Red","Blue"), 
       lty=1)

with(power_consumption,plot(Time, Voltage, 
                            type = "l",
                            xlab = "datetime",
                            ylab = "Voltage"))

with(power_consumption,plot(Time, Global_reactive_power, 
                            type = "l",
                            xlab = "datetime",
                            ylab = "Global_reactive_power"))

dev.off() 