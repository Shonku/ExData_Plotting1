# step0: Understand data limits
#66638:1/2/2007;00:00:00;0.326;0.128;243.150;1.400;0.000;0.000;0.000
#69517:2/2/2007;23:59:00;3.680;0.224;240.370;15.200;0.000;2.000;18.000
# No. of rows to read = 69517-66638+1 = 2880

# step 1: get header and data
fn <- "./data/household_power_consumption.txt"
header <- read.table(fn, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
power_data <- read.table(fn, header=TRUE, sep=";",na.strings=c("?"),stringsAsFactors=F,skip = 66637, nrows = 2880)
colnames( power_data ) <- unlist(header)

# step 2:
# combine date time
date_time <-strptime(paste(power_data$Date, power_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# step 3:
# Make a grid, define figure
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# step 4
#figA
plot(date_time, power_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#figB
plot(date_time, power_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
#figC
plot(date_time, power_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time,power_data$Sub_metering_2, type="l", col="red")
lines(date_time,power_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"),bty="n")
#figD
plot(date_time, power_data$Global_reactive_power , type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()