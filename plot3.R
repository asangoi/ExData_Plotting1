## Read the table and convert the time/date fields
hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";",colClasses=c("character", "character",rep("numeric",7)) ,col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
datetime <- paste(hpc$Date, hpc$Time)
hpc <- cbind(datetime=strptime(datetime, "%d/%m/%Y %H:%M:%S"), hpc)

## Plot in a png device with the required pixel count
png( "plot3.png", width = 480, height = 480 )
par(bg="transparent")
with(hpc,plot(datetime,Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(hpc, points(datetime,Sub_metering_1, type="l", col="black"))
with(hpc, points(datetime,Sub_metering_2, type="l",col="red"))
with(hpc, points(datetime,Sub_metering_3, type="l",col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()