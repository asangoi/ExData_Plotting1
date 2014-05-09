## Read the table and convert the time/date fields
hpc <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";",colClasses=c("character", "character",rep("numeric",7)) ,col.names = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";")))
datetime <- paste(hpc$Date, hpc$Time)
hpc <- cbind(datetime=strptime(datetime, "%d/%m/%Y %H:%M:%S"), hpc)

## Plot the histogram in a png device with the required pixel count
png( "plot1.png", width = 480, height = 480 )
par(bg="transparent")
hist(hpc$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()