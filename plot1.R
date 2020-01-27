headers = read.table("household_power_consumption.txt", 
                     sep=";",header = F, nrows = 1, as.is = T)
# reading index 2007-02-01 to 2007-02-02 only
power_consumption <- read.table("household_power_consumption.txt", 
                                sep = ";", header = F, skip = 66637, nrows = 2880)
colnames(power_consumption) <- headers


png("plot1.png",width = 480, height = 480)
with(power_consumption,hist(Global_active_power, 
                            col = "Red",
                            xlab = "Global Active Power (kilowatts)",
                            main = "Global Active Power"))
dev.off() 