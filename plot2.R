# Exploratory Data Analysis - - Week1 Project
#
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in Feb, 2007.
# Your task is to reconstruct the following plots below, all of which were constructed using the base plotting
# system.
# 
# First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1
# 
# For each plot you should:
# -Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# -Name each of the plot files as plot1.png, plot2.png, etc.
# -Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot,
#  i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data
#  so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
# -Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
#  When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your
#  repository is up to date. There should be four PNG files and four R code files, a total of eight files in the
#  top-level folder of the repo.
# 
# 
# Load Data source from web (if not already in current working directory)
sourceFile <- "./exdata-data-household_power_consumption.zip"
sourceURL  <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
sourceTXT  <- "./household_power_consumption.txt"

if(!file.exists(sourceTXT)) {
    if(!file.exists(sourceFile)) {
        mytemp <- tempfile()
        download.file(sourceURL, mytemp)
        file <- unzip(mytemp)
        unlink(mytemp)
    }
        file <- unzip(sourceFile)
}
# Read and process data
df.power <- read.table(file, header = TRUE, sep = ";", na.strings = "?")
df.power$Date <- as.Date(df.power$Date, format = "%d/%m/%Y")
df <- df.power[(df.power$Date == "2007-02-01") | (df.power$Date == "2007-02-02"), ]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df <- transform(df, timestamp = as.POSIXct(paste(Date, Time)), "GMT")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
# # Create chart Plot1 chart
# hist(df$Global_active_power, main = paste("Global Active Power"), col = "red", 
#      xlab = "Global Active Power (kilowatts)")
# dev.copy(png, file = "plot1.png", width = 480, height = 480)
# dev.off()
# Create Plot2 chart
plot(df$timestamp, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

