library(data.table)

# Check if household_power_consumption.zip already exists, if not download it.
if (!file.exists('household_power_consumption.zip')) {
  print('downloading from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip')
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
} else {
  print('household_power_consumption.zip already exists, no files will be downloaded.')
}
  
# Check if household_power_consumption.txt exists, if not, unzip household_power_consumption.zip
if (!file.exists('household_power_consumption.txt')) {
  print('unzipping household_power_consumption.zip')
  unzip('household_power_consumption.zip')
} else {
  print('household_power_consumption.txt already exists, no files will be unzipped.')
}


# Read household_power_consumtion.txt into a data.table.
dt <- fread('household_power_consumption.txt', sep=';')

# Select only the records with a date on Feb 1 or 2 of 2007.
dt <- dt[grep('^[12]/2/2007', dt$Date),]

# Create a new column named DateTime that parses the date and time columns into a POSIXct object.
dt$DateTime <- as.POSIXct(paste(dt$Date, dt$Time), format='%d/%m/%Y %H:%M:%S')

# Convert the other used columns to double.
dt$Global_active_power <- as.double(dt$Global_active_power)
dt$Sub_metering_1 <- as.double(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.double(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.double(dt$Sub_metering_3)
dt$Global_reactive_power <- as.double(dt$Global_reactive_power)
