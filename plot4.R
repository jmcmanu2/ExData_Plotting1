# Read in the data
elec_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = c("?",""))

# Fix date/time variables
elec_data$Date <- as.Date(elec_data$Date, format = "%d/%m/%Y") 
elec_data$temp <- paste(elec_data$Date, elec_data$Time)  
elec_data$Time <- strptime(elec_data$temp, format = "%Y-%m-%d %H:%M:%S")  

# Subset the data
elec_subset <- subset(elec_data, Date == "2007-02-01" | Date == "2007-02-02")

# Plot four energy plots
png("ExData_Plotting1/plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

## Plot 1: global active power
plot(elec_subset$Time, elec_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## Plot 2: voltage
plot(elec_subset$Time, elec_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Plot 3: energy sub metering
plot(elec_subset$Time, elec_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(elec_subset$Time, elec_subset$Sub_metering_2, col = "red")
lines(elec_subset$Time, elec_subset$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

## Plot 4: global reactive power
plot(elec_subset$Time, elec_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()