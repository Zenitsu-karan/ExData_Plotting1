library("readxl")

#Reading the filtered file created using Plot1.R script
plot4_data=read_xlsx("./finalised_Electric_power_consumption.xlsx")

#Concatenating datetime variable and converting into Datetime format
plot4_data$datetime=strptime(paste(as.character(plot4_data$Date),plot4_data$Time),"%Y-%m-%d %H:%M:%S")
str(plot4_data)


png(file="./plot4.png")
par(mfrow=(c(2,2)),mar=c(4,4,1,2))
with(plot4_data,plot(datetime,Global_active_power,type='l',ylab="Global Active Power",xlab=""))

with(plot4_data,plot(datetime,Voltage,ylab="Voltage",xlab="datetime",type='l'))

with(plot4_data,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
lines(plot4_data$datetime,plot4_data$Sub_metering_2,type="l",col="red")
lines(plot4_data$datetime,plot4_data$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

with(plot4_data,plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power",lwd=0.5))
dev.off()
