# Read the file
data <-read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#filtering on required date
data_filtered <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]


# making the plots in png
png(filename="figure/plot1.png",width=480,height=480,units="px")
hist(data_filtered$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()