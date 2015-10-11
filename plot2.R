# Read in the data
elec_data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = c("?",""))

# Fix date/time variables
elec_data$Date <- as.Date(elec_data$Date, format = "%d/%m/%Y") 
elec_data$temp <- paste(elec_data$Date, elec_data$Time)  
elec_data$Time <- strptime(elec_data$temp, format = "%Y-%m-%d %H:%M:%S")  

# Subset the data
elec_subset <- subset(elec_data, Date == "2007-02-01" | Date == "2007-02-02")

# Plot global active power usage over the subset of days
png("ExData_Plotting1/plot2.png", width = 480, height = 480)
plot(elec_subset$Time, elec_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()