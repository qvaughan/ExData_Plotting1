# Retrieve data, load into variable named dt.
source('load_data.R')

# Create the PNG graphics device.
png('plot1.png', width=480, height=480)

# Create the histogram
hist(dt$Global_active_power, col='red', main="Global Active Power", xlab='Global Active Power (kilowatts)')

# Write the PNG file.
dev.off()