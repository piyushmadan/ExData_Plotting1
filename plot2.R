# Read the file
data <-read.table("../household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#filtering on required date
data_filtered <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Data in Date Time Format 
data_in_dt_format<-strptime(paste(data_filtered$Date,data_filtered$Time),"%d/%m/%Y %T")


# making the plot in png
png(filename="figure/plot2.png",width=480,height=480,units="px")
plot(data_in_dt_format,data_filtered$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n")
lines(data_in_dt_format,data_filtered$Global_active_power)
dev.off()