#install.packages("readxl")
library("readxl")

#Reading the filtered file created using Plot1.R script
plot2_data=read_xlsx("./finalised_Electric_power_consumption.xlsx")

#Concatenating datetime variable and converting into Datetime format
plot2_data$datetime=strptime(paste(as.character(plot2_data$Date),plot2_data$Time),"%Y-%m-%d %H:%M:%S")
str(plot2_data)

#Plotting
png("./plot2.png",width=480,height=480,units="px")
with(plot2_data,plot(datetime,Global_active_power,type="l",lwd=0.5,xlab='',ylab="Global Active Power (kilowatts)"))
dev.off()
