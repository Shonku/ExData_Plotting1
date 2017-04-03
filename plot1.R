# step0: Understand data limits
#66638:1/2/2007;00:00:00;0.326;0.128;243.150;1.400;0.000;0.000;0.000
#69517:2/2/2007;23:59:00;3.680;0.224;240.370;15.200;0.000;2.000;18.000
# No. of rows to read = 69517-66638+1 = 2880

# step 1: get header and data
fn <- "./data/household_power_consumption.txt"
header <- read.table(fn, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
power_data <- read.table(fn, header=TRUE, sep=";",na.strings=c("?"),stringsAsFactors=F,skip = 66637, nrows = 2880)
colnames( power_data ) <- unlist(header)

#step 2: plot
png("plot1.png", width=480, height=480)
hist(power_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
