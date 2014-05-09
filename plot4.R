## Read the table and convert the time/date fields
hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";",colClasses=c("character", "character",rep("numeric",7)) ,col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
datetime <- paste(hpc$Date, hpc$Time)
hpc <- cbind(datetime=strptime(datetime, "%d/%m/%Y %H:%M:%S"), hpc)

## Plot in a png device with the required pixel count
png("plot4.png", width = 480, height = 480)
par(bg="transparent", mfcol=c(2,2))

# sub-plot1
plot(hpc$datetime,hpc$Global_active_power,type="l", ylab = "Global Active Power",xlab="")

# sub-plot2
with(hpc,plot(datetime,Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(hpc, points(datetime,Sub_metering_1, type="l", col="black"))
with(hpc, points(datetime,Sub_metering_2, type="l",col="red"))
with(hpc, points(datetime,Sub_metering_3, type="l",col="blue"))
legend("topright", lty=1, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# sub-plot3
plot(hpc$datetime,hpc$Voltage,type="l", ylab = "Voltage",xlab="datetime")

# sub-plot4
plot(hpc$datetime,hpc$Global_reactive_power,type="l", ylab = "Global_reactive_power",xlab="datetime")

dev.off()