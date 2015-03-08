# Read the file
data <-read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#filtering on required date
data_filtered <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]


#Data in Date Time Format 
data_in_dt_format<-strptime(paste(data_filtered$Date,data_filtered$Time),"%d/%m/%Y %T")

# making the plot in png
png(filename="figure/plot4.png",width=480,height=480,units="px")
par(mfrow= c(2,2))
plot(data_in_dt_format,data_filtered$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data_in_dt_format,data_filtered$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data_in_dt_format,data_filtered$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
points(data_in_dt_format,data_filtered$Sub_metering_1, col="black", type="l")
points(data_in_dt_format,data_filtered$Sub_metering_2, col="red", type="l")
points(data_in_dt_format,data_filtered$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch= "_", cex=.5,col=c("black","red","blue"))
plot(data_in_dt_format,data_filtered$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()