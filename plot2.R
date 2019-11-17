# Retrieve data, load into variable named dt.
source('load_data.R')

# Create the PNG graphics device.
png('plot2.png', width=480, height=480)

# Create the plot
plot(dt$DateTime, dt$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)' )

# Write the PNG file.
dev.off()