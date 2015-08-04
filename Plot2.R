## set working directory to the local folder
setwd("C:\\Users\\Mayuri\\Documents\\R\\DataScienceCourse\\rprog_data_EDA")

## load data into a variable 
hhpc_data <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings=NA,
                      colClasses = c(rep("character", 9)))

## remove year part to support the date conversion
hhpc_data$Date <- gsub("/20", "/", hhpc_data$Date)

## create a newDT column with concatinated Date and Time columns
hhpc_data$newDT <- strptime(paste(hhpc_data$Date, hhpc_data$Time, sep=" "), "%d/%m/%y %H:%M:%S")

## format Date column to the Date object
hhpc_data$Date <- as.Date(hhpc_data$Date, "%d/%m/%y")

## format Time column to the Time object
hhpc_data$Time <- strptime(hhpc_data$Time, "%H:%M:%S")

## extract needed data into hhpc1_data variable
hhpc1_data <- subset(hhpc_data, Date==as.Date("01/02/07", "%d/%m/%y") | Date==as.Date("02/02/07", "%d/%m/%y"))

## replace all '?' values with #NA
hhpc1_data[] <- lapply(hhpc1_data, function(x) gsub("\\?", "#NA", x))

## set the file format to png with width and height to 480 pixels
png(filename="Plot2.png", width = 480, height = 480, units = "px")

##hist(as.numeric(hhpc1_data$Global_active_power), xlab = "Global Active power(kilowatts)", 
##     col="red", main = "Global Active Power")

## plot the graph
plot(as.POSIXct(hhpc1_data$newDT, tz="UCT"), as.numeric(hhpc1_data$Global_active_power), type = "l", col="red", xlab="", ylab="Global Active Power(kilowatts)")

## close the device which will save the graph to the file set above
dev.off()
