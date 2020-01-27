headers = read.table("household_power_consumption.txt", 
                     sep=";",header = F, nrows = 1, as.is = T)
# reading index 2007-02-01 to 2007-02-02 only
power_consumption <- read.table("household_power_consumption.txt", 
                                sep = ";", header = F, skip = 66637, nrows = 2880)
colnames(power_consumption) <- headers

power_consumption$Time <- paste(power_consumption$Date, power_consumption$Time, sep = " ") 
power_consumption$Time <- strptime(power_consumption$Time, "%d/%m/%Y %H:%M:%S",tz = "GMT")

png("plot2.png",width = 480, height = 480)
with(power_consumption,plot(Time, Global_active_power, 
                            type = "l",
                            xlab = "",
                            ylab = "Global Active Power (kilowatts)"))
dev.off() 