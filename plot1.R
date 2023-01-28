#Kindly decompress household_power_consumption file before running the script
#Reading the dataset and converting into dataframe
data=as.data.frame(read.csv("./household_power_consumption.txt",sep=";"))

#exploring the data
head(data)
str(data)

#Converting the Date variable to DATE format in the same column
data$Date=as.Date(as.vector(data$Date),"%d/%m/%Y")
#checking rows and cols
dim(data)

#subsetting as per the requirement
epc=data[data$Date<="2007-02-02" & data$Date >="2007-02-01",]
dim(epc)
str(epc)

#Converting variables from charactert to numeric
epc[c(3:8)]=sapply(epc[c(3:8)],as.double)

#Removing na
plot1_data=epc[!is.na(epc$Global_active_power),]

#Plotting the histogram
png("./plot1.png",width=480,height=480,units="px")
hist(plot1_data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

#exporting the Cleaned Data as Excel since every plot is a new script 
#This way it is easy to read the data and work
#library(writexl)
#write_xlsx(epc,"./finalised_Electric_power_consumption.xlsx")
