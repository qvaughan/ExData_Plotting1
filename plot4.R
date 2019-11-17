# Retrieve data, load into variable named dt.
source('load_data.R')

# Create the PNG graphics device.
png('plot4.png', width=480, height=480)

# Set up to write 4 figures aligned in 2 rows, 2 columns.
par(mfcol = c(2, 2))

# Create the first plot.
plot(df$DateTime, df$Global_active_power, type='l', xlab='', ylab='Global Active Power')

# Create the second plot.
plot(df$DateTime, df$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering', col='black')
points(df$DateTime, df$Sub_metering_2, type='l', col='red')
points(df$DateTime, df$Sub_metering_3, type='l', col='blue')
legend("topright", col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, bty='n')

# Create the third plot.
plot(df$DateTime, df$Voltage, type='l', xlab='datetime', ylab='Voltage')

# Create the fourth plot.
plot(df$DateTime, df$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

# Write the PNG file.
dev.off()