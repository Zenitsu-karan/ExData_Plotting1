library("readxl")

#Reading the filtered file created using Plot1.R script
plot3_data=read_xlsx("./finalised_Electric_power_consumption.xlsx")

#Concatenating datetime variable and converting into Datetime format
plot3_data$datetime=strptime(paste(as.character(plot3_data$Date),plot3_data$Time),"%Y-%m-%d %H:%M:%S")
str(plot3_data)

png("./plot3.png",width=480,height=480,units="px")
with(plot3_data,plot(datetime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
lines(plot3_data$datetime,plot3_data$Sub_metering_2,type="l",col="red")
lines(plot3_data$datetime,plot3_data$Sub_metering_3,type="l",col="blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
dev.off()

