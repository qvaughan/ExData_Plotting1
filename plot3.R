# Retrieve data, load into variable named dt.
source('load_data.R')

# Create the PNG graphics device.
png('plot3.png', width=480, height=480)

# Create the plot.
plot(df$DateTime, df$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering', col='black')
points(df$DateTime, df$Sub_metering_2, type='l', col='red')
points(df$DateTime, df$Sub_metering_3, type='l', col='blue')
legend("topright", col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1)

# Write the PNG file.
dev.off()