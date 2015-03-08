# Read the file
data <-read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#filtering on required date
data_filtered <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]


#Data in Date Time Format 
data_in_dt_format<-strptime(paste(data_filtered$Date,data_filtered$Time),"%d/%m/%Y %T")

png(filename="figure/plot3.png",width=480,height=480,units="px")
# making the plot in png
plot(data_in_dt_format,data_filtered$Sub_metering_1	,"n", ylab="Energy sub metering", xlab="")

lines(data_in_dt_format,data_filtered$Sub_metering_1,col="black")
lines(data_in_dt_format,data_filtered$Sub_metering_2,col="red")
lines(data_in_dt_format,data_filtered$Sub_metering_3,col="blue")



legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch= "_", cex=1,col=c("black","red","blue"))
dev.off()